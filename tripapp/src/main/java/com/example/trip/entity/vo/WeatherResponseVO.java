package com.example.trip.entity.vo;

import lombok.Data;

import java.io.Serializable;

@Data
public class WeatherResponseVO implements Serializable {
    private static final long serialVersionUID = -8483256225271502962L;
    private WeatherVO data;
    private Integer status;
    private String desc;
}
