CREATE TABLE openings (
    id UUID PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    player_color VARCHAR(50) NOT NULL,
    move_tree_json TEXT
);

CREATE INDEX idx_openings_name ON openings(name);
