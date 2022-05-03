package com.example.trip.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.client.ClientHttpRequestFactory;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.web.client.RestTemplate;

import java.nio.charset.StandardCharsets;

/**
 * RestTemplate配置
 * 这是一种JavaConfig的容器配置，用于spring容器的bean收集与注册，并通过参数传递的方式实现依赖注入。
 * "@Configuration"注解标注的配置类，都是spring容器配置类，springboot通过"@EnableAutoConfiguration"
 * 注解将所有标注了"@Configuration"注解的配置类，"一股脑儿"全部注入spring容器中。
 *
 * @author mht
 */
@Configuration
public class RestTemplateConfig {

    @Bean
    public RestTemplate restTemplate() {
        RestTemplate restTemplate = new RestTemplate(
                new HttpComponentsClientHttpRequestFactory()); // 使用HttpClient，支持GZIP
        restTemplate.getMessageConverters().set(1,
                new StringHttpMessageConverter(StandardCharsets.UTF_8)); // 支持中文编码
        return restTemplate;
    }

}
