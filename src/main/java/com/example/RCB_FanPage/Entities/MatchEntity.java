package com.example.RCB_FanPage.Entities;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;

@Entity
@Table(name = "match")
@Getter @Setter
@NoArgsConstructor @AllArgsConstructor
@Builder
public class MatchEntity {

    @Id
    private Long id; // from filename like 123456.json -> 123456

    @Column(name = "season_year", nullable = false)
    private Integer seasonYear;

    @Column(name = "match_date")
    private LocalDate matchDate;

    @ManyToOne
    @JoinColumn(name = "team1_id")
    private TeamEntity team1;

    @ManyToOne
    @JoinColumn(name = "team2_id")
    private TeamEntity team2;

    @Column(columnDefinition = "text")
    private String venue;

    @Column(columnDefinition = "text")
    private String city;

    // winner as FK to team (optional)
    @ManyToOne
    @JoinColumn(name = "winner_id")
    private TeamEntity winner;

    // toss winner as FK to team (optional)
    @ManyToOne
    @JoinColumn(name = "toss_winner_id")
    private TeamEntity tossWinner;

    @Column(name = "toss_decision", length = 20)
    private String tossDecision;

    @Column(name = "result_type", length = 50)
    private String resultType;

    @Column(name = "result_margin")
    private Integer resultMargin;

    @Column(name="team1_name", length=100)
    private String team1Name;

    @Column(name="team2_name", length=100)
    private String team2Name;
}