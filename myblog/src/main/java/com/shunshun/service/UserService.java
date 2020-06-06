package com.shunshun.service;

import com.shunshun.domain.User;
import com.shunshun.mapper.UserMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @Author: li.shun
 * @Description: 用户service
 * @Date: 2020/5/31 17:32
 * @Version: 1.0
 */
public interface UserService {
    /*
    *
     * @Author chengpunan
     * @Description //TODO 获取用户信息系接口
     * @Date 17:35 2020/5/31
     * @Param [userName]
     * @return com.shunshun.domain.User
     **/
     User getUser(String userName);

}
