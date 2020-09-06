package com.config.controller;


import com.config.bean.ConfigBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {
    @Autowired
    private ConfigBean configBean;

    @RequestMapping("testConfig")
    @ResponseBody
    public String testConfig() {
        return configBean.toString();
    }
}
