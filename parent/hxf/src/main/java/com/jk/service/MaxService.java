package com.jk.service;


import com.jk.pojo.Maxs;

import java.util.List;

/**
 * Created by dell on 2018/5/13.
 */
public interface MaxService {

    List<Maxs> queryMaxsAll(Maxs maxs);

    List<Maxs> queryMaxs(Integer page, Integer rows, Maxs maxs);

    void deleteMax(String idss);

    Maxs getMaxById(Integer id);

    void modifyMaxs(Maxs maxs);

    void addMaxs(Maxs maxs);

    List queryMaxList();
}
