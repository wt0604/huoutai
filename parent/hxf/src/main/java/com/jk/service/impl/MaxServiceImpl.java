package com.jk.service.impl;

import com.jk.dao.MaxDao;
import com.jk.pojo.Maxs;
import com.jk.service.MaxService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by dell on 2018/5/13.
 */
@Service
public class MaxServiceImpl implements MaxService {

    @Resource
    private MaxDao maxDao;

    public List<Maxs> queryMaxsAll(Maxs maxs) {
        return maxDao.queryMaxsAll(maxs);
    }

    public List<Maxs> queryMaxs(Integer page, Integer rows, Maxs maxs) {
        Integer begin = (page-1)*rows;
        Integer end = page*rows;
        return maxDao.queryMaxs
                (begin,end,maxs);
    }

    public void deleteMax(String idss) {
        String[] idm = idss.split(",");
        for(String str :idm){
            maxDao.deleteMax(str);
        }


    }

    public Maxs getMaxById(Integer id) {
        return maxDao.getMaxById(id);
    }

    public void modifyMaxs(Maxs maxs) {
        maxDao.modifyMaxs(maxs);

    }

    public void addMaxs(Maxs maxs) {
        maxDao.addMaxs(maxs);

    }

    /**
     * 查询小类时加载所属大类
     * @return
     */
    public List queryMaxList() {
        return maxDao.queryMaxList();
    }
}
