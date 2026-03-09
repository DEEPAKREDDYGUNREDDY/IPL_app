package com.example.RCB_FanPage.DTO;


import com.example.RCB_FanPage.Entities.TeamEntity;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
public class RCBOppSeasonwise {



    private Integer seasonYear;

    private LocalDate matchDate;

    private TeamEntity team1;

    private TeamEntity team2;

    private String venue;

    private TeamEntity winner;


}
