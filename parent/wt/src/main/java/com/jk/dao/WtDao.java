package com.jk.dao;

import com.jk.pojo.Member;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface WtDao {
    List<Member> queryMember(@Param("begin") Integer begin, @Param("end")Integer end, @Param("member")Member member);

    List<Member> queryMemberAll(@Param("member")Member member);

    void delMember(@Param("ids")String ids);

    Member getMemberById(@Param("id")Integer id);

    void modifyMember(Member member);

    void addMember(Member member);

    void Suo(Integer memeberid);

    void Jie(Integer memeberid);
}
