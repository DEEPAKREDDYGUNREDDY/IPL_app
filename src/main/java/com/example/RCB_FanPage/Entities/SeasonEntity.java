package com.example.RCB_FanPage.Entities;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "season")
@Getter @Setter
@NoArgsConstructor @AllArgsConstructor
@Builder
public class SeasonEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // Example: 2012, 2020, 2025
    @Column(nullable = false, unique = true)
    private Integer year;
}
