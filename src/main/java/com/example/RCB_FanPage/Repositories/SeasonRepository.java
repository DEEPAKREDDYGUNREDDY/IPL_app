package com.example.RCB_FanPage.Repositories;



import com.example.RCB_FanPage.Entities.SeasonEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface SeasonRepository extends JpaRepository<SeasonEntity, Long> {
    Optional<SeasonEntity> findByYear(Integer year);
}