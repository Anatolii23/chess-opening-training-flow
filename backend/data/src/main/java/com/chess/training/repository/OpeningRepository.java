package com.chess.training.repository;

import com.chess.training.domain.Opening;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface OpeningRepository extends JpaRepository<Opening, UUID> {
    org.springframework.data.domain.Page<Opening> findByNameContainingIgnoreCase(String name,
            org.springframework.data.domain.Pageable pageable);
}
