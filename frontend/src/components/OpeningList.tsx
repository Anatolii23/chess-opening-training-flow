import { useEffect, useState } from "react";

interface Opening {
    id: string;
    name: string;
    description: string;
    playerColor: string;
}

interface PageResponse {
    content: Opening[];
    totalElements: number;
    totalPages: number;
    size: number;
    number: number;
}

interface OpeningListProps {
    onSelect: (id: string) => void;
    onAddNew: () => void;
    onAddVariation: () => void;
}

export const OpeningList: React.FC<OpeningListProps> = ({ onSelect, onAddNew, onAddVariation }) => {
    const [openings, setOpenings] = useState<Opening[]>([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState<string | null>(null);

    const [search, setSearch] = useState("");
    const [page, setPage] = useState(0);
    const [totalPages, setTotalPages] = useState(0);

    useEffect(() => {
        setLoading(true);
        const queryParams = new URLSearchParams({
            query: search,
            page: page.toString(),
            size: "8"
        });

        fetch(`http://localhost:8080/api/openings?${queryParams}`)
            .then(res => {
                if (!res.ok) throw new Error("Server error");
                return res.json();
            })
            .then((data: PageResponse) => {
                setOpenings(data.content);
                setTotalPages(data.totalPages);
                setLoading(false);
            })
            .catch(err => {
                console.error(err);
                setError("Could not connect to backend. Is it running?");
                setLoading(false);
            });
    }, [search, page]);

    return (
        <div className="opening-list">
            <div className="list-header">
                <h2>Browse Openings</h2>
                <div className="list-actions">
                    <button className="secondary-btn" onClick={onAddVariation}>Add Variation</button>
                    <button className="add-btn" onClick={onAddNew}>+ Create New</button>
                </div>
            </div>

            <div className="search-bar">
                <input
                    type="text"
                    placeholder="Search openings..."
                    value={search}
                    onChange={(e) => {
                        setSearch(e.target.value);
                        setPage(0); // Reset to first page on search
                    }}
                />
            </div>

            {loading ? (
                <div className="loading-spinner">Loading openings...</div>
            ) : error ? (
                <div className="feedback error">{error}</div>
            ) : (
                <>
                    <div className="opening-grid">
                        {openings.map(op => (
                            <div key={op.id} className="opening-card" onClick={() => onSelect(op.id)}>
                                <h3>{op.name}</h3>
                                <p>{op.description}</p>
                                <span className={`tag ${op.playerColor}`}>{op.playerColor}</span>
                            </div>
                        ))}
                    </div>

                    {totalPages > 1 && (
                        <div className="pagination">
                            <button
                                disabled={page === 0}
                                onClick={() => setPage(p => p - 1)}
                            >
                                Previous
                            </button>
                            <span>Page {page + 1} of {totalPages}</span>
                            <button
                                disabled={page >= totalPages - 1}
                                onClick={() => setPage(p => p + 1)}
                            >
                                Next
                            </button>
                        </div>
                    )}
                </>
            )}
        </div>
    );
};
