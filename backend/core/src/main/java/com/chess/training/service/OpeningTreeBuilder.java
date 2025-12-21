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
    public MoveNode buildTree(List<List<String>> allVariations) {
        // Base case: Standard Start Position
        String startFen = "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1";
        MoveNode root = new MoveNode(startFen, "START", new HashMap<>(), false);

        mergeToTree(root, allVariations);
        return root;
    }

    public void mergeToTree(MoveNode root, List<List<String>> allVariations) {
        for (List<String> variation : allVariations) {
            mergeVariation(root, variation);
        }
    }

    private void mergeVariation(MoveNode root, List<String> moves) {
        MoveNode currentNode = root;
        Board board = new Board(); // Starts at standard position

        for (String moveSan : moves) {
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
                    MoveNode newNode = new MoveNode(nextFen, moveSan, new HashMap<>(), false);
                    currentNode.children().put(moveSan, newNode);
                    currentNode = newNode;
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
