import React, { useState, useEffect } from "react";
import { Chess } from "chess.js";
import { Chessboard } from "react-chessboard";

interface ChessBoardComponentProps {
    startFen?: string;
    onMove?: (moveSan: string) => boolean;
    status?: string;
}

export const ChessBoardComponent: React.FC<ChessBoardComponentProps> = ({
    startFen = "start",
    onMove,
    status
}) => {
    const [game, setGame] = useState(new Chess(startFen === "start" ? undefined : startFen));

    // safeGameMutate to modify state properly
    function safeGameMutate(modify: (g: Chess) => void) {
        setGame((g) => {
            const update = new Chess(g.fen());
            modify(update);
            return update;
        });
    }

    // Visual State
    const [arrows, setArrows] = useState<any[]>([]);
    const [squareStyles, setSquareStyles] = useState<Record<string, React.CSSProperties>>({});

    // Reset visuals when position changes
    useEffect(() => {
        if (status === 'playing') {
            setArrows([]);
            setSquareStyles({});
        }
    }, [status]);

    function onDrop(sourceSquare: string, targetSquare: string): boolean {
        const tempGame = new Chess(game.fen());
        try {
            const move = tempGame.move({ from: sourceSquare, to: targetSquare, promotion: "q" });
            if (!move) return false;

            // Validate with Parent
            if (onMove) {
                const isValid = onMove(move.san);
                if (!isValid) {
                    // Show Red Indicator
                    setArrows([[sourceSquare, targetSquare]]);
                    setSquareStyles({
                        [sourceSquare]: { backgroundColor: "rgba(255, 0, 0, 0.4)" },
                        [targetSquare]: { backgroundColor: "rgba(255, 0, 0, 0.4)" }
                    });

                    // Force piece snap back by returning false
                    return false;
                }
            }

            // Valid Move
            setSquareStyles({
                [sourceSquare]: { backgroundColor: "rgba(0, 255, 0, 0.4)" },
                [targetSquare]: { backgroundColor: "rgba(0, 255, 0, 0.4)" }
            });
            setTimeout(() => setSquareStyles({}), 500);

            safeGameMutate((g) => {
                g.move({ from: sourceSquare, to: targetSquare, promotion: "q" });
            });
            return true;
        } catch (e) {
            return false;
        }
    }

    // Effect to synchronise internal game state when startFen prop changes
    useEffect(() => {
        const targetFen = startFen === "start" ? new Chess().fen() : startFen;
        if (targetFen !== game.fen()) {
            setGame(new Chess(targetFen));
        }
    }, [startFen]);

    return (
        <div style={{ width: "400px", height: "400px", boxShadow: "0 0 20px rgba(0,0,0,0.5)", borderRadius: "8px", overflow: "hidden" }}>
            <Chessboard
                position={game.fen()}
                onPieceDrop={onDrop}
                customArrows={arrows}
                customSquareStyles={squareStyles}
                animationDuration={200}
            />
        </div>
    );
};
