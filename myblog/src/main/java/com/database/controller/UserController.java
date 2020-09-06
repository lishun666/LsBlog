package com.database.controller;

import com.alibaba.fastjson.JSONObject;
import com.database.domain.User;
import com.database.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * @Author: li.shun
 * @Description: 用户controller
 * @Date: 2020/5/31 17:35
 * @Version: 1.0
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Resource
    private UserService userService;

    @RequestMapping("/getUser")
    @ResponseBody
    public String getUser(String userName) {
        User user = userService.getUser(userName);
        return JSONObject.toJSONString(user);
    }

    @RequestMapping("/insertUser")
    public String insertUser(User user) {
        userService.insertUser(user);
        return "success";
    }


}
