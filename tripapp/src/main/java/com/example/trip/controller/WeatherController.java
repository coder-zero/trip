package com.example.trip.controller;

import com.example.trip.entity.vo.WeatherResponseVO;
import com.example.trip.service.WeatherDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/trip/weather")
public class WeatherController {

    @Autowired
    private WeatherDataService weatherDataService;

    @GetMapping("/cityId/{cityId}")
    public WeatherResponseVO getWeatherByCityId(@PathVariable("cityId") String cityId) {
        return weatherDataService.getDataByCityId(cityId);
    }

    @GetMapping("/cityName/{cityName}")
    public WeatherResponseVO getWeatherByCityName(@PathVariable("cityName") String cityName) {
        System.out.println(weatherDataService.getDataByCityName(cityName));
        return weatherDataService.getDataByCityName(cityName);
    }
}
