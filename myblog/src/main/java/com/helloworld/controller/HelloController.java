package com.helloworld.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author: li.shun
 * @Description: helloworld类
 * @Date: 2020/5/31 17:02
 * @Version: 1.0
 */
@RestController
public class HelloController {
    @RequestMapping("hello")
    public String sayHello(){
        return "hello world";
    }
}
