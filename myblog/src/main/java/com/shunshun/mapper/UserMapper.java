package com.shunshun.mapper;

import com.shunshun.domain.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * @Author: li.shun
 * @Description: 用户操作mapper
 * @Date: 2020/5/31 17:20
 * @Version: 1.0
 */
@Mapper
public interface UserMapper {

    User getUser(@Param("userName") String userName);
}
