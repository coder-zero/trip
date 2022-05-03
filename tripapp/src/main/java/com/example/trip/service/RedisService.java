package com.example.trip.service;

import com.example.trip.entity.User;
import com.example.trip.utils.R;

public interface RedisService {

    boolean setUser(String token, User user);

    User getUser(String token);

    R checkHasKey(String token);
}
