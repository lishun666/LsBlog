package com.database.service;

import com.database.domain.User;

/**
 * @Author: li.shun
 * @Description: 用户service
 * @Date: 2020/5/31 17:32
 * @Version: 1.0
 */
public interface UserService {
    /*
    *
     * @Author shunshun
     * @Description  获取用户信息系接口
     * @Date 17:35 2020/5/31
     * @Param [userName]
     * @return com.database.domain.User
     **/
     User getUser(String userName);

    Boolean insertUser(User user);
}
