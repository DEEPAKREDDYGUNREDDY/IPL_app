package com.example.RCB_FanPage.Repositories;


import com.example.RCB_FanPage.DTO.Match;
import com.example.RCB_FanPage.DTO.Season;
import com.example.RCB_FanPage.Entities.MatchEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface MatchRepository extends JpaRepository<MatchEntity, Long> {





    @Query("""
SELECT match FROM MatchEntity match
WHERE match.seasonYear = :year
AND (match.team1.id= :team_id OR match.team2.id= :team_id)

""")

    List<MatchEntity> RCBstatsseasonwise(@Param("year") int year, @Param("team_id") Long team_id);


    @Query("""

SELECT match FROM MatchEntity match
WHERE (match.team1.id= :rcb_id AND match.team2.id= :team_id) OR (match.team1.id= :team_id AND match.team2.id= :rcb_id)

""")
    List<MatchEntity> RCBOpponentstats(@Param("team_id") Long team_id,@Param("rcb_id") Long rcb_id);


    @Query("""
SELECT match FROM MatchEntity match
WHERE match.seasonYear= :seasonYear
AND ((match.team1.id= :rcb_name AND match.team2.id= :team_name) OR (match.team1.id= :team_name AND match.team2.id= :rcb_name))
"""

    )
    List<MatchEntity> RCBOpponentseasonstats(@Param("rcb_name") Long rcb_id,@Param("team_name") Long team_id,@Param("seasonYear") int year);
}
