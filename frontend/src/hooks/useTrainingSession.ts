import { useState, useEffect, useCallback } from "react";

// Types
interface MoveNode {
    fen: string;
    moveSan: string;
    children: Record<string, MoveNode>;
    isVariationStart: boolean;
}

export const useTrainingSession = (openingId: string | null) => {
    const [currentNode, setCurrentNode] = useState<MoveNode | null>(null);
    const [rootNode, setRootNode] = useState<MoveNode | null>(null);
    const [isLoading, setIsLoading] = useState(false);
    const [error, setError] = useState<string | null>(null);
    const [status, setStatus] = useState<"IDLE" | "playing" | "correct" | "incorrect" | "complete">("IDLE");
    const [exploredPaths, setExploredPaths] = useState<Set<string>>(new Set());
    const [currentPath, setCurrentPath] = useState<string[]>([]);
    const [expectedMoves, setExpectedMoves] = useState<string[]>([]);

    // Fetch Training Data
    useEffect(() => {
        if (!openingId) return;
        setIsLoading(true);
        setError(null);
        setExploredPaths(new Set());
        setCurrentPath([]);
        setExpectedMoves([]);

        fetch(`http://localhost:8080/api/openings/${openingId}`)
            .then(res => {
                if (!res.ok) throw new Error("Failed to fetch opening");
                return res.json();
            })
            .then(data => {
                try {
                    const tree: MoveNode = JSON.parse(data.moveTreeJson);
                    setRootNode(tree);
                    setCurrentNode(tree);
                    setStatus("playing");
                } catch (e) {
                    setError("Failed to parse move tree data");
                    console.error("Parse error", e);
                }
            })
            .catch(err => {
                setError(err.message);
                console.error("Fetch error", err);
            })
            .finally(() => setIsLoading(false));
    }, [openingId]);

    const onUserMove = useCallback((san: string): boolean => {
        if (!currentNode) return false;

        const nextNode = currentNode.children[san];
        if (nextNode) {
            // Valid Move!
            setStatus("correct");
            setExpectedMoves([]);
            setCurrentNode(nextNode);
            setCurrentPath(prev => [...prev, san]);

            // Trigger Opponent Move (if any)
            setTimeout(() => {
                if (nextNode.children && Object.keys(nextNode.children).length > 0) {
                    const replies = Object.entries(nextNode.children);
                    // Find unexplored variations if any
                    const unexplored = replies.filter(([move]) => {
                        const path = [...currentPath, san, move].join('|');
                        return !exploredPaths.has(path);
                    });

                    // If we have unexplored, maybe pick one, else pick any
                    const options = unexplored.length > 0 ? unexplored : replies;
                    const randomIndex = Math.floor(Math.random() * options.length);
                    const [moveSan, reply] = options[randomIndex];

                    setCurrentNode(reply);
                    setCurrentPath(prev => [...prev, moveSan]);
                    setStatus("playing");
                } else {
                    // Mark path as explored
                    setExploredPaths(prev => {
                        const newSet = new Set(prev);
                        newSet.add(currentPath.join('|'));
                        return newSet;
                    });
                    setStatus("complete");
                }
            }, 500);

            return true;
        } else {
            // Invalid Move
            const correct = Object.keys(currentNode.children);
            setExpectedMoves(correct);
            setStatus("incorrect");
            // Automatically flip back to playing after 4 seconds to allow retry
            setTimeout(() => setStatus("playing"), 4000);
            return false;
        }
    }, [currentNode, currentPath, exploredPaths]);

    // Find if there are ANY branches we haven't fully explored
    const hasUnvisitedVariation = useCallback(() => {
        if (!rootNode) return false;

        const queue: { node: MoveNode; path: string[] }[] = [{ node: rootNode, path: [] }];
        while (queue.length > 0) {
            const { node, path } = queue.shift()!;
            const children = Object.entries(node.children);

            for (const [san, child] of children) {
                const childPath = [...path, san];
                const pathStr = childPath.join('|');

                // If this is a leaf node and not explored
                if (Object.keys(child.children).length === 0) {
                    if (!exploredPaths.has(pathStr)) return true;
                } else {
                    queue.push({ node: child, path: childPath });
                }
            }
        }
        return false;
    }, [rootNode, exploredPaths]);

    const reset = () => {
        setCurrentNode(rootNode);
        setCurrentPath([]);
        setExpectedMoves([]);
        setStatus("playing");
    };

    return {
        currentFen: currentNode?.fen || "start",
        isLoading,
        error,
        status,
        onUserMove,
        reset,
        expectedMoves,
        hasOthers: hasUnvisitedVariation()
    };
};
