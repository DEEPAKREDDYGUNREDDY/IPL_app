package com.example.RCB_FanPage.Controllers;

import com.example.RCB_FanPage.DTO.*;
import com.example.RCB_FanPage.service.*;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/rcb")
@AllArgsConstructor
public class RCBController {

    private final TeamService teamService;

    private final SeasonWisestats seasonWisestats;

    private final RCBOpponentStats rcbOpponentStats;

    private final RCBOppBySeason rcbOppBySeason;

    private final Teamstats teamstats;




    @GetMapping("/teams")
    public List<Team> getTeams() {
        List<Team> teams=teamService.allTeams();
        return teams;

    }



    @GetMapping("/seasons")
    public List<Season> allSeasons(){
        List<Season> seasons=teamService.allSeasons();
        return seasons;
    }

    @GetMapping("/team/stats")
    public TeamStatsDTO getoverallteamstats(@RequestParam Long team_id){

       return  teamstats.teamstatss(team_id);
    }


    @GetMapping("/team/season/stats")
    public RCBSeasonwise getSeasonwise(@RequestParam int season,@RequestParam Long team_id) {

        return seasonWisestats.seasonwisestats(season,team_id);
    }

    @GetMapping("/team1_team2/stats")
    public RCBOpponent getRCBOpponentStats(@RequestParam Long team_id,@RequestParam Long team2_id) {
        return rcbOpponentStats.RCBOpponentstats(team_id,team2_id);
    }

    @GetMapping("/team1_team2/season/stats")
    public List<RCBOppSeasonwise> getRCBOppSeasonwise(@RequestParam Long team1_id, @RequestParam Long team2_id, @RequestParam int season) {
        List<RCBOppSeasonwise> realstats = rcbOppBySeason.RCBOppBySeasonstats(team1_id, team2_id, season);


        return realstats;
    }




}

