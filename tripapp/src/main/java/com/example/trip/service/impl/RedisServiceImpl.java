package com.example.trip.service.impl;


import com.example.trip.entity.User;
import com.example.trip.service.RedisService;
import com.example.trip.utils.R;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;

import java.util.concurrent.TimeUnit;

@Slf4j
@Service
public class RedisServiceImpl implements RedisService {
    @Autowired
    private RedisTemplate redisTemplate;

    //向redis中设置token
    public boolean setUser(String token, User user){
        if(token == null || token == "" || user == null){
            return false;
        }
        ValueOperations ops=redisTemplate.opsForValue();
        ops.set(token,user,60*60*10, TimeUnit.SECONDS);
//        System.out.println(token+user);
        return true;
    }
    //通过token获取用户信息
    public User getUser(String token){
        if(token == null || token == ""){
            return null;
        }
        ValueOperations ops=redisTemplate.opsForValue();
        return (User) ops.get(token);
    }
    //判断redis中是否存在token key，以及是否过期。有的话返回
    public R checkHasKey(String token){
        if(token == null || token == ""){
            return R.error().message("token为空");
        }
        boolean isExist = redisTemplate.hasKey(token);

        if(isExist){//key存在，现在判断是否过期
            long dateLong = redisTemplate.getExpire(token);

            if(dateLong > 1?false:true){
                return R.error().message("登陆用户已过期，请重新登陆");
            }
            return R.ok().message("token验证成功");
        }else {
            return R.error().message("token不存在");
        }
    }

}
