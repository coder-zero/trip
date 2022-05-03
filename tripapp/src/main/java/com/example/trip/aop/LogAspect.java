package com.example.trip.aop;

import com.alibaba.fastjson.JSON;
import com.example.trip.controller.UserController;
import com.example.trip.entity.Log;
import com.example.trip.entity.User;
import com.example.trip.service.LogService;
import com.example.trip.service.RedisService;
import com.example.trip.utils.HttpContextUtils;
import com.example.trip.utils.IpUtil;
import com.example.trip.utils.R;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;

@Component
@Aspect//切面 定义了通知和切点的关系
@Slf4j
public class LogAspect {
    @Autowired
    private RedisService redisService;
    @Autowired
    private UserController userController;
    @Autowired
    private LogService logService;

    static User currentUser = null;
    //切点
    @Pointcut("@annotation(com.example.trip.aop.LogAnnotation)")
//    @Pointcut("execution(* com.framework.quickly.controller.*.*(..))")
    public void pt(){}

    @Around("pt()")
    public Object log(ProceedingJoinPoint joinPoint) throws Throwable {
        long beginTime = System.currentTimeMillis();
        Date startTime = new Date();
        //执行方法
        Object result = joinPoint.proceed();

        //执行时长(毫秒)
        long time = System.currentTimeMillis() - beginTime;

        //保存日志
        recordLog(joinPoint,time,startTime,result);
        return result;
    }

    private void recordLog(ProceedingJoinPoint joinPoint,long time,Date startTime,Object result){
        MethodSignature signature = (MethodSignature)joinPoint.getSignature();
        Method method = signature.getMethod();
        LogAnnotation logAnnotation = method.getAnnotation(LogAnnotation.class);
        Log logItem = new Log();
        logItem.setModule(logAnnotation.module());
        logItem.setOperator(logAnnotation.operator());
        log.info("====================log start=================");
        log.info("module:{}",logAnnotation.module());
        log.info("operator:{}",logAnnotation.operator());
        logItem.setRecordDate(startTime);
        log.info("startTime:{}",startTime);

        //请求方法名
        String className = joinPoint.getTarget().getClass().getName();
        String methodName = signature.getName();
        log.info("request class:{}",className);
        log.info("request method:{}",methodName);
        logItem.setClassName(className);
        logItem.setMethodName(methodName);
        R r = (R)result;
        logItem.setOperateResult(r.getSuccess()?1:0);
        HttpServletRequest request = HttpContextUtils.getHttpServletRequest();
        if (methodName == "login") {

            User user = (User)userController.getCurrentUser().getData().get("user");
            currentUser = user;
            System.out.println(user);

        }
        if(currentUser!= null){
            logItem.setOperateName(currentUser.getRealName());
            logItem.setOperateAccount(currentUser.getUsername());
        }
        logItem.setExecuteTime((int)time);
        //获取request，设置ip地址

        log.info("ip:{}", IpUtil.getIpAddr(request));
        logItem.setIpAddress(IpUtil.getIpAddr(request));
        //请求的参数
        Object[] args = joinPoint.getArgs();
        String params;
        if(methodName == "upload"){
            params = "图片信息";
        }else if(methodName == "login"||methodName == "register"||methodName == "editPass"){
            params = "参数保密";
        }else{
            if(args.length == 0){
                params = "";
            }
            else{
                params = JSON.toJSONString(args[0]);
            }
            if(params.length()>100){
                params = "参数过多不显示";
            }else if(params.length() == 0){
                params = "无参数";
            }
        }
        logItem.setParams(params);

        log.info(String.valueOf(logItem));
        log.info("================log end===================");
        logService.save(logItem);
    }

}
