package com.chess.training.service;

import com.chess.training.domain.MoveNode;
import com.github.bhlangonijr.chesslib.Board;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class OpeningTreeBuilder {

    /**
     * core Logic:
     * 1. Start with Root Node (Start FEN).
     * 2. For each Variation (List of Moves):
     * - Reset Board to Start.
     * - Traverse existing nodes as far as possible.
     * - Determine valid move SAN and next FEN.
     * - If child exists, move to it.
     * - If not, create new child and attach.
     * 3. Return Root Node (which contains the full tree).
     */
    public MoveNode buildTree(List<List<String>> allVariations, String initialVariationName) {
        // Base case: Standard Start Position
        String startFen = "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1";
        MoveNode root = new MoveNode(startFen, "START", new HashMap<>(), false, null);

        mergeToTree(root, allVariations, initialVariationName);
        return root;
    }

    public void mergeToTree(MoveNode root, List<List<String>> allVariations, String variationName) {
        for (var variation : allVariations) {
            mergeVariation(root, variation, variationName);
        }
    }

    private void mergeVariation(MoveNode root, List<String> moves, String variationName) {
        var currentNode = root;
        var board = new Board(); // Starts at standard position
        boolean nameApplied = (variationName == null);

        for (int i = 0; i < moves.size(); i++) {
            String moveSan = moves.get(i);
            try {
                // board.doMove(san) is the standard way to apply SAN in chesslib
                boolean success = board.doMove(moveSan);
                if (!success) {
                    throw new RuntimeException("Illegal move in variation: " + moveSan);
                }
                String nextFen = board.getFen();

                // 2. Check if current Node already has this move as child
                if (currentNode.children().containsKey(moveSan)) {
                    // Transpose / Follow existing
                    currentNode = currentNode.children().get(moveSan);
                } else {
                    // New Branch
                    boolean isStart = !nameApplied;
                    var newNode = new MoveNode(nextFen, moveSan, new HashMap<>(), isStart,
                            isStart ? variationName : null);
                    currentNode.children().put(moveSan, newNode);
                    currentNode = newNode;
                    nameApplied = true;
                }

            } catch (Exception e) {
                // Invalid move in PGN or logic error
                // Log and stop this variation
                System.err.println("Error building tree for move '" + moveSan + "': " + e.getMessage());
                break;
            }
        }
    }
}
