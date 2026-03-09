package com.example.RCB_FanPage.service;


import com.example.RCB_FanPage.DTO.Match;
import com.example.RCB_FanPage.DTO.Season;
import com.example.RCB_FanPage.DTO.Team;
import com.example.RCB_FanPage.Entities.SeasonEntity;
import com.example.RCB_FanPage.Entities.TeamEntity;

import com.example.RCB_FanPage.Repositories.SeasonRepository;
import com.example.RCB_FanPage.Repositories.TeamRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static org.hibernate.internal.util.collections.ArrayHelper.forEach;

@Service
@AllArgsConstructor
public class RCBService {

//    public RCBService(SeasonRepository seasonRepository, TeamRepository teamRepository, MatchRepository matchRepository) {
//        this.seasonRepository = seasonRepository;
//        this.teamRepository = teamRepository;
//        this.matchRepository = matchRepository;
//    }

    private final SeasonRepository seasonRepository;

    private final TeamRepository teamRepository;



    public List<Team> allTeams(){

        List<TeamEntity> TeamEntites= teamRepository.findAll();
        List<Team> Teams=new ArrayList<>();

        for(TeamEntity entity:TeamEntites){
            entity.getId();
            entity.getName();
            Team team=new Team();
            team.setId(entity.getId());
            team.setName(entity.getName());
            Teams.add(team);

        }
        return Teams;
    }

    public List<Season> allSeasons(){

        List<SeasonEntity> seasonsentities=seasonRepository.findAll();

        List<Season> seasons=new ArrayList<>();

        for(SeasonEntity entity:seasonsentities){
            Season season=new Season();
            season.setId(entity.getId());
            season.setYear(entity.getYear());
            seasons.add(season);

        }
        return seasons;
    }



}
