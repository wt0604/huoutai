package com.jk.controller.zxt;
import com.jk.pojo.User;
import com.jk.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

@Controller
@RequestMapping("/loginController")
public class LoginController {

    @Autowired
    private LoginService loginService;


    @RequestMapping("login")
    @ResponseBody
    public Integer login(String username, String pwd, HttpServletRequest request){
        Integer i= null;
        try {
            i = loginService.login(username,pwd,request);
            System.out.println("i="+i);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }


    @RequestMapping("/regUser")
    @ResponseBody
    public String regUser(String username,String pwd,Integer u_id){

        List list= null;
        try {
            list = loginService.queryUserByname(username);
            System.out.println(list.size());
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(list.size()>0){
            return "loginNo";
        }else{
            try {
                loginService.regUser(username,pwd,u_id);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return "loginYes";
        }
    }






}
