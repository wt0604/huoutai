package com.jk.service;

import com.jk.pojo.Goods;
import com.jk.pojo.Maxs;
import com.jk.pojo.Mins;
import com.jk.pojo.Shang;

import java.util.List;
import java.util.Map;

public interface GzwService {

    List<Goods> queryGoodsInfoWhere(Goods goods);

    List<Goods> queryGoodsInfoPage(Integer page, Integer rows, Goods goods);

    Map<String,Object> addGoodsInfo(Goods goods);

    Goods queryGoodsById(Integer id);

    Map<String,Object> deleteGoodsInfo(String ids);

    List<Goods> getGoodsInfo();

    List getEcharts(String maxtypename);

    List<Maxs> getMaxType();

    List<Mins> getMinType(Integer maxid);

    Goods queryShangById(Integer id);

    Map<String,Object> getShangJia(Goods goods, Shang shang);

    Map<String,Object> updateBuhuo(Goods goods);
}
