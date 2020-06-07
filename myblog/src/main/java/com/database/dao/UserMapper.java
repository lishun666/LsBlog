package com.database.dao;

import com.database.domain.User;
import org.apache.ibatis.annotations.Param;

/**
 * @Author: li.shun
 * @Description: 用户操作mapper
 * @Date: 2020/5/31 17:20
 * @Version: 1.0
 */
public interface UserMapper {

    User getUser(@Param("userName") String userName);

    Integer insertUser(@Param("user") User user);

}
