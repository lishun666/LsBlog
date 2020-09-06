package com.config.bean;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class ConfigBean {

    @Value("${name}")
    private String name;

    @Override
    public String toString() {
        return "ConfigBean{" +
                "name='" + name + '\'' +
                '}';
    }
}
