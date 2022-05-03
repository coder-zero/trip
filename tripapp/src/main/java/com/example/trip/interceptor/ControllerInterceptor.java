package com.example.trip.interceptor;


import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Slf4j
@Component
public class ControllerInterceptor implements HandlerInterceptor {
//    @Autowired
//    private RedisService redisService;
//
//    @Override
//    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
////        System.out.println( "进入拦截器");
//        //放行OPTIONS请求
//        log.info("访问地址"+request.getRequestURL());
//        log.info("客户端请求地址"+request.getRemoteAddr());
//        log.info("客户端请求端口"+request.getRemotePort());
//
//        log.info("请求进入拦截器");
//        String method = request.getMethod();
//        if ("OPTIONS".equals(method)) {
//            return true;
//        }
//        String accessToken = request.getHeader("token"); //获取token
////        System.out.println("accessToken" + accessToken);
////        System.out.println(redisService.getUser(accessToken));
//        log.info("accessToken = "+accessToken);
//        R r = redisService.checkHasKey(accessToken);
//        if (r.getSuccess()) {//token验证成功
//            log.info("请求通过");
//            return true;
//        }else{//验证失败
//            log.warn("请求被拦截");
//            log.warn(r.getMessage());
//            return false;
//        }
////        log.error();
//
//    }


    @Override
    public boolean preHandle(HttpServletRequest request,HttpServletResponse response, Object object) throws Exception {

        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=utf-8");
        response.setHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
        response.setHeader("Access-Control-Allow-Methods", "GET, HEAD, POST, PUT, DELETE, TRACE, OPTIONS, PATCH");
        response.setHeader("Access-Control-Allow-Credentials","true");
        return true;
    }
}

