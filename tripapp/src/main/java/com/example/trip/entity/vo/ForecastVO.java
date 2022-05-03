package com.example.trip.entity.vo;

import lombok.Data;

import java.io.Serializable;

@Data
public class ForecastVO implements Serializable {

    private static final long serialVersionUID = 1686655601208573654L;
    private String date;
    private String high;
    private String fengli;
    private String low;
    private String fengxiang;
    private String type;
}
