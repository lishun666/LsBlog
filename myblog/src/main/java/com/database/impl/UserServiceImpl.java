package com.database.impl;

import com.database.domain.User;
import com.database.dao.UserMapper;
import com.database.service.UserService;
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

    public User getUser(String userName) {
        return userMapper.getUser(userName);
    }

    @Override
    public Boolean insertUser(User user) {
        return userMapper.insertUser(user) > 0;
    }
}
