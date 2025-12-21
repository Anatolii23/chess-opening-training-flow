INSERT INTO openings (id, name, description, player_color, move_tree_json)
VALUES (
  'b2c1d9f1-3f7a-4c7a-9a2a-0f4fbd000003',
  'Blackmar-Diemer Gambit',
  'An aggressive White gambit: 1.d4 d5 2.e4. White offers a pawn for rapid development and attacking lines.',
  'white',
  '{
    "fen": "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1",
    "moveSan": "START",
    "children": {
      "d4": {
        "fen": "rnbqkbnr/pppppppp/8/8/3P4/8/PPP1PPPP/RNBQKBNR b KQkq - 0 1",
        "moveSan": "d4",
        "children": {
          "d5": {
            "fen": "rnbqkbnr/ppp1pppp/8/3p4/3P4/8/PPP1PPPP/RNBQKBNR w KQkq - 0 2",
            "moveSan": "d5",
            "children": {
              "e4": {
                "fen": "rnbqkbnr/ppp1pppp/8/3p4/3PP3/8/PPP2PPP/RNBQKBNR b KQkq - 0 2",
                "moveSan": "e4",
                "children": {
                  "dxe4": {
                    "fen": "rnbqkbnr/ppp1pppp/8/8/3Pp3/8/PPP2PPP/RNBQKBNR w KQkq - 0 3",
                    "moveSan": "dxe4",
                    "children": {
                      "Nc3": {
                        "fen": "rnbqkbnr/ppp1pppp/8/8/3Pp3/2N5/PPP2PPP/R1BQKBNR b KQkq - 1 3",
                        "moveSan": "Nc3",
                        "children": {
                          "Nf6": {
                            "fen": "rnbqkb1r/ppp1pppp/5n2/8/3Pp3/2N5/PPP2PPP/R1BQKBNR w KQkq - 2 4",
                            "moveSan": "Nf6",
                            "children": {
                              "f3": {
                                "fen": "rnbqkb1r/ppp1pppp/5n2/8/3Pp3/2N2P2/PPP3PP/R1BQKBNR b KQkq - 0 4",
                                "moveSan": "f3",
                                "children": {
                                  "exf3": {
                                    "fen": "rnbqkb1r/ppp1pppp/5n2/8/3P4/2N2p2/PPP3PP/R1BQKBNR w KQkq - 0 5",
                                    "moveSan": "exf3",
                                    "children": {
                                      "Nxf3": {
                                        "fen": "rnbqkb1r/ppp1pppp/5n2/8/3P4/2N2N2/PPP3PP/R1BQKB1R b KQkq - 0 5",
                                        "moveSan": "Nxf3",
                                        "children": {
                                          "Bf5": {
                                            "fen": "rn1qkb1r/ppp1pppp/5n2/5b2/3P4/2N2N2/PPP3PP/R1BQKB1R w KQkq - 1 6",
                                            "moveSan": "Bf5",
                                            "children": {
                                              "Ne5": {
                                                "fen": "rn1qkb1r/ppp1pppp/5n2/4Nb2/3P4/2N5/PPP3PP/R1BQKB1R b KQkq - 2 6",
                                                "moveSan": "Ne5",
                                                "children": {
                                                  "e6": {
                                                    "fen": "rn1qkb1r/ppp2ppp/4pn2/4Nb2/3P4/2N5/PPP3PP/R1BQKB1R w KQkq - 0 7",
                                                    "moveSan": "e6",
                                                    "children": {
                                                      "g4": {
                                                        "fen": "rn1qkb1r/ppp2ppp/4pn2/4Nb2/3P2P1/2N5/PPP4P/R1BQKB1R b KQkq - 0 7",
                                                        "moveSan": "g4",
                                                        "children": {
                                                          "Bg6": {
                                                            "fen": "rn1qkb1r/ppp2ppp/4pnb1/4N3/3P2P1/2N5/PPP4P/R1BQKB1R w KQkq - 1 8",
                                                            "moveSan": "Bg6",
                                                            "children": {
                                                              "h4": {
                                                                "fen": "rn1qkb1r/ppp2ppp/4pnb1/4N3/3P2PP/2N5/PPP5/R1BQKB1R b KQkq - 0 8",
                                                                "moveSan": "h4",
                                                                "children": {
                                                                  "Bb4": {
                                                                    "fen": "rn1qk2r/ppp2ppp/4pnb1/4N3/1b1P2PP/2N5/PPP5/R1BQKB1R w KQkq - 1 9",
                                                                    "moveSan": "Bb4",
                                                                    "children": {
                                                                      "h5": {
                                                                        "fen": "rn1qk2r/ppp2ppp/4pnb1/4N2P/1b1P2P1/2N5/PPP5/R1BQKB1R b KQkq - 0 9",
                                                                        "moveSan": "h5",
                                                                        "children": {
                                                                          "Be4": {
                                                                            "fen": "rn1qk2r/ppp2ppp/4pn2/4N2P/1b1Pb1P1/2N5/PPP5/R1BQKB1R w KQkq - 1 10",
                                                                            "moveSan": "Be4",
                                                                            "children": {
                                                                              "Rg1": {
                                                                                "fen": "rn1qk2r/ppp2ppp/4pn2/4N2P/1b1Pb1P1/2N5/PPP5/R1BQKBR1 b Qkq - 2 10",
                                                                                "moveSan": "Rg1",
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
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          },
                                          "g6": {
                                            "fen": "rnbqkb1r/ppp1pp1p/6p1/8/3P4/2N2N2/PPP3PP/R1BQKB1R w KQkq - 0 6",
                                            "moveSan": "g6",
                                            "children": {
                                              "Bc4": {
                                                "fen": "rnbqkb1r/ppp1pp1p/6p1/8/2BP4/2N2N2/PPP3PP/R1BQK2R b KQkq - 1 6",
                                                "moveSan": "Bc4",
                                                "children": {
                                                  "Bg7": {
                                                    "fen": "rnbqk2r/ppp1ppbp/6p1/8/2BP4/2N2N2/PPP3PP/R1BQK2R w KQkq - 2 7",
                                                    "moveSan": "Bg7",
                                                    "children": {
                                                      "O-O": {
                                                        "fen": "rnbqk2r/ppp1ppbp/6p1/8/2BP4/2N2N2/PPP3PP/R1BQ1RK1 b kq - 3 7",
                                                        "moveSan": "O-O",
                                                        "children": {
                                                          "O-O": {
                                                            "fen": "rnbq1rk1/ppp1ppbp/5np1/8/2BP4/2N2N2/PPP3PP/R1BQ1RK1 w - - 4 8",
                                                            "moveSan": "O-O",
                                                            "children": {}
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          },
                                          "e6": {
                                            "fen": "rnbqkb1r/ppp2ppp/4p3/8/3P4/2N2N2/PPP3PP/R1BQKB1R w KQkq - 0 6",
                                            "moveSan": "e6",
                                            "children": {
                                              "Bg5": {
                                                "fen": "rnbqkb1r/ppp2ppp/4p3/6B1/3P4/2N2N2/PPP3PP/R2QKB1R b KQkq - 1 6",
                                                "moveSan": "Bg5",
                                                "children": {
                                                  "Be7": {
                                                    "fen": "rnbqk2r/ppp1bppp/4p3/6B1/3P4/2N2N2/PPP3PP/R2QKB1R w KQkq - 2 7",
                                                    "moveSan": "Be7",
                                                    "children": {
                                                      "Bd3": {
                                                        "fen": "rnbqk2r/ppp1bppp/4p3/6B1/3P4/2NB1N2/PPP3PP/R2QK2R b KQkq - 3 7",
                                                        "moveSan": "Bd3",
                                                        "children": {
                                                          "O-O": {
                                                            "fen": "rnbq1rk1/ppp1bppp/4p3/6B1/3P4/2NB1N2/PPP3PP/R2Q1RK1 w - - 4 8",
                                                            "moveSan": "O-O",
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
