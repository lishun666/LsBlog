package com.shunshun.domain;

/**
 * @Author: li.shun
 * @Description: 用户实体
 * @Date: 2020/5/31 17:22
 * @Version: 1.0
 */

public class User {

    private int userId;
    private String userName;
    private String passWord;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
