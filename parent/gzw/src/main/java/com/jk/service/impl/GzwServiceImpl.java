package com.jk.service.impl;

import com.jk.dao.GzwDao;
import com.jk.dao.ShangDao;
import com.jk.pojo.Maxs;
import com.jk.pojo.Mins;
import com.jk.pojo.Shang;
import com.jk.service.GzwService;
import com.jk.pojo.Goods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class GzwServiceImpl implements GzwService{

    @Autowired
    private GzwDao gzwDao;
    @Resource
    private ShangDao shangDao;
    @Override
    public List<Goods> queryGoodsInfoWhere(Goods goods) {
        List<Goods> list = gzwDao.queryGoodsInfoWhere(goods);
        return list;
    }

    @Override
    public List<Goods> queryGoodsInfoPage(Integer page, Integer rows, Goods goods) {
        Integer begin = (page - 1) * rows;
        Integer end = rows;
        List<Goods> list = gzwDao.queryGoodsInfoPage(begin, end, goods);
        return list;
    }

    @Override
    public Map<String, Object> addGoodsInfo(Goods goods) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (goods.getGoodsid() == null){
            //新增
            /*if (uploadimg != null & uploadimg.getSize() > 0){
                String url = FileUtil.upLoad(uploadimg, uploadimg.getOriginalFilename(), "img", request);
                goods.setGoodsimg(url);
            }*/
            try {
                goods.setGoodsstate(1);
                goods.setRudate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()).toString());
                goods.setKucun(goods.getRunum());
                System.out.println(goods.getKucun());
                gzwDao.addGoodsInfo(goods);
                map.put("success", true);
                map.put("msg", "新增成功！");
            }catch (Exception e){
                e.printStackTrace();
                map.put("success", false);
                map.put("msg", "新增失败！");
            }
        }else{
            //修改
            /*if (uploadimg != null & uploadimg.getSize() > 0){
                FileUtil.deleteFile(oldimg, request);
                String url = FileUtil.upLoad(uploadimg, uploadimg.getOriginalFilename(), "img", request);
                goods.setGoodsimg(url);
            }else {
                goods.setGoodsimg(oldimg);
            }*/
            try {
                gzwDao.updateGoodsInfo(goods);
                map.put("success", true);
                map.put("msg", "修改成功！");
            }catch (Exception e){
                e.printStackTrace();
                map.put("success", false);
                map.put("msg", "修改失败！");
            }
        }
        return map;
    }

    @Override
    public Goods queryGoodsById(Integer id) {
        return gzwDao.queryGoodsById(id);
    }

    @Override
    public Map<String, Object> deleteGoodsInfo(String ids) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            gzwDao.deleteGoodsInfo(ids);
            map.put("success", true);
            map.put("msg", "删除成功！");
        }catch (Exception e){
            e.printStackTrace();
            map.put("success", false);
            map.put("msg", "删除失败！");
        }
        return map;
    }

    @Override
    public List<Goods> getGoodsInfo() {
        return gzwDao.getGoodsInfo();
    }

    @Override
    public List getEcharts(String maxtypename) {
        return gzwDao.getEcharts(maxtypename);
    }

    @Override
    public List<Maxs> getMaxType() {
        return gzwDao.getMaxType();
    }

    @Override
    public List<Mins> getMinType(Integer maxid) {
        return gzwDao.getMinType(maxid);
    }

    @Override
    public Goods queryShangById(Integer id) {
        return gzwDao.queryShangById(id);
    }

    @Override
    public Map<String, Object> getShangJia(Goods goods, Shang shang) {
        Map<String, Object> map = new HashMap<String, Object>();
        shang.setGoodsid(null);
        shang.setShangdate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()).toString());
        shang.setZhuangtai(2);
        goods.setChudate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()).toString());
        try {
            shangDao.addShang(shang);
            map.put("success", true);
            map.put("msg", "上货成功！");
        }catch (Exception e){
            e.printStackTrace();
            map.put("success", false);
            map.put("msg", "上货成功！");
        }
        Goods goods1 = gzwDao.queryKuCun(goods.getGoodsid());
        Integer num = goods1.getChunum();
        if (num == null){
            num = 0;
        }
        gzwDao.updateChuku(goods.getGoodsid(), goods.getChunum(), goods.getChudate(), num);
        System.out.println(shang);
        return map;
    }

    @Override
    public Map<String, Object> updateBuhuo(Goods goods) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            goods.setRudate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()).toString());
            gzwDao.updateBuhuo(goods.getGoodsid(), goods.getRunum(), goods.getRudate());
            map.put("success", true);
            map.put("msg", "补货成功！");
        }catch (Exception e){
            e.printStackTrace();
            map.put("success", false);
            map.put("msg", "补货失败！");
        }
        return map;
    }
}
