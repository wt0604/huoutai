package com.jk.service.impl;

import com.jk.dao.MaxDao;
import com.jk.dao.MinDao;
import com.jk.pojo.Maxs;
import com.jk.pojo.Mins;
import com.jk.service.MaxService;
import com.jk.service.MinService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by dell on 2018/5/13.
 */
@Service
public class MinServiceImpl implements MinService {

    @Resource
    private MinDao minDao;

    public List<Mins> queryMinsAll(Mins mins) {
        return minDao.queryMinsAll(mins);
    }

    public List<Mins> queryMins(Integer page, Integer rows, Mins mins) {
        Integer begin = (page-1)*rows;
        Integer end = page*rows;
        return minDao.queryMins(begin,end,mins);
    }

    public Mins getMinById(Integer id) {
        return minDao.getMinById(id);
    }

    public void modifyMins(Mins mins) {
        minDao.modifyMins(mins);

    }

    public void addMins(Mins mins) {
        minDao.addMins(mins);

    }

    public void deleteMin(String idss) {
        String[] idm = idss.split(",");
        for(String str :idm){
            minDao.deleteMin(str);
        }
    }

    /**
     * 查询商品时加载所属小类
     * @return
     */
    public List<Mins> queryMinList() {
        return minDao.queryMinList();
    }
}
