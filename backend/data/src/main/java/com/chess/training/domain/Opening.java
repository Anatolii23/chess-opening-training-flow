package com.chess.training.domain;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Entity
@Table(name = "openings")
@Data
@NoArgsConstructor
public class Opening {

    @Id
    @GeneratedValue
    private UUID id;

    @Column(nullable = false)
    private String name;

    @Column(length = 1000)
    private String description;

    @Column(nullable = false)
    private String playerColor; // "white" or "black"

    // The optimized Tree Structure is stored as JSONB to allow complex nesting
    // without
    // massive join overhead. Ideally we would use a dedicated Node table if we
    // needed
    // SQL traversals, but for "Load & Play" scenarios, JSON is superior
    // performance-wise.
    @Column(columnDefinition = "TEXT") // Postgres TEXT or JSONB if using specific dialect
    private String moveTreeJson;
}
