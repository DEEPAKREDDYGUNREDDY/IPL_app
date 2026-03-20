package com.example.RCB_FanPage.service;

import com.example.RCB_FanPage.Entities.MatchEntity;
import com.example.RCB_FanPage.Entities.SeasonEntity;
import com.example.RCB_FanPage.Entities.TeamEntity;
import com.example.RCB_FanPage.Repositories.MatchRepository;
import com.example.RCB_FanPage.Repositories.SeasonRepository;
import com.example.RCB_FanPage.Repositories.TeamRepository;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.nio.file.Files;
import java.time.LocalDate;
import java.util.Map;
import java.util.Optional;

@Service
public class IplImportService {

    private final ObjectMapper objectMapper;
    private final TeamRepository teamRepository;
    private final SeasonRepository seasonRepository;
    private final MatchRepository matchRepository;

    public IplImportService(ObjectMapper objectMapper,
                            TeamRepository teamRepository,
                            SeasonRepository seasonRepository,
                            MatchRepository matchRepository) {
        this.objectMapper = objectMapper;
        this.teamRepository = teamRepository;
        this.seasonRepository = seasonRepository;
        this.matchRepository = matchRepository;
    }

    @Transactional
    public void importAll(String rootPath) {
        File root = new File(rootPath);
        if (!root.exists() || !root.isDirectory()) {
            throw new IllegalArgumentException("Invalid IPL data path: " + rootPath);
        }

        File[] files = root.listFiles((dir, name) -> name.toLowerCase().endsWith(".json"));
        if (files == null || files.length == 0) {
            System.out.println("❌ No JSON files found in: " + rootPath);
            return;
        }

        System.out.println("✅ Found JSON files: " + files.length);

        int inserted = 0, skippedExisting = 0, skippedNoSeason = 0, skippedNoTeams = 0, failed = 0;

        for (File f : files) {
            try {
                Long matchId = parseMatchIdFromFilename(f.getName());
                if (matchRepository.existsById(matchId)) {
                    skippedExisting++;
                    continue;
                }

                JsonNode rootNode = objectMapper.readTree(Files.readString(f.toPath()));
                JsonNode info = rootNode.path("info");
                if (info.isMissingNode() || info.isNull()) {
                    failed++;
                    continue;
                }

                // seasonYear
                Integer seasonYear = null;
                JsonNode seasonNode = info.get("season");
                if (seasonNode != null && !seasonNode.isNull()) {
                    if (seasonNode.isInt()) {
                        seasonYear = seasonNode.asInt();
                    } else {
                        String seasonText = seasonNode.asText().trim();
                        if (seasonText.contains("/")) {
                            // Handle split-year format like "2007/08" -> use dates to get actual year
                            JsonNode datesNode = info.get("dates");
                            if (datesNode != null && datesNode.isArray() && datesNode.size() > 0) {
                                String firstDate = datesNode.get(0).asText();
                                seasonYear = safeParseInt(firstDate.substring(0, 4));
                            }
                        } else {
                            seasonYear = safeParseInt(seasonText);
                        }
                    }
                }
                if (seasonYear == null) {
                    skippedNoSeason++;
                    continue;
                }

                // ensure season row exists
                getOrCreateSeason(seasonYear);

                // teams
                JsonNode teamsNode = info.path("teams");
                if (!teamsNode.isArray() || teamsNode.size() < 2) {
                    skippedNoTeams++;
                    continue;
                }

                String team1Name = teamsNode.get(0).asText();
                String team2Name = teamsNode.get(1).asText();
                TeamEntity team1 = getOrCreateTeam(team1Name);
                TeamEntity team2 = getOrCreateTeam(team2Name);

                // date
                LocalDate matchDate = null;
                if (info.has("dates") && info.path("dates").isArray() && info.path("dates").size() > 0) {
                    matchDate = LocalDate.parse(info.path("dates").get(0).asText());
                } else if (info.has("date")) {
                    matchDate = LocalDate.parse(info.path("date").asText());
                }

                // venue/city
                String venue = info.path("venue").asText(null);
                String city = info.path("city").asText(null);

                // winner (FK team)
                TeamEntity winner = null;
                String winnerName = info.path("outcome").path("winner").asText(null);
                if (winnerName != null && !winnerName.isBlank()) {
                    winner = getOrCreateTeam(winnerName);
                }

                // toss
                TeamEntity tossWinner = null;
                String tossWinnerName = info.path("toss").path("winner").asText(null);
                if (tossWinnerName != null && !tossWinnerName.isBlank()) {
                    tossWinner = getOrCreateTeam(tossWinnerName);
                }
                String tossDecision = info.path("toss").path("decision").asText(null);

                // result type/margin
                String resultType = info.path("outcome").path("result").asText(null);

                Integer resultMargin = null;
                JsonNode byNode = info.path("outcome").path("by");
                if (byNode.has("runs")) resultMargin = safeParseInt(byNode.path("runs").asText(null));
                if (resultMargin == null && byNode.has("wickets"))
                    resultMargin = safeParseInt(byNode.path("wickets").asText(null));

                MatchEntity match = MatchEntity.builder()
                        .id(matchId)
                        .seasonYear(seasonYear)
                        .matchDate(matchDate)
                        .team1(team1)
                        .team2(team2)
                        .venue(venue)
                        .city(city)
                        .winner(winner)
                        .tossWinner(tossWinner)
                        .tossDecision(tossDecision)
                        .resultType(resultType)
                        .resultMargin(resultMargin)
                        .team1Name(team1.getName())
                        .team2Name(team2.getName())
                        .build();

                matchRepository.save(match);
                inserted++;

            } catch (Exception e) {
                failed++;
                System.out.println("❌ Failed: " + f.getName() + " -> " + e.getMessage());
            }
        }

        System.out.println("✅ Import done.");
        System.out.println("Inserted=" + inserted);
        System.out.println("Skipped(existing)=" + skippedExisting);
        System.out.println("Skipped(noSeason)=" + skippedNoSeason);
        System.out.println("Skipped(noTeams)=" + skippedNoTeams);
        System.out.println("Failed=" + failed);
    }

