package com.example.trip.config;


import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.MapperFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import com.example.trip.interceptor.ControllerInterceptor;
import org.apache.commons.codec.Charsets;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.*;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.TimeZone;

@Configuration
public class WebConfig extends WebMvcConfigurationSupport {
    @Autowired
    private ControllerInterceptor controllerInterceptor;
//    @Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
        Jackson2ObjectMapperBuilder builder = new Jackson2ObjectMapperBuilder();
        builder.serializationInclusion(JsonInclude.Include.NON_NULL);
        ObjectMapper objectMapper = builder.build();
        SimpleModule simpleModule = new SimpleModule();
        // Long转换为String传输
        simpleModule.addSerializer(Long.class, ToStringSerializer.instance);
        objectMapper.registerModule(simpleModule);
        // 忽略 transient 修饰的属性
        objectMapper.configure(MapperFeature.PROPAGATE_TRANSIENT_MARKER, true);
        objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        // 设置为中国上海时区
        objectMapper.setTimeZone(TimeZone.getTimeZone("GMT+8"));
        objectMapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
        converters.add(new MappingJackson2HttpMessageConverter(objectMapper));
        converters.add(new StringHttpMessageConverter(Charsets.UTF_8));
        converters.add(new ByteArrayHttpMessageConverter());
        converters.add(new ResourceHttpMessageConverter());
        converters.add(new ResourceRegionHttpMessageConverter());
        super.configureMessageConverters(converters);
    }
    // 需要拦截的资源目录
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {

        String path = "E:\\img\\";//"/tools/images/";//"E:/视频制作/图片/";
        registry.addResourceHandler("/**").addResourceLocations(
                "classpath:/static/");
        registry.addResourceHandler("swagger-ui.html").addResourceLocations(
                "classpath:/META-INF/resources/");
        registry.addResourceHandler("/webjars/**").addResourceLocations(
                "classpath:/META-INF/resources/webjars/");

        //配置图片访问地址的路径映射
        registry.addResourceHandler("/image/**").addResourceLocations("file:" + path);

        super.addResourceHandlers(registry);

    }
//
    final String[] notLoginInterceptPaths =
            {"/quickly/user/register","/quickly/user/login","/quickly/role/getAllRole","/quickly/log/downLogExcel","/quickly/article/getArticleById","/quickly/fileUpload/**","/swagger-resources/**", "/webjars/**",
            "/v2/**", "/swagger-ui.html/**","/quickly/swagger-ui.html/**","/favicon.ico","/error","/csrf","/static/**","/image/**"};

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //配置拦截器
        registry.addInterceptor(controllerInterceptor).addPathPatterns("/**")
                .excludePathPatterns(notLoginInterceptPaths);
    }
//
//    跨域  可用来代替所有的跨域注解
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowCredentials(true)
                .allowedHeaders("*")
                .allowedOriginPatterns("*")
                .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS")
                .maxAge(3600);
    }
//
//
//
//    private static final String[] CLASSPATH_RESOURCE_LOCATIONS = {
//            "classpath:/META-INF/resources/", "classpath:/resources/",
//            "classpath:/static/", "classpath:/public/" };
//
//
//    @Override
//    public void addResourceHandlers(ResourceHandlerRegistry registry) {
//        if (!registry.hasMappingForPattern("/webjars/**")) {
//            registry.addResourceHandler("/webjars/**").addResourceLocations(
//                    "classpath:/META-INF/resources/webjars/");
//        }
//        if (!registry.hasMappingForPattern("/**")) {
//            registry.addResourceHandler("/**").addResourceLocations(
//                    CLASSPATH_RESOURCE_LOCATIONS);
//        }
//
//    }

}
