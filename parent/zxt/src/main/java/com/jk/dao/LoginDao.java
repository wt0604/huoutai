package com.jk.dao;

import com.jk.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LoginDao {
    User login(String username);

    List queryUserByname(String username);

    void regUser(@Param("username") String username, @Param("pwd") String pwd, @Param("u_id") Integer u_id);
}
