package com.jk.pojo;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class User implements Serializable{

    private Integer u_id;
    private String u_username;
    private String u_password;

    private String u_realname;
    private String u_sex;
    private String u_phone;
    private String u_age;
    private String u_dept;
    private String u_position;

    //存URL权限路径
    private Set<String> resources=new HashSet<String>();
    //不可重复的权限每个用户
    private Set<Role> roles=new HashSet<Role>();

    public Set<String> getResources() {
        return resources;
    }

    public void setResources(Set<String> resources) {
        this.resources = resources;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }

    public Integer getU_id() {
        return u_id;
    }

    public void setU_id(Integer u_id) {
        this.u_id = u_id;
    }

    public String getU_username() {
        return u_username;
    }

    public void setU_username(String u_username) {
        this.u_username = u_username;
    }

    public String getU_password() {
        return u_password;
    }

    public void setU_password(String u_password) {
        this.u_password = u_password;
    }

    public String getU_realname() {
        return u_realname;
    }

    public void setU_realname(String u_realname) {
        this.u_realname = u_realname;
    }

    public String getU_sex() {
        return u_sex;
    }

    public void setU_sex(String u_sex) {
        this.u_sex = u_sex;
    }

    public String getU_phone() {
        return u_phone;
    }

    public void setU_phone(String u_phone) {
        this.u_phone = u_phone;
    }

    public String getU_age() {
        return u_age;
    }

    public void setU_age(String u_age) {
        this.u_age = u_age;
    }

    public String getU_dept() {
        return u_dept;
    }

    public void setU_dept(String u_dept) {
        this.u_dept = u_dept;
    }

    public String getU_position() {
        return u_position;
    }

    public void setU_position(String u_position) {
        this.u_position = u_position;
    }

    @Override
    public String toString() {
        return "User{" +
                "u_id=" + u_id +
                ", u_username='" + u_username + '\'' +
                ", u_password='" + u_password + '\'' +
                ", u_realname='" + u_realname + '\'' +
                ", u_sex='" + u_sex + '\'' +
                ", u_phone='" + u_phone + '\'' +
                ", u_age='" + u_age + '\'' +
                ", u_dept='" + u_dept + '\'' +
                ", u_position='" + u_position + '\'' +
                ", resources=" + resources +
                ", roles=" + roles +
                '}';
    }
}
