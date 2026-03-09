package com.example.RCB_FanPage.service;


import com.example.RCB_FanPage.DTO.RCBOpponent;
import com.example.RCB_FanPage.Entities.MatchEntity;
import com.example.RCB_FanPage.Repositories.MatchRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class RCBOpponentStats {

    private final MatchRepository matchRepository;

    public RCBOpponent RCBOpponentstats(Long team_id,Long rcb_id){

        List<MatchEntity> matches=matchRepository.RCBOpponentstats(team_id,rcb_id);

        RCBOpponent response=new RCBOpponent();

        int TotalmatchesPlayed=0;
        int RCBWins=0;
        int OpponentWins=0;

        for(MatchEntity match:matches){
            TotalmatchesPlayed++;
            if(match.getWinner().getId()==team_id){
                OpponentWins++;
            }
            else if(match.getWinner().getId()==rcb_id){
                RCBWins++;
            }

        }

        int draws=TotalmatchesPlayed-RCBWins-OpponentWins;
        response.setRCBWins(RCBWins);
        response.setOpponentWins(OpponentWins);
        response.setTotalmatchesPlayed(TotalmatchesPlayed);
        response.setTotalDraws(draws);

        return response;





    }


}
