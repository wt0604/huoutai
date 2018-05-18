package com.jk.dao;



import com.jk.pojo.Maxs;
import com.jk.pojo.Shang;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by dell on 2018/5/13.
 */
public interface ShangDao {

    List<Shang> queryShang(@Param("begin") Integer begin, @Param("end") Integer end, @Param("shang") Shang shang);

    List<Shang> queryShangAll(@Param("shang") Shang shang);

    void deleteShang(String str);

    Shang getShangById(@Param("id") Integer id);

    void modifyShang(Shang shang);

    void addShang(Shang shang);

    List<Shang> exportList();

    void Ting(Integer goodsid);

    void Kai(Integer goodsid);
}
