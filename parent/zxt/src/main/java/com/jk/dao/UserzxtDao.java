package com.jk.dao;

import com.jk.pojo.Power;
import com.jk.pojo.Role;
import com.jk.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserzxtDao {
    List<User> queryUserAllzxt(User user);

    List<User> queryUserCount(@Param("begin") Integer begin, @Param("end") Integer end, @Param("user") User user);

    void delUserById(@Param("ids") String ids);

    User toUpdateuserById(Integer id);

    void modifyUserzxt(User user);

    void addUserzxt(User user);

    List<Map<String,Object>> getResourcesReList(User user);

    List<Role> userroles();

    void deleteUserRole(Integer u_id);

    void addUserRole(List<Map<String, Object>> listmap);

    long queryRoleCount();

    List<Role> queryRoleList(@Param("start") int start, @Param("rows") int rows);

    List<Power> queryRolePower(Integer r_id);

    List<Power> selectPowerList(Power p);

    void deletePowerRole(Integer r_id);

    void addPowerRole(List<Map<String, Object>> maps);
}
