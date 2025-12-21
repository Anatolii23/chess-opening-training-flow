INSERT INTO openings (id, name, description, player_color, move_tree_json)
VALUES (
  'b2c1d9f1-3f7a-4c7a-9a2a-0f4fbd000005',
  'Englund Gambit',
  'A provocative Black gambit: 1.d4 e5. Black challenges the center immediately, leading to wild and tactical positions.',
  'black',
  '{
    "fen": "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1",
    "moveSan": "START",
    "children": {
      "d4": {
        "fen": "rnbqkbnr/pppppppp/8/8/3P4/8/PPP1PPPP/RNBQKBNR b KQkq - 0 1",
        "moveSan": "d4",
        "children": {
          "e5": {
            "fen": "rnbqkbnr/pppp1ppp/8/4p3/3P4/8/PPP1PPPP/RNBQKBNR w KQkq - 0 2",
            "moveSan": "e5",
            "children": {
              "dxe5": {
                "fen": "rnbqkbnr/pppp1ppp/8/4P3/8/8/PPP1PPPP/RNBQKBNR b KQkq - 0 2",
                "moveSan": "dxe5",
                "children": {
                  "Nc6": {
                    "fen": "r1bqkbnr/pppp1ppp/2n5/4P3/8/8/PPP1PPPP/RNBQKBNR w KQkq - 1 3",
                    "moveSan": "Nc6",
                    "children": {
                      "Nf3": {
                        "fen": "r1bqkbnr/pppp1ppp/2n5/4P3/8/5N2/PPP1PPPP/RNBQKB1R b KQkq - 2 3",
                        "moveSan": "Nf3",
                        "children": {
                          "Qe7": {
                            "fen": "r1b1kbnr/ppppqppp/2n5/4P3/8/5N2/PPP1PPPP/RNBQKB1R w KQkq - 3 4",
                            "moveSan": "Qe7",
                            "children": {
                              "Qd5": {
                                "fen": "r1b1kbnr/ppppqppp/2n5/3QP3/8/5N2/PPP1PPPP/RNB1KB1R b KQkq - 4 4",
                                "moveSan": "Qd5",
                                "children": {
                                  "f6": {
                                    "fen": "r1b1kbnr/ppppq1pp/2n2p2/3QP3/8/5N2/PPP1PPPP/RNB1KB1R w KQkq - 0 5",
                                    "moveSan": "f6",
                                    "children": {
                                      "exf6": {
                                        "fen": "r1b1kbnr/ppppq1pp/2n2P2/3Q4/8/5N2/PPP1PPPP/RNB1KB1R b KQkq - 0 5",
                                        "moveSan": "exf6",
                                        "children": {
                                          "Nxf6": {
                                            "fen": "r1b1kb1r/ppppq1pp/2n2n2/3Q4/8/5N2/PPP1PPPP/RNB1KB1R w KQkq - 0 6",
                                            "moveSan": "Nxf6",
                                            "children": {
                                              "Qb3": {
                                                "fen": "r1b1kb1r/ppppq1pp/2n2n2/8/8/1Q3N2/PPP1PPPP/RNB1KB1R b KQkq - 1 6",
                                                "moveSan": "Qb3",
                                                "children": {
                                                  "d5": {
                                                    "fen": "r1b1kb1r/ppp1q1pp/2n2n2/3p4/8/1Q3N2/PPP1PPPP/RNB1KB1R w KQkq - 0 7",
                                                    "moveSan": "d5",
                                                    "children": {
                                                      "Bg5": {
                                                        "fen": "r1b1kb1r/ppp1q1pp/2n2n2/3p2B1/8/1Q3N2/PPP1PPPP/RN2KB1R b KQkq - 1 7",
                                                        "moveSan": "Bg5",
                                                        "children": {
                                                          "Bd7": {
                                                            "fen": "r3kb1r/pppbq1pp/2n2n2/3p2B1/8/1Q3N2/PPP1PPPP/RN2KB1R w KQkq - 2 8",
                                                            "moveSan": "Bd7",
                                                            "children": {
                                                              "Nbd2": {
                                                                "fen": "r3kb1r/pppbq1pp/2n2n2/3p2B1/8/1Q3N2/PPPNPPPP/R3KB1R b KQkq - 3 8",
                                                                "moveSan": "Nbd2",
                                                                "children": {
                                                                  "O-O-O": {
                                                                    "fen": "2kr1b1r/pppbq1pp/2n2n2/3p2B1/8/1Q3N2/PPPNPPPP/R3KB1R w KQ - 4 9",
                                                                    "moveSan": "O-O-O",
                                                                    "children": {
                                                                      "c3": {
                                                                        "fen": "2kr1b1r/pppbq1pp/2n2n2/3p2B1/8/1QP2N2/PP1N1PPP/R3KB1R b KQ - 0 9",
                                                                        "moveSan": "c3",
                                                                        "children": {
                                                                          "h6": {
                                                                            "fen": "2kr1b1r/pppbq1p1/2n2n1p/3p2B1/8/1QP2N2/PP1N1PPP/R3KB1R w KQ - 0 10",
                                                                            "moveSan": "h6",
                                                                            "children": {
                                                                              "Bxf6": {
                                                                                "fen": "2kr1b1r/pppbq1p1/2n2B1p/3p4/8/1QP2N2/PP1N1PPP/R3KB1R b KQ - 0 10",
                                                                                "moveSan": "Bxf6",
                                                                                "children": {
                                                                                  "Qxf6": {
                                                                                    "fen": "2kr1b1r/pppb2p1/2n2q1p/3p4/8/1QP2N2/PP1N1PPP/R3KB1R w KQ - 0 11",
                                                                                    "moveSan": "Qxf6",
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
                              },
                              "Bf4": {
                                "fen": "rnb1kbnr/ppppqppp/2n5/4P3/5B2/5N2/PPP1PPPP/RNBQKB1R b KQkq - 4 4",
                                "moveSan": "Bf4",
                                "children": {
                                  "Qb4+": {
                                    "fen": "rnb1kb1r/pppp1ppp/2n5/4P3/1q3B2/5N2/PPP1PPPP/RNBQKB1R w KQkq - 5 5",
                                    "moveSan": "Qb4+",
                                    "children": {
                                      "Bd2": {
                                        "fen": "rnb1kb1r/pppp1ppp/2n5/4P3/1q6/5N2/PPPBPPPP/RN1QKB1R b KQkq - 6 5",
                                        "moveSan": "Bd2",
                                        "children": {
                                          "Qxb2": {
                                            "fen": "rnb1kb1r/pppp1ppp/2n5/4P3/8/5N2/PqPBPPPP/RN1QKB1R w KQkq - 0 6",
                                            "moveSan": "Qxb2",
                                            "children": {
                                              "Nc3": {
                                                "fen": "rnb1kb1r/pppp1ppp/2n5/4P3/8/2N2N2/PqPBPPPP/R2QKB1R b KQkq - 1 6",
                                                "moveSan": "Nc3",
                                                "children": {
                                                  "Bb4": {
                                                    "fen": "rn2k1nr/pppp1ppp/2n5/4P3/1b6/2N2N2/PqPBPPPP/R2QKB1R w KQkq - 2 7",
                                                    "moveSan": "Bb4",
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
                          },
                          "Bc5": {
                            "fen": "rnbqk1nr/pppp1ppp/2n5/2b1P3/8/5N2/PPP1PPPP/RNBQKB1R w KQkq - 3 4",
                            "moveSan": "Bc5",
                            "children": {
                              "e4": {
                                "fen": "rnbqk1nr/pppp1ppp/2n5/2b1P3/4P3/5N2/PPP2PPP/RNBQKB1R b KQkq - 0 4",
                                "moveSan": "e4",
                                "children": {
                                  "Qe7": {
                                    "fen": "rnb1k1nr/ppppqppp/2n5/2b1P3/4P3/5N2/PPP2PPP/RNBQKB1R w KQkq - 1 5",
                                    "moveSan": "Qe7",
                                    "children": {
                                      "Bf4": {
                                        "fen": "rnb1k1nr/ppppqppp/2n5/2b1P3/4PB2/5N2/PPP2PPP/RNBQKB1R b KQkq - 2 5",
                                        "moveSan": "Bf4",
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
  }'
);
