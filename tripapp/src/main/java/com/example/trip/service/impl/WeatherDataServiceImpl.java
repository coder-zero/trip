package com.example.trip.service.impl;

import com.example.trip.entity.vo.WeatherResponseVO;
import com.example.trip.service.WeatherDataService;
import com.example.trip.utils.StringUtil;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.json.JSONObject;
import org.json.XML;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.io.IOException;
import java.util.Collections;

@Service
public class WeatherDataServiceImpl implements WeatherDataService {
    private static final String WEATHER_URL = "http://wthrcdn.etouch.cn/weather_mini?";
//    private static final String WEATHER_URL = "http://wthrcdn.etouch.cn/WeatherApi?";


    @Override
    public WeatherResponseVO getDataByCityId(String cityId) {
        String uri = WEATHER_URL + "citykey=" + cityId;
        return null;

    }

    @Override
    public WeatherResponseVO getDataByCityName(String cityName) {
        String uri = WEATHER_URL + "city=" + cityName;
        System.out.println(uri);


            RestTemplate restTemplate = new RestTemplate();
            ResponseEntity<String> response = restTemplate.getForEntity(uri, String.class);

            String strBody = null;

            if (response.getStatusCodeValue() == 200) {
                strBody = response.getBody();
                try {
                    strBody = StringUtil.conventFromGzip(strBody);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

            ObjectMapper mapper = new ObjectMapper();
            WeatherResponseVO weather = null;

            try {
                weather = mapper.readValue(strBody, WeatherResponseVO.class);
            } catch (IOException e) {
                e.printStackTrace();
            }
            return weather;


    }

}



