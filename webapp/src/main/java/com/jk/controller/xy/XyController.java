package com.jk.controller.xy;


import com.alibaba.fastjson.JSON;
import com.jk.pojo.Account;
import com.jk.service.XyService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("test")
public class XyController {

    @Autowired
    private XyService xyservice;

    @RequestMapping("toShow")
    @ResponseBody
    public String query(Account emp, Integer page, Integer rows){

        Map map = xyservice.query(emp,page,rows);

        return JSON.toJSONString(map);
        }
    @RequestMapping("del")
    @ResponseBody
    public String delEmployee(@Param("id")Integer id){

        xyservice.del(id);

        return "";
    }

    @RequestMapping("addAccount")
    @ResponseBody
    public String add(Account account){

        xyservice.addAccount(account);

        return "";
    }

    @RequestMapping("queryAcc")
    public String  queryAcc(Model model){
        List list = xyservice.queryAcc();

        System.out.println(JSON.toJSONString(list));
        model.addAttribute("list",list);
        return "/account/asd";
    }





}
