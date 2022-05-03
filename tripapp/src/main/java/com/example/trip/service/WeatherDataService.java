package com.example.trip.service;

import com.example.trip.entity.vo.WeatherResponseVO;

public interface WeatherDataService {
    // 根据城市id查询天气数据
    WeatherResponseVO getDataByCityId(String cityId);

    // 根据城市名称查询天气数据
    WeatherResponseVO getDataByCityName(String cityName);
}
