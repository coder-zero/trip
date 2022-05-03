package com.example.trip;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.example.trip.mapper")
public class TripApplication {

    public static void main(String[] args) {
        SpringApplication.run(TripApplication.class, args);
    }

}
