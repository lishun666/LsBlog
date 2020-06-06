package com.shunshun.controller;

import com.shunshun.domain.User;
import com.shunshun.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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

    @GetMapping("/getUser")
    public String getUser(String userName) {
        User user = userService.getUser(userName);
        return user.toString();
    }

}
