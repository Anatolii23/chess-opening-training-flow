-- Insert Ruy Lopez (Simple Variation)
-- Tree: Start -> e4 -> e5 -> Nf3 -> Nc6 -> Bb5
-- JSON structure is approximate for manual insert. Ideally, use the API to populate complex trees.
INSERT INTO openings (id, name, description, player_color, move_tree_json)
VALUES (
    '550e8400-e29b-41d4-a716-446655440000',
    'Ruy Lopez - Berlin Defense',
    'The Ruy Lopez is one of the oldest and most popular openings.',
    'white',
    '{
      "fen": "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1",
      "moveSan": "START",
      "isVariationStart": false,
      "children": {
        "e4": {
          "fen": "rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR b KQkq - 0 1",
          "moveSan": "e4",
          "isVariationStart": false,
          "children": {
            "e5": {
              "fen": "rnbqkbnr/pppp1ppp/8/4p3/4P3/8/PPPP1PPP/RNBQKBNR w KQkq - 0 2",
              "moveSan": "e5",
              "isVariationStart": false,
              "children": {
                "Nf3": {
                  "fen": "rnbqkbnr/pppp1ppp/8/4p3/4P3/5N2/PPPP1PPP/RNBQKB1R b KQkq - 1 2",
                  "moveSan": "Nf3",
                  "isVariationStart": false,
                  "children": {
                    "Nc6": {
                        "fen": "r1bqkbnr/pppp1ppp/2n5/4p3/4P3/5N2/PPPP1PPP/RNBQKB1R w KQkq - 2 3",
                         "moveSan": "Nc6",
                         "isVariationStart": false,
                         "children": {
                            "Bb5": {
                                "fen": "r1bqkbnr/pppp1ppp/2n5/1B2p3/4P3/5N2/PPPP1PPP/RNBQK2R b KQkq - 3 3",
                                "moveSan": "Bb5",
                                "isVariationStart": false,
                                "children": {}
                            }
                         }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }'
);
