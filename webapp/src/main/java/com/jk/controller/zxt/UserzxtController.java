package com.jk.controller.zxt;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.jk.pojo.Power;
import com.jk.pojo.Role;
import com.jk.pojo.RoleList;
import com.jk.pojo.User;
import com.jk.service.UserzxtService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("userzxtController")
public class UserzxtController {

    @Autowired
    private UserzxtService userzxtService;


    //查询用户
    @RequestMapping("/queryUserzxt")
    @ResponseBody
    public Map<String,Object> queryMember(Integer page, Integer rows, User user){
        Map<String,Object> map = new HashMap<String, Object>();
        //总数据条数
        try {
            map.put("total", userzxtService.queryUserAllzxt(user).size());
        } catch (Exception e) {
            e.printStackTrace();
        }

        //每页的数据
        try {
            map.put("rows", userzxtService.queryUserCount(page,rows,user));
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(map);
        return map;
    }


    //删除用户
    @RequestMapping("delUserById")
    @ResponseBody
    public Map<String,Object> delUserById(String ids){
        Map<String,Object> map = new HashMap<String, Object>();
        try {
            userzxtService.delUserById(ids);
            map.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
        }
        return map;
    }

    //修改之根据id查询对象
    //跳新增页面
    @RequestMapping("toUpdateuserById")
    public ModelAndView toUpdateuserById(Integer id){
        ModelAndView mav = new ModelAndView("/zxt/addUserzxt");
        try {
            mav.addObject("user",userzxtService.toUpdateuserById(id));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mav;
    }
    @RequestMapping("toAdduser")
    public String toAdduser(){

        return "/zxt/addUser";
    }


    //新增用户
    @RequestMapping("/addUserzxt")
    @ResponseBody
    public Map<String,Object> addMember(User user, HttpServletRequest request, HttpServletResponse response ){
        Map<String,Object> map = new HashMap<String, Object>();
        try {
            if(user.getU_id()!=null){
                //执行修改
                userzxtService.modifyUserzxt(user);
                map.put("msg", "修改成功！");
            }else{
                //执行新增
                userzxtService.addUserzxt(user);
                map.put("msg", "新增成功！");
            }
            map.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
            map.put("msg", "执行失败！");
        }
            return map;

    }

    //跳往赋角色页面
    @RequestMapping("/tuRole")
    public String tuRole(Integer uid,HttpServletRequest request){
        System.out.println("传过来的id"+uid);
        request.setAttribute("uid",uid);

        return "/zxt/UserRoleShow";
    }

    //赋角色
    @RequestMapping("/userroles")
    @ResponseBody
    public String userroles(Integer uid){
        User user=new User();
        user.setU_id(uid);
        RoleList roleList=new RoleList();
        try {
            User usertwo=userzxtService.getResourcesReList(user);
            List<Role> rolelist=new ArrayList<Role>();
            rolelist=userzxtService.userroles();
            roleList.setList(rolelist);
            roleList.setRoles(usertwo.getRoles());
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return JSON.toJSONString(roleList);

    }

    //给用户赋权限
    @RequestMapping("/addUserRole")
    @ResponseBody
    public String addUserRole(Integer u_id,String r_id){

        try {
            userzxtService.addUserRole(u_id,r_id);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return "success";
    }


    //查询角色
    @RequestMapping("/queryRoleList")
    @ResponseBody
    public String queryRoleList(int rows,int page){
        JSONObject rolelist= null;
        try {
            rolelist=userzxtService.queryRoleList(page,rows);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return JSON.toJSONString(rolelist);
    }

    //跳转到展示权限的页面
    @RequestMapping("/toPower")
    public String toPower(Integer r_id,HttpServletRequest request){
        request.setAttribute("r_id", r_id);
        return "/zxt/PowerList";
    }


   @RequestMapping("/queryRolePower")
    @ResponseBody
    public String  queryRolePower(Integer r_id){
        List<Power> listPower = new ArrayList<Power>();
       Power p =new Power();
        try {
            List<Power> list=userzxtService.queryRolePower(r_id);
            listPower = userzxtService.selectPowerList(p);
            for (Power power : listPower) {
                for (Power power1: list) {
                    if(power.getId()==power1.getId()){
                        power.setChecked(true);
                        System.out.println("power"+power.toString());
                    }
                }
            }

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
       System.out.println("listPower"+listPower.toString());
        return JSON.toJSONString(listPower);
    }


    @RequestMapping("/addPowerRole")
    @ResponseBody
    public String addPowerRole(String ids,Integer r_id){
        try {
            userzxtService.addPowerRole(ids,r_id);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return JSON.toJSONString("success");
    }









}
