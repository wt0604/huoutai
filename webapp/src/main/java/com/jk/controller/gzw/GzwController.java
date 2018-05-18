package com.jk.controller.gzw;

import com.jk.pojo.Maxs;
import com.jk.pojo.Mins;
import com.jk.pojo.Shang;
import com.jk.service.GzwService;
import com.jk.pojo.Goods;
import com.jk.util.ExportExcel;
import com.jk.util.FileUtil;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/GzwController")
public class GzwController {

    @Autowired
    private GzwService gzwService;

    //查询
    @RequestMapping("/queryGoodsInfo")
    @ResponseBody
    public Map<String, Object> queryGoodsInfo(Integer page, Integer rows, Goods goods){
        Map<String, Object> map = new HashMap<String, Object>();
        //总条数
        map.put("total", gzwService.queryGoodsInfoWhere(goods).size());
        //总记录数
        map.put("rows", gzwService.queryGoodsInfoPage(page, rows, goods));
        System.out.println(map);
        return map;
    }

    //4.图片上传
    @RequestMapping(value="fileUpload", method= RequestMethod.POST)
    public void fileUpload(@RequestParam(value="uploadFile") MultipartFile uploadFile,
                           HttpServletRequest request,HttpServletResponse response) throws IOException {
        //把multipartFile对象转换成File对象
        CommonsMultipartFile cf = (CommonsMultipartFile)uploadFile;
        DiskFileItem fi = (DiskFileItem) cf.getFileItem();
        File file = fi.getStoreLocation();
        String url = FileUtil.upLoad(file, uploadFile.getOriginalFilename(), "img", request);
        //设施响应的消息头
        response.setContentType("type=text/html;charset=UTF-8");
        url = request.getContextPath()+url;
        response.getWriter().write(url);
    }

    //新增
    @RequestMapping("/addGoodsInfo")
    @ResponseBody
    public Map<String, Object> addGoodsInfo(Goods goods, @RequestParam(value="uploadimg", required=false) MultipartFile uploadimg,
                                            HttpServletRequest request, String oldimg){
        System.out.println(goods);
        return gzwService.addGoodsInfo(goods/*, uploadimg, oldimg, request*/);
    }

    //回显数据
    @RequestMapping("/queryGoodsById")
    public ModelAndView queryGoodsById(Integer id){
        ModelAndView mav = new ModelAndView("gzw/editGoods");
        mav.addObject("goods", gzwService.queryGoodsById(id));
        return mav;
    }

    //删除
    @RequestMapping("/deleteGoodsInfo")
    @ResponseBody
    public Map<String, Object> deleteGoodsInfo(String ids){
        return gzwService.deleteGoodsInfo(ids);
    }

    //POI导出
    @RequestMapping("/exportInfo")
    public void exportInfo(HttpServletRequest request, HttpServletResponse response){
        //查询数据
        List<Goods> list = gzwService.getGoodsInfo();
        //设置表头
        String[] rowName = {"商品编号", "商品名称", "商品进价", "商品售价", "入库数量", "入库时间", "出库数量", "出库时间", "当前库存"};

        List<Object[]> dataList = new ArrayList<Object[]>();
        Object[] obj = null;
        for (int i = 0; i < list.size(); i++){
            obj = new Object[rowName.length];
            Goods goods = list.get(i);
            obj[0] = goods.getGoodsid();
            obj[1] = goods.getGoodsname();
            obj[2] = goods.getJinjia();
            obj[3] = goods.getGoodsprice();
            obj[4] = goods.getRunum();
            obj[5] = goods.getRudate();
            obj[6] = goods.getChunum();
            obj[7] = goods.getChudate();
            obj[8] = goods.getKucun();
            dataList.add(obj);
        }
        //调用工具类有参构造
        ExportExcel excel = new ExportExcel("库存信息详情", rowName, dataList, response);
        try {
            excel.export();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    //获取Echarts数据
    @RequestMapping("/getEcharts")
    public ModelAndView getEcharts(String maxtypename){
        System.out.println(maxtypename+"==============================");
        ModelAndView mav = new ModelAndView("gzw/goodsChars");
        List list = gzwService.getEcharts(maxtypename);
        System.out.println(list);
        mav.addObject("list", list);
        return mav;
    }

    //新增时大类回显
    @RequestMapping("/getMaxType")
    @ResponseBody
    public List<Maxs> getMaxType(){
        return gzwService.getMaxType();
    }
    //新增时大类回显
    @RequestMapping("/getMinType")
    @ResponseBody
    public List<Mins> getMinType(Integer maxid){
        return gzwService.getMinType(maxid);
    }

    //上架所需回显信息
    @RequestMapping("/queryShangById")
    public ModelAndView queryShangById(Integer id){
        ModelAndView mav = new ModelAndView("gzw/shangjia");
        mav.addObject("goods", gzwService.queryShangById(id));
        return mav;
    }

    //上架新增
    @RequestMapping("/getShangJia")
    @ResponseBody
    public Map<String, Object> getShangJia(Goods goods, Shang shang){
        return gzwService.getShangJia(goods, shang);
    }

    //补货
    @RequestMapping("/updateBuhuo")
    @ResponseBody
    public Map<String, Object> updateBuhuo(Goods goods){
        return gzwService.updateBuhuo(goods);
    }

}
