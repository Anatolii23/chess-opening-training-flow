import React, { useState } from "react";
import { OpeningList } from "./OpeningList";

interface AddVariationFlowProps {
    onCancel: () => void;
    onComplete: () => void;
}

export const AddVariationFlow: React.FC<AddVariationFlowProps> = ({ onCancel, onComplete }) => {
    const [selectedId, setSelectedId] = useState<string | null>(null);
    const [variationName, setVariationName] = useState("");
    const [pgn, setPgn] = useState("");
    const [isSubmitting, setIsSubmitting] = useState(false);
    const [error, setError] = useState<string | null>(null);

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        if (!selectedId || !pgn.trim()) return;

        setIsSubmitting(true);
        setError(null);
        try {
            const response = await fetch(`http://localhost:8080/api/openings/${selectedId}/variations`, {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({ pgn, variationName })
            });

            if (!response.ok) {
                const data = await response.json();
                throw new Error(data.message || "Failed to add variation");
            }

            onComplete();
        } catch (err: any) {
            setError(err.message);
        } finally {
            setIsSubmitting(false);
        }
    };

    if (!selectedId) {
        return (
            <div className="add-variation-container">
                <div className="list-header">
                    <h2>Select Opening to Enhance</h2>
                    <button className="secondary-btn" onClick={onCancel}>Cancel</button>
                </div>
                <p>Choose an existing opening to add new lines or variations from PGN.</p>
                <OpeningList
                    onSelect={setSelectedId}
                    onAddNew={() => { }} // Not used here
                    onAddVariation={() => { }} // Not used here
                />
            </div>
        );
    }

    return (
        <div className="opening-creation-container">
            <h2>Add New Variation</h2>
            <p>Paste your PGN content below. The moves will be merged into the existing opening tree.</p>

            <form onSubmit={handleSubmit} className="creation-form">
                <div className="form-group">
                    <label>Variation Name</label>
                    <input
                        type="text"
                        required
                        value={variationName}
                        onChange={(e) => setVariationName(e.target.value)}
                        placeholder="e.g. Alapin Variation"
                    />
                </div>

                <div className="form-group">
                    <label>PGN Content</label>
                    <textarea
                        required
                        rows={10}
                        value={pgn}
                        onChange={(e) => setPgn(e.target.value)}
                        placeholder="e.g. 1. e4 e5 2. Nf3 Nc6 (2... Nf6 3. d4)"
                    />
                </div>

                {error && <div className="error-message">{error}</div>}

                <div className="form-actions">
                    <button
                        type="button"
                        className="secondary-btn"
                        onClick={() => setSelectedId(null)}
                        disabled={isSubmitting}
                    >
                        Back to Selection
                    </button>
                    <button
                        type="submit"
                        className="add-btn"
                        disabled={isSubmitting}
                    >
                        {isSubmitting ? "Merging..." : "Add Variation"}
                    </button>
                </div>
            </form>
        </div>
    );
};
