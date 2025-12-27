package com.chess.training.model;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class CreateOpeningRequest {

    private String pgn;
    private String name;
    private String variationName;

    private String description;
    private String color;

}
