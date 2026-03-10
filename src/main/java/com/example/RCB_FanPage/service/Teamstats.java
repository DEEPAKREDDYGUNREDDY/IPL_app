package com.example.RCB_FanPage.service;


import com.example.RCB_FanPage.DTO.TeamStatsDTO;
import com.example.RCB_FanPage.Entities.MatchEntity;
import com.example.RCB_FanPage.Repositories.MatchRepository;
import jakarta.validation.constraints.Null;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class Teamstats {

    private final MatchRepository matchRepository;

    public TeamStatsDTO teamstatss(Long team_id){


       List<MatchEntity> matches= matchRepository.teamstats(team_id);


       System.out.println(matches.size());
       TeamStatsDTO response= new TeamStatsDTO();

       int Total_matchesPlayed=0;
       int wins=0;

       int No_Result=0;


        for (MatchEntity match : matches) {

            if (match.getWinner() == null) {
                No_Result++;
                continue;
            }

            Total_matchesPlayed++;

            if (match.getWinner().getId().equals(team_id)) {
                wins++;
            }
        }

        int losses=Total_matchesPlayed-wins-No_Result;
        float win_percentage=((float) wins/(float) Total_matchesPlayed)*100;
       response.setTotal_matchesPlayed(Total_matchesPlayed);
       response.setWins(wins);
       response.setNo_Result(No_Result);
       response.setWin_percentage(win_percentage);
       response.setLosses(losses);
       return response;






   }


}
