package com;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @Author: li.shun
 * @Description: springBoot启动类
 * @Date: 2020/5/31 17:00
 * @Version: 1.0
 */
@MapperScan("com.database.dao")
@SpringBootApplication
public class BlogApplication {
    public static void main(String[] args) {
        SpringApplication.run(BlogApplication.class, args);
    }
}
