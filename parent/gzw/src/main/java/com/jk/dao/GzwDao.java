package com.jk.dao;

import com.jk.pojo.Goods;
import com.jk.pojo.Maxs;
import com.jk.pojo.Mins;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GzwDao {
    List<Goods> queryGoodsInfoWhere(@Param("goods") Goods goods);

    List<Goods> queryGoodsInfoPage(@Param("begin") Integer begin, @Param("end") Integer end, @Param("goods") Goods goods);

    void addGoodsInfo(Goods goods);

    void updateGoodsInfo(Goods goods);

    Goods queryGoodsById(Integer id);

    void deleteGoodsInfo(@Param("ids") String ids);

    List<Goods> getGoodsInfo();

    List getEcharts(String maxtypename);

    List<Maxs> getMaxType();

    List<Mins> getMinType(Integer maxid);

    Goods queryShangById(Integer id);

    void updateChuku(@Param("goodsid") Integer goodsid, @Param("chunum") Integer chunum, @Param("chudate") String chudate, @Param("num") Integer num);

    Goods queryKuCun(Integer goodsid);

    void updateBuhuo(@Param("goodsid") Integer goodsid, @Param("runum") Integer runum, @Param("rudate") String rudate);
}
