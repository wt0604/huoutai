package com.jk.service.impl;

import com.jk.dao.MinDao;
import com.jk.dao.ShangDao;
import com.jk.pojo.Mins;
import com.jk.pojo.Shang;
import com.jk.service.MinService;
import com.jk.service.ShangService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by dell on 2018/5/13.
 */
@Service
public class ShangServiceImpl implements ShangService {

    @Resource
    private ShangDao shangDao;


    public List<Shang> queryShang(Integer page, Integer rows, Shang shang) {
        Integer begin = (page-1)*rows;
        Integer end = page*rows;
        return shangDao.queryShang(begin,end,shang);
    }

    public List<Shang> queryShangAll(Shang shang) {
        return shangDao.queryShangAll(shang);
    }

    public void deleteShang(String idss) {
        String[] idm = idss.split(",");
        for(String str :idm){
            shangDao.deleteShang(str);
        }
    }

    public Shang getShangById(Integer id) {
        return shangDao.getShangById(id);
    }

    public void modifyShang(Shang shang) {
        shangDao.modifyShang(shang);

    }

    public void addShang(Shang shang) {
        shangDao.addShang(shang);

    }

    public List<Shang> exportList() {
        return shangDao.exportList();
    }

    public void Ting(Integer goodsid) {
        shangDao.Ting(goodsid);
    }

    public void Kai(Integer goodsid) {
        shangDao.Kai(goodsid);
    }
}
