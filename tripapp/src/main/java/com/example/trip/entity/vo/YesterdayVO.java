package com.example.trip.entity.vo;

import lombok.Data;

import java.io.Serializable;

@Data
public class YesterdayVO implements Serializable {
    private static final long serialVersionUID = -806309024676977591L;
    private String date;
    private String high;
    private String fx;
    private String low;
    private String fl;
    private String type;
}
