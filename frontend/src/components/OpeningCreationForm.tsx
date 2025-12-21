import React, { useState } from 'react';

interface OpeningCreationFormProps {
    onCancel: () => void;
    onCreated: () => void;
}

export const OpeningCreationForm: React.FC<OpeningCreationFormProps> = ({ onCancel, onCreated }) => {
    const [name, setName] = useState('');
    const [description, setDescription] = useState('');
    const [color, setColor] = useState<'white' | 'black'>('white');
    const [pgn, setPgn] = useState('');
    const [isSubmitting, setIsSubmitting] = useState(false);
    const [error, setError] = useState<string | null>(null);

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        setIsSubmitting(true);
        setError(null);

        try {
            const response = await fetch('http://localhost:8080/api/openings', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ name, description, color, pgn }),
            });

            if (!response.ok) {
                const errorData = await response.json();
                throw new Error(errorData.message || 'Failed to create opening');
            }

            onCreated();
        } catch (err: any) {
            setError(err.message || 'Something went wrong');
        } finally {
            setIsSubmitting(false);
        }
    };

    return (
        <div className="opening-creation-container">
            <h2>Add New Opening</h2>
            <form onSubmit={handleSubmit} className="creation-form">
                <div className="form-group">
                    <label>Name</label>
                    <input
                        type="text"
                        value={name}
                        onChange={(e) => setName(e.target.value)}
                        placeholder="e.g., King's Gambit"
                        required
                    />
                </div>

                <div className="form-group">
                    <label>Description</label>
                    <textarea
                        value={description}
                        onChange={(e) => setDescription(e.target.value)}
                        placeholder="Briefly describe the opening..."
                        required
                    />
                </div>

                <div className="form-group">
                    <label>Play As</label>
                    <select value={color} onChange={(e) => setColor(e.target.value as 'white' | 'black')}>
                        <option value="white">White</option>
                        <option value="black">Black</option>
                    </select>
                </div>

                <div className="form-group">
                    <label>PGN Content</label>
                    <textarea
                        value={pgn}
                        onChange={(e) => setPgn(e.target.value)}
                        placeholder="Paste PGN here (e.g., 1. e4 e5 2. f4...)"
                        rows={6}
                        required
                    />
                    <small>Multiple games in one PGN will be merged into a single opening tree.</small>
                </div>

                {error && <div className="error-message">{error}</div>}

                <div className="form-actions">
                    <button type="submit" disabled={isSubmitting} className="primary-btn">
                        {isSubmitting ? 'Creating...' : 'Create Opening'}
                    </button>
                    <button type="button" onClick={onCancel} className="secondary-btn">Cancel</button>
                </div>
            </form>
        </div>
    );
};
