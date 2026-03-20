package com.example.RCB_FanPage.service;


import com.example.RCB_FanPage.DTO.RCBSeasonwise;
import com.example.RCB_FanPage.Entities.MatchEntity;
import com.example.RCB_FanPage.Repositories.MatchRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@AllArgsConstructor
@Service
public class SeasonWisestats {

    private final MatchRepository matchRepository;

    public RCBSeasonwise seasonwisestats(int year,Long team_id) {



        List<MatchEntity> matchentities=matchRepository.seasonwisestats(year,team_id);


        System.out.println(matchentities.size());
        int totalmatchesplayed=0;
        int wins=0;



        for(MatchEntity match:matchentities){
            totalmatchesplayed++;
            if(match.getWinner() != null && match.getWinner().getId().equals(team_id)){
                wins++;
            }

        }
        int loss=totalmatchesplayed-wins;
        int draws=totalmatchesplayed-wins-loss;



        RCBSeasonwise response=new RCBSeasonwise();

        response.setTotalmatchesPlayed(totalmatchesplayed);
        response.setTotalWins(wins);
        response.setTotalDraws(draws);
        response.setTotalloss(loss);

        return response;

    }

}
