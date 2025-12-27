package com.chess.training.controller;

import com.chess.training.domain.Opening;
import com.chess.training.model.CreateOpeningRequest;
import com.chess.training.service.OpeningService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.UUID;

@RestController
@RequestMapping("/api/openings")
@CrossOrigin(origins = "http://localhost:5173") // Allow Frontend access
public class OpeningController {

    private final OpeningService openingService;

    public OpeningController(OpeningService openingService) {
        this.openingService = openingService;
    }

    @GetMapping
    public org.springframework.data.domain.Page<Opening> getAllOpenings(
            @RequestParam(required = false) String query,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size) {
        return openingService.searchOpenings(query, page, size);
    }

    @PostMapping("/{id}/variations")
    public Opening addVariation(@PathVariable UUID id, @RequestBody java.util.Map<String, String> request) {
        String pgn = request.get("pgn");
        String variationName = request.get("variationName");
        if (pgn == null || pgn.isBlank()) {
            throw new RuntimeException("PGN is required");
        }
        return openingService.addVariation(id, pgn, variationName);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Opening> getOpening(@PathVariable UUID id) {
        return openingService.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public Opening createOpening(@RequestBody CreateOpeningRequest request) {
        try {
            return openingService.createOpening(request.getName(), request.getDescription(), request.getColor(),
                    request.getPgn(), request.getVariationName());
        } catch (Exception e) {
            throw new RuntimeException("Failed to process PGN", e);
        }
    }
}
