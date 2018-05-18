package com.jk.service;

import com.jk.pojo.Maxs;
import com.jk.pojo.Mins;

import java.util.List;

/**
 * Created by dell on 2018/5/13.
 */
public interface MinService {

    List<Mins> queryMinsAll(Mins mins);

    List<Mins> queryMins(Integer page, Integer rows, Mins mins);

    Mins getMinById(Integer id);

    void modifyMins(Mins mins);

    void addMins(Mins mins);

    void deleteMin(String idss);

    List<Mins> queryMinList();
}
