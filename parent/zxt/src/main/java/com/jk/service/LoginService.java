package com.jk.service;

import com.jk.pojo.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

public interface LoginService {
    Integer login(String username, String pwd, HttpServletRequest request) throws Exception;

    List queryUserByname(String username)throws Exception;

    void regUser(String username, String pwd, Integer u_id)throws Exception;
}
