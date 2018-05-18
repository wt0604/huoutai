package com.jk.dao;



import com.jk.pojo.Maxs;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by dell on 2018/5/13.
 */
public interface MaxDao {
    List<Maxs> queryMaxsAll(@Param("maxs") Maxs maxs);

    List<Maxs> queryMaxs(@Param("begin") Integer begin, @Param("end") Integer end, @Param("maxs") Maxs maxs);

    void deleteMax(String str);

    Maxs getMaxById(@Param("id") Integer id);

    void modifyMaxs(Maxs maxs);

    void addMaxs(Maxs maxs);

    List queryMaxList();
}
