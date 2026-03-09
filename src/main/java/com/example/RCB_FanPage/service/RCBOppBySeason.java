package com.example.RCB_FanPage.service;


import com.example.RCB_FanPage.DTO.Match;
import com.example.RCB_FanPage.DTO.RCBOppSeasonwise;
import com.example.RCB_FanPage.Entities.MatchEntity;
import com.example.RCB_FanPage.Repositories.MatchRepository;
import lombok.AllArgsConstructor;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@AllArgsConstructor
public class RCBOppBySeason {

    private final MatchRepository matchRepository;

    public List<RCBOppSeasonwise> RCBOppBySeasonstats(Long rcb_name, Long team_name, int season_year){

        List<MatchEntity> matches=matchRepository.RCBOpponentseasonstats(rcb_name, team_name, season_year);

        List<RCBOppSeasonwise> result=new ArrayList<>();

        int totalplayed=0;

        for(MatchEntity match:matches){

            totalplayed++;

            RCBOppSeasonwise response=new RCBOppSeasonwise();

            response.setMatchDate(match.getMatchDate());
            response.setTeam1(match.getTeam1());
            response.setTeam2(match.getTeam2());
            response.setSeasonYear(match.getSeasonYear());
            response.setWinner(match.getWinner());
            response.setVenue(match.getVenue());
            result.add(response);
        }

        System.out.println("TotalMatchesPlayed "+result.size());

        return result;





    }
}
