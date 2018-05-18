package com.jk.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.jk.dao.UserzxtDao;
import com.jk.pojo.Power;
import com.jk.pojo.Role;
import com.jk.pojo.User;
import com.jk.service.UserzxtService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class UserzxtServiceImpl implements UserzxtService {

    @Autowired
    private UserzxtDao userzxtDao;

    public List<User> queryUserAllzxt(User user) throws Exception {

        return userzxtDao.queryUserAllzxt(user);
    }

    public List<User> queryUserCount(Integer page, Integer rows, User user) throws Exception {
        Integer begin = (page-1)*rows;
        Integer end = page*rows;
        return userzxtDao.queryUserCount(begin,end,user);
    }

    public void delUserById(String ids) throws Exception {
        userzxtDao.delUserById(ids);
    }

    public User toUpdateuserById(Integer id) throws Exception {


        return userzxtDao.toUpdateuserById(id);
    }

    public void modifyUserzxt(User user) throws Exception {
        userzxtDao.modifyUserzxt(user);
    }

    public void addUserzxt(User user) throws Exception {
        userzxtDao.addUserzxt(user);
    }

    public User getResourcesReList(User user) throws Exception {
        //定义一个新的集合接受数据库查询到的数据
        Set<Role> roles=new HashSet<Role>();

        //查询数据库返回数据
        List<Map<String,Object>> listmap=userzxtDao.getResourcesReList(user);
        //循环查询结果
        for (Map<String, Object> map : listmap) {
            Role re=new Role();
            re.setName(map.get("r_name").toString());
            re.setId(Integer.parseInt(map.get("r_id").toString()));
            roles.add(re);
        }
        user.setRoles(roles);
        return user;
    }

    public List<Role> userroles() throws Exception {
        return userzxtDao.userroles();
    }

    public void addUserRole(Integer u_id, String r_id) throws Exception {

        userzxtDao.deleteUserRole(u_id);
        String[] ids=r_id.split(",");
        //定义集合接受前台传递的参数
        List<Map<String,Object>> listmap=new ArrayList<Map<String,Object>>();
        //循环字符串数组
        for (int i = 0; i < ids.length; i++) {
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("u_id", u_id);
            map.put("r_id", ids[i].trim());
            listmap.add(map);
        }

        userzxtDao.addUserRole(listmap);


    }

    public JSONObject queryRoleList(int page, int rows) throws Exception {
        //查询总记录数
        long total=userzxtDao.queryRoleCount();
        //计算开始条数和结束条数
        int start=(page-1)*rows;
        List<Role> stulist=userzxtDao.queryRoleList(start,rows);

        JSONObject json=new JSONObject();
        json.put("total", total);
        json.put("rows", stulist);

        return json;
    }

    public List<Power> queryRolePower(Integer r_id) throws Exception {

        return userzxtDao.queryRolePower(r_id);
    }

    public List<Power> selectPowerList(Power p) throws Exception {

        return userzxtDao.selectPowerList(p);
    }

    public void addPowerRole(String ids, Integer r_id) throws Exception {
        userzxtDao.deletePowerRole(r_id);

        String[] idss=ids.split(",");
        List<Map<String,Object>> maps =new ArrayList<Map<String,Object>>();

        for (int i = 0; i < idss.length; i++) {
            Map<String,Object> map =new HashMap<String,Object>();
            map.put("r_id", r_id);
            map.put("p_id", idss[i].trim());
            maps.add(map);
        }
        userzxtDao.addPowerRole(maps);
    }
}
