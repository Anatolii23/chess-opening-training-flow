package com.chess.training.service;

import com.chess.training.domain.MoveNode;
import com.chess.training.domain.Opening;
import com.chess.training.repository.OpeningRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class OpeningService {

    private final OpeningRepository repository;
    private final PgnParserService pgnParser;
    private final OpeningTreeBuilder treeBuilder;
    private final ObjectMapper objectMapper;

    public OpeningService(OpeningRepository repository, PgnParserService pgnParser, OpeningTreeBuilder treeBuilder,
            ObjectMapper objectMapper) {
        this.repository = repository;
        this.pgnParser = pgnParser;
        this.treeBuilder = treeBuilder;
        this.objectMapper = objectMapper;
    }

    public List<Opening> getAllOpenings() {
        return repository.findAll();
    }

    public Page<Opening> searchOpenings(String query, int page, int size) {
        var pageable = PageRequest.of(page, size);
        if (query == null || query.isBlank()) {
            return repository.findAll(pageable);
        }
        return repository.findByNameContainingIgnoreCase(query, pageable);
    }

    public Optional<Opening> findById(java.util.UUID id) {
        return repository.findById(id);
    }

    @Transactional
    public Opening createOpening(String name, String description, String color, String pgnContent) {
        // 1. Parse PGN
        var variations = pgnParser.parsePgn(pgnContent);

        // 2. Build Tree
        var rootNode = treeBuilder.buildTree(variations);

        // Validation: Ensure we actually built a tree
        if (rootNode.children().isEmpty()) {
            throw new RuntimeException("The provided PGN resulted in an empty move tree. Please check the PGN format.");
        }

        // 3. Serialize to JSON
        String jsonTree;
        try {
            jsonTree = objectMapper.writeValueAsString(rootNode);
        } catch (JsonProcessingException e) {
            throw new RuntimeException("Failed to serialize move tree", e);
        }

        // 4. Save
        var opening = new Opening();
        opening.setName(name);
        opening.setDescription(description);
        opening.setPlayerColor(color);
        opening.setMoveTreeJson(jsonTree);

        return repository.save(opening);
    }

    @Transactional
    public Opening addVariation(UUID openingId, String pgnContent) {
        Opening opening = repository.findById(openingId)
                .orElseThrow(() -> new RuntimeException("Opening not found"));

        // 1. Parse PGN
        var newVariations = pgnParser.parsePgn(pgnContent);

        // 2. Deserialize existing tree
        MoveNode rootNode;
        try {
            rootNode = objectMapper.readValue(opening.getMoveTreeJson(), MoveNode.class);
        } catch (JsonProcessingException e) {
            throw new RuntimeException("Failed to deserialize existing move tree", e);
        }

        // 3. Merge new variations
        treeBuilder.mergeToTree(rootNode, newVariations);

        // 4. Serialize back
        String jsonTree;
        try {
            jsonTree = objectMapper.writeValueAsString(rootNode);
        } catch (JsonProcessingException e) {
            throw new RuntimeException("Failed to serialize merged move tree", e);
        }

        opening.setMoveTreeJson(jsonTree);
        return repository.save(opening);
    }
}
