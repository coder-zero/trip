package com.example.trip.aop;

import java.lang.annotation.*;

//Method表示可以放在方法上，Type表示可以放在类上
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface LogAnnotation {

    String module() default "";

    String operator() default "";
}
