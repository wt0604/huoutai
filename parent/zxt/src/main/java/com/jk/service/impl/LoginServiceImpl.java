package com.jk.service.impl;

import com.jk.dao.LoginDao;
import com.jk.pojo.User ;
import com.jk.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private LoginDao loginDao;

    public Integer login(String username, String pwd, HttpServletRequest request) {
        User users = null;
        try {
            users = loginDao.login(username);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("123"+users);
        //先判断是否为空
        if(users != null){
            //获取前台传过来的用户名
            //0:用户名错误  1：密码错误 2：登录成功
            if(users.getU_password().equals(pwd)){
                System.out.println("2");
                        /*//登录成功
                        //如果是登录成功
                        //	从map中get出来用户对象 存到session中*/
                        request.getSession().setAttribute("user", users);
                        request.getSession().setAttribute("u_id", users.getU_id());
                        request.getSession().setAttribute("u_username", users.getU_realname());
                return  1;
            }
            //密码错误
            return 2;
        }

        //用户名不存在
        return 3;
    }

    public List queryUserByname(String username) throws Exception {
        return loginDao.queryUserByname(username);
    }

    public void regUser(String username, String pwd, Integer u_id) {
        loginDao.regUser(username,pwd,u_id);
    }
}
