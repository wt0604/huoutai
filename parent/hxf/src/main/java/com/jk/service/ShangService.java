package com.jk.service;


import com.jk.pojo.Shang;

import java.util.List;

/**
 * Created by dell on 2018/5/13.
 */
public interface ShangService {


    List<Shang> queryShang(Integer page, Integer rows, Shang shang);

    List<Shang> queryShangAll(Shang shang);

    void deleteShang(String idss);

    Shang getShangById(Integer id);

    void modifyShang(Shang shang);

    void addShang(Shang shang);

    List<Shang> exportList();

    void Ting(Integer goodsid);

    void Kai(Integer goodsid);
}
