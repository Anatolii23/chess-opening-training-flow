INSERT INTO openings (id, name, description, player_color, move_tree_json)
VALUES (
  'b2c1d9f1-3f7a-4c7a-9a2a-0f4fbd000004',
  'Evans Gambit',
  'A romantic era masterpiece: 1.e4 e5 2.Nf3 Nc6 3.Bc4 Bc5 4.b4. White sacrifices a pawn for a dominant center and lightning attacks.',
  'white',
  '{
    "fen": "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1",
    "moveSan": "START",
    "children": {
      "e4": {
        "fen": "rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR b KQkq - 0 1",
        "moveSan": "e4",
        "children": {
          "e5": {
            "fen": "rnbqkbnr/pppp1ppp/8/4p3/4P3/8/PPPP1PPP/RNBQKBNR w KQkq - 0 2",
            "moveSan": "e5",
            "children": {
              "Nf3": {
                "fen": "rnbqkbnr/pppp1ppp/8/4p3/4P3/5N2/PPPP1PPP/RNBQKB1R b KQkq - 1 2",
                "moveSan": "Nf3",
                "children": {
                  "Nc6": {
                    "fen": "r1bqkbnr/pppp1ppp/2n5/4p3/4P3/5N2/PPPP1PPP/RNBQKB1R w KQkq - 2 3",
                    "moveSan": "Nc6",
                    "children": {
                      "Bc4": {
                        "fen": "r1bqkbnr/pppp1ppp/2n5/4p3/2B1P3/5N2/PPPP1PPP/RNBQK2R b KQkq - 3 3",
                        "moveSan": "Bc4",
                        "children": {
                          "Bc5": {
                            "fen": "r1bqk1nr/pppp1ppp/2n5/2b1p3/2B1P3/5N2/PPPP1PPP/RNBQK2R w KQkq - 4 4",
                            "moveSan": "Bc5",
                            "children": {
                              "b4": {
                                "fen": "r1bqk1nr/pppp1ppp/2n5/2b1p3/1PB1P3/5N2/P1PP1PPP/RNBQK2R b KQkq - 0 4",
                                "moveSan": "b4",
                                "children": {
                                  "Bxb4": {
                                    "fen": "r1bqk1nr/pppp1ppp/2n5/4p3/1bB1P3/5N2/P1PP1PPP/RNBQK2R w KQkq - 0 5",
                                    "moveSan": "Bxb4",
                                    "children": {
                                      "c3": {
                                        "fen": "r1bqk1nr/pppp1ppp/2n5/4p3/1bB1P3/2P2N2/P2P1PPP/RNBQK2R b KQkq - 0 5",
                                        "moveSan": "c3",
                                        "children": {
                                          "Ba5": {
                                            "fen": "r1bqk1nr/pppp1ppp/2n5/b3p3/2B1P3/2P2N2/P2P1PPP/RNBQK2R w KQkq - 1 6",
                                            "moveSan": "Ba5",
                                            "children": {
                                              "d4": {
                                                "fen": "r1bqk1nr/pppp1ppp/2n5/b3p3/2BPP3/2P2N2/P4PPP/RNBQK2R b KQkq - 0 6",
                                                "moveSan": "d4",
                                                "children": {
                                                  "exd4": {
                                                    "fen": "r1bqk1nr/pppp1ppp/2n5/b7/2BpP3/2P2N2/P4PPP/RNBQK2R w KQkq - 0 7",
                                                    "moveSan": "exd4",
                                                    "children": {
                                                      "O-O": {
                                                        "fen": "r1bqk1nr/pppp1ppp/2n5/b7/2BpP3/2P2N2/P4PPP/RNBQ1RK1 b kq - 1 7",
                                                        "moveSan": "O-O",
                                                        "children": {
                                                          "dxc3": {
                                                            "fen": "r1bqk1nr/pppp1ppp/2n5/b7/2B1P3/2p2N2/P4PPP/RNBQ1RK1 w kq - 0 8",
                                                            "moveSan": "dxc3",
                                                              "children": {
                                                                "Qb3": {
                                                                  "fen": "r1bqk1nr/pppp1ppp/2n5/b7/2B1P3/1Qp2N2/P4PPP/RNB2RK1 b kq - 1 8",
                                                                  "moveSan": "Qb3",
                                                                  "children": {
                                                                    "Qf6": {
                                                                      "fen": "r1b1k1nr/pppp1ppp/2n2q2/b7/2B1P3/1Qp2N2/P4PPP/RNB2RK1 w kq - 2 9",
                                                                      "moveSan": "Qf6",
                                                                      "children": {
                                                                        "e5": {
                                                                          "fen": "r1b1k1nr/pppp1ppp/2n2q2/b3P3/2B5/1Qp2N2/P4PPP/RNB2RK1 b kq - 0 9",
                                                                          "moveSan": "e5",
                                                                          "children": {
                                                                            "Qg6": {
                                                                              "fen": "r1b1k1nr/pppp1ppp/2n3q1/b3P3/2B5/1Qp2N2/P4PPP/RNB2RK1 w kq - 1 10",
                                                                              "moveSan": "Qg6",
                                                                              "children": {
                                                                                "Nxc3": {
                                                                                  "fen": "r1b1k1nr/pppp1ppp/2n3q1/b3P3/2B5/1QN2N2/P4PPP/R1B2RK1 b kq - 0 10",
                                                                                  "moveSan": "Nxc3",
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
                                                          },
                                                          "d6": {
                                                            "fen": "r1bqk1nr/ppp2ppp/3p4/2b5/2Bpp3/2P2N2/P2P1PPP/RNBQ1RK1 w kq - 0 8",
                                                            "moveSan": "d6",
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
                                          "Bc5": {
                                            "fen": "rnbqk1nr/pppp1ppp/2n5/2b1p3/2B1P3/2P2N2/P2P1PPP/RNBQK2R w KQkq - 1 6",
                                            "moveSan": "Bc5",
                                            "children": {
                                              "d4": {
                                                "fen": "rnbqk1nr/pppp1ppp/2n5/2b1p3/2BPP3/2P2N2/P2P1PPP/RNBQK2R b KQkq - 0 6",
                                                "moveSan": "d4",
                                                "children": {
                                                  "exd4": {
                                                    "fen": "rnbqk1nr/pppp1ppp/2n5/2b5/2Bpp3/2P2N2/P2P1PPP/RNBQK2R w KQkq - 0 7",
                                                    "moveSan": "exd4",
                                                    "children": {
                                                      "O-O": {
                                                        "fen": "rnbqk1nr/pppp1ppp/2n5/2b5/2Bpp3/2P2N2/P2P1PPP/RNBQ1RK1 b kq - 1 7",
                                                        "moveSan": "O-O",
                                                        "children": {
                                                          "d6": {
                                                            "fen": "rnbqk1nr/ppp2ppp/3p4/2b5/2Bpp3/2P2N2/P2P1PPP/RNBQ1RK1 w kq - 0 8",
                                                            "moveSan": "d6",
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
                                  "Bb6": {
                                    "fen": "rnbqk1nr/pppp1ppp/1b6/4p3/1PB1P3/5N2/P1PP1PPP/RNBQK2R w KQkq - 1 5",
                                    "moveSan": "Bb6",
                                    "children": {
                                      "a4": {
                                        "fen": "rnbqk1nr/pppp1ppp/1b6/4p3/PPB1P3/5N2/2PP1PPP/RNBQK2R b KQkq - 0 5",
                                        "moveSan": "a4",
                                        "children": {
                                          "a6": {
                                            "fen": "rnbqk1nr/1ppp1ppp/pb4/4p3/PPB1P3/5N2/2PP1PPP/RNBQK2R w KQkq - 0 6",
                                            "moveSan": "a6",
                                            "children": {
                                              "Nc3": {
                                                "fen": "rnbqk1nr/1ppp1ppp/pb4/4p3/PPB1P3/2N2N2/2PP1PPP/R1BQK2R b KQkq - 1 6",
                                                "moveSan": "Nc3",
                                                "children": {
                                                  "Nf6": {
                                                    "fen": "rnbqk2r/1ppp1ppp/pb3n2/4p3/PPB1P3/2N2N2/2PP1PPP/R1BQK2R w KQkq - 2 7",
                                                    "moveSan": "Nf6",
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
  }'
);
