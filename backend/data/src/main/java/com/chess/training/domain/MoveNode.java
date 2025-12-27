package com.chess.training.domain;

import java.util.Map;

/**
 * Represents a node in the opening tree.
 * Stored as part of the JSON blob in Opening entity.
 */
public record MoveNode(
                String fen, // Board state (Forsyth-Edwards Notation)
                String moveSan, // The move that led to this position (Standard Algebraic Notation) e.g., "e4"
                Map<String, MoveNode> children, // Key is the SAN of the next move (e.g., "e5" -> Node)
                boolean isVariationStart, // Metadata for UI to show "New Variation"
                String variationName // Human-readable name for this variation (optional)
) {
}
