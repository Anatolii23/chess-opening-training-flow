package com.chess.training.service;

import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class PgnParserService {

    public List<List<String>> parsePgn(String pgnContent) {
        String cleanPgn = stripPgn(pgnContent);
        var tokens = tokenize(cleanPgn);
        return unrollPaths(tokens);
    }

    private String stripPgn(String pgn) {
        // Remove headers [...]
        String result = pgn.replaceAll("\\[.*?]", " ");
        // Remove comments { }
        result = result.replaceAll("\\{.*?}", " ");
        // Remove numeric annotation glyphs $123
        result = result.replaceAll("\\$\\d+", " ");
        // Remove move numbers like 1. 1... 2. 12.
        // We look for digits followed by one or more dots.
        result = result.replaceAll("\\d+\\s*\\.+", " ");
        // Remove common game results
        result = result.replaceAll("(1-0|0-1|1/2-1/2|\\*)", " ");
        return result.trim();
    }

    private List<String> tokenize(String pgn) {
        List<String> tokens = new ArrayList<>();
        StringBuilder sb = new StringBuilder();
        for (char c : pgn.toCharArray()) {
            if (c == '(' || c == ')') {
                if (!sb.isEmpty()) {
                    tokens.add(sb.toString().trim());
                    sb.setLength(0);
                }
                tokens.add(String.valueOf(c));
            } else if (Character.isWhitespace(c)) {
                if (!sb.isEmpty()) {
                    tokens.add(sb.toString().trim());
                    sb.setLength(0);
                }
            } else {
                sb.append(c);
            }
        }
        if (!sb.isEmpty()) {
            tokens.add(sb.toString().trim());
        }
        return tokens;
    }

    private List<List<String>> unrollPaths(List<String> tokens) {
        PgnNode root = new PgnNode(null);
        java.util.Stack<PgnNode> stack = new java.util.Stack<>();
        PgnNode current = root;

        for (String token : tokens) {
            if (token.equals("(")) {
                stack.push(current);
                // The next move in the variation belongs to the parent of the last move
                current = (current.parent != null) ? current.parent : root;
            } else if (token.equals(")")) {
                if (!stack.isEmpty()) {
                    current = stack.pop();
                }
            } else {
                PgnNode newNode = new PgnNode(token);
                newNode.parent = current;
                current.children.add(newNode);
                current = newNode;
            }
        }

        List<List<String>> allPaths = new ArrayList<>();
        findPathsRecursive(root, new ArrayList<>(), allPaths);
        return allPaths;
    }

    private void findPathsRecursive(PgnNode node, List<String> currentPath, List<List<String>> allPaths) {
        if (node.move != null) {
            currentPath.add(node.move);
        }

        if (node.children.isEmpty()) {
            if (!currentPath.isEmpty()) {
                allPaths.add(new ArrayList<>(currentPath));
            }
        } else {
            for (PgnNode child : node.children) {
                findPathsRecursive(child, currentPath, allPaths);
            }
        }

        if (node.move != null) {
            currentPath.remove(currentPath.size() - 1);
        }
    }

    private static class PgnNode {
        String move;
        PgnNode parent;
        List<PgnNode> children = new ArrayList<>();

        PgnNode(String move) {
            this.move = move;
        }
    }
}
