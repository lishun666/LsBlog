package com.shunshun.impl;

import com.shunshun.domain.User;
import com.shunshun.mapper.UserMapper;
import com.shunshun.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @Author: li.shun
 * @Description: 用户接口实现
 * @Date: 2020/5/31 17:34
 * @Version: 1.0
 */
@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserMapper userMapper;

    public User getUser(String userName){
        return  userMapper.getUser(userName);
    }
}