    private static final Map<String, String> TEAM_NAME_MAP = Map.ofEntries(
        Map.entry("Mumbai Indians", "MI"),
        Map.entry("Chennai Super Kings", "CSK"),
        Map.entry("Royal Challengers Bangalore", "RCB"),
        Map.entry("Royal Challengers Bengaluru", "RCB"),
        Map.entry("Kolkata Knight Riders", "KKR"),
        Map.entry("Sunrisers Hyderabad", "SRH"),
        Map.entry("Delhi Capitals", "DC"),
        Map.entry("Delhi Daredevils", "DC"),
        Map.entry("Rajasthan Royals", "RR"),
        Map.entry("Kings XI Punjab", "PBKS"),
        Map.entry("Punjab Kings", "PBKS"),
        Map.entry("Lucknow Super Giants", "LSG"),
        Map.entry("Gujarat Titans", "GT"),
        Map.entry("Gujarat Lions", "GL"),
        Map.entry("Deccan Chargers", "DCG"),
        Map.entry("Kochi Tuskers Kerala", "KTK"),
        Map.entry("Pune Warriors India", "PW"),
        Map.entry("Rising Pune Supergiant", "RPS"),
        Map.entry("Rising Pune Supergiants", "RPS")
    );

    private TeamEntity getOrCreateTeam(String name) {
        String mappedName = TEAM_NAME_MAP.getOrDefault(name, name);
        Optional<TeamEntity> existing = teamRepository.findByName(mappedName);
        if (existing.isPresent()) return existing.get();
        return teamRepository.save(TeamEntity.builder().name(mappedName).build());
    }

    private SeasonEntity getOrCreateSeason(Integer year) {
        Optional<SeasonEntity> existing = seasonRepository.findByYear(year);
        if (existing.isPresent()) return existing.get();
        return seasonRepository.save(SeasonEntity.builder().year(year).build());
    }

    private Long parseMatchIdFromFilename(String filename) {
        String digits = filename.replaceAll("\\D+", "");
        if (digits.isBlank()) throw new IllegalArgumentException("Cannot parse match id from: " + filename);
        return Long.parseLong(digits);
    }

    private Integer safeParseInt(String s) {
        try {
            if (s == null) return null;
            String t = s.trim();
            if (t.isEmpty()) return null;
            return Integer.parseInt(t);
        } catch (Exception e) {
            return null;
        }
    }
}