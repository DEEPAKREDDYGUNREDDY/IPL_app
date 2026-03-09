package com.example.RCB_FanPage.Controllers;

import com.example.RCB_FanPage.DTO.*;
import com.example.RCB_FanPage.service.RCBOppBySeason;
import com.example.RCB_FanPage.service.RCBOpponentStats;
import com.example.RCB_FanPage.service.RCBSeasonWise;
import com.example.RCB_FanPage.service.RCBService;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/rcb")
@AllArgsConstructor
public class RCBController {

    private final RCBService rcbService;

    private final RCBSeasonWise rcbseasonwise;

    private final RCBOpponentStats rcbOpponentStats;

    private final RCBOppBySeason rcbOppBySeason;




    @GetMapping("/teams")
    public List<Team> getTeams() {
        List<Team> teams=rcbService.allTeams();
        return teams;

    }

    @GetMapping("/seasons")
    public List<Season> allSeasons(){
        List<Season> seasons=rcbService.allSeasons();
        return seasons;
    }

    @GetMapping("/seasonwise")
    public RCBSeasonwise getRCBSeasonwise(@RequestParam int year,@RequestParam Long team_id) {

        return rcbseasonwise.RCBstatsseasonwise(year,team_id);
    }

    @GetMapping("/Opponentwisestats")
    public RCBOpponent getRCBOpponentStats(@RequestParam Long team_id,@RequestParam Long rcb_id){
        return rcbOpponentStats.RCBOpponentstats(team_id,rcb_id);
    }

    @GetMapping("/RCBOppseasonwise")
    public List<RCBOppSeasonwise> getRCBOppSeasonwise(@RequestParam Long rcb_id,@RequestParam Long team_id,@RequestParam int season_year){
        List<RCBOppSeasonwise> realstats=rcbOppBySeason.RCBOppBySeasonstats(rcb_id,team_id,season_year);


        return realstats;
    }




}

