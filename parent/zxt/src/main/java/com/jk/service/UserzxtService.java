package com.jk.service;

import com.alibaba.fastjson.JSONObject;
import com.jk.pojo.Power;
import com.jk.pojo.Role;
import com.jk.pojo.User;

import java.util.List;

public interface UserzxtService {
    List<User> queryUserAllzxt(User user)throws  Exception;

    List<User> queryUserCount(Integer page, Integer rows, User user)throws  Exception;

    void delUserById(String ids)throws  Exception;

    User toUpdateuserById(Integer id)throws  Exception;

    void modifyUserzxt(User user)throws  Exception;

    void addUserzxt(User user)throws  Exception;

    User getResourcesReList(User user)throws  Exception;

    List<Role> userroles()throws  Exception;

    void addUserRole(Integer u_id, String r_id)throws  Exception;

    JSONObject queryRoleList(int page, int rows)throws  Exception;

    List<Power> queryRolePower(Integer r_id)throws  Exception;

    List<Power> selectPowerList(Power p)throws  Exception;

    void addPowerRole(String ids, Integer r_id)throws  Exception;
}
