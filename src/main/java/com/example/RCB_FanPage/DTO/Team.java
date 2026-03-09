package com.example.RCB_FanPage.DTO;

import jakarta.persistence.Column;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.*;
import org.springframework.stereotype.Service;


@Builder
@AllArgsConstructor
@RequiredArgsConstructor
@Getter
@Setter
public class Team {

    private Long id;


    private String name;
}
