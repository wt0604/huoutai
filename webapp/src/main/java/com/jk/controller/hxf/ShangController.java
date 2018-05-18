package com.jk.controller.hxf;

import com.jk.pojo.Shang;
import com.jk.service.ShangService;
import com.jk.util.ExportExcel;
import com.jk.util.FileUtil;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by dell on 2018/5/13.
 */

@Controller
@RequestMapping("shangController")
public class ShangController {

    @Resource
    private ShangService shangService;

    /**
     * 分页查询
     * @param page
     * @param rows
     * @param shang
     * @return
     */
    @RequestMapping("queryShang")
    @ResponseBody
    public Map<String, Object> queryShang(Integer page,Integer rows,Shang shang){
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("total",shangService.queryShangAll(shang).size());
        map.put("rows",shangService.queryShang(page,rows,shang));
        return map;
    }

    /**
     * 删除
     * @param idss
     * @return
     */
    @RequestMapping("deleteShang")
    @ResponseBody
    public String deleteShang(String idss){
        shangService.deleteShang(idss);
        return "success";

    }

    /**
     *修改
     * @param id
     * @return
     */
    @RequestMapping("toUpdateShang")
    public ModelAndView toUpdateShang(Integer id){
        ModelAndView mav = new ModelAndView("/hxf/addShang");
        mav.addObject("shang",shangService.getShangById(id));
        return mav;
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

    //4.图片上传1
    @RequestMapping(value="fileUpload1", method= RequestMethod.POST)
    public void fileUpload1(@RequestParam(value="uploadFile1") MultipartFile uploadFile1,
                           HttpServletRequest request,HttpServletResponse response) throws IOException {
        //把multipartFile对象转换成File对象
        CommonsMultipartFile cf = (CommonsMultipartFile)uploadFile1;
        DiskFileItem fi = (DiskFileItem) cf.getFileItem();
        File file = fi.getStoreLocation();
        String url = FileUtil.upLoad(file, uploadFile1.getOriginalFilename(), "img", request);
        //设施响应的消息头
        response.setContentType("type=text/html;charset=UTF-8");
        url = request.getContextPath()+url;
        response.getWriter().write(url);
    }

    //4.图片上传2
    @RequestMapping(value="fileUpload2", method= RequestMethod.POST)
    public void fileUpload2(@RequestParam(value="uploadFile2") MultipartFile uploadFile2,
                            HttpServletRequest request,HttpServletResponse response) throws IOException {
        //把multipartFile对象转换成File对象
        CommonsMultipartFile cf = (CommonsMultipartFile)uploadFile2;
        DiskFileItem fi = (DiskFileItem) cf.getFileItem();
        File file = fi.getStoreLocation();
        String url = FileUtil.upLoad(file, uploadFile2.getOriginalFilename(), "img", request);
        //设施响应的消息头
        response.setContentType("type=text/html;charset=UTF-8");
        url = request.getContextPath()+url;
        response.getWriter().write(url);
    }

    //4.图片上传3
    @RequestMapping(value="fileUpload3", method= RequestMethod.POST)
    public void fileUpload3(@RequestParam(value="uploadFile3") MultipartFile uploadFile3,
                            HttpServletRequest request,HttpServletResponse response) throws IOException {
        //把multipartFile对象转换成File对象
        CommonsMultipartFile cf = (CommonsMultipartFile)uploadFile3;
        DiskFileItem fi = (DiskFileItem) cf.getFileItem();
        File file = fi.getStoreLocation();
        String url = FileUtil.upLoad(file, uploadFile3.getOriginalFilename(), "img", request);
        //设施响应的消息头
        response.setContentType("type=text/html;charset=UTF-8");
        url = request.getContextPath()+url;
        response.getWriter().write(url);
    }

    //4.图片上传4
    @RequestMapping(value="fileUpload4", method= RequestMethod.POST)
    public void fileUpload4(@RequestParam(value="uploadFile4") MultipartFile uploadFile4,
                            HttpServletRequest request,HttpServletResponse response) throws IOException {
        //把multipartFile对象转换成File对象
        CommonsMultipartFile cf = (CommonsMultipartFile)uploadFile4;
        DiskFileItem fi = (DiskFileItem) cf.getFileItem();
        File file = fi.getStoreLocation();
        String url = FileUtil.upLoad(file, uploadFile4.getOriginalFilename(), "img", request);
        //设施响应的消息头
        response.setContentType("type=text/html;charset=UTF-8");
        url = request.getContextPath()+url;
        response.getWriter().write(url);
    }

    /**
     * 新增和修改
     *
     */
    @RequestMapping("addShang")
    @ResponseBody
    public Map<String,Object> addShang(Shang shang){
        Map<String,Object> map = new HashMap<String, Object>();
        try {
            if(shang.getGoodsid()!=null){
                shang.setShangdate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()).toString());
                //执行修改
                shangService.modifyShang(shang);
                map.put("msg", "修改成功！");
            }else{
                shang.setShangdate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()).toString());
                //执行新增
                System.out.print(shang);
                shangService.addShang(shang);
                map.put("msg", "新增成功！");
            }
            map.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
            map.put("msg", "执行失败！");
        }
        return map;
    }

    /**
     * 导出
     * @param response
     * @param request
     * @throws Exception
     */
    @RequestMapping("exportList")
    public void exportList(HttpServletResponse response,HttpServletRequest request) throws Exception {

        //定义头部信息
        String title = "商品管理名单";
        String[] rowName = {"编号","商品名称","图片","上架时间","价格","状态","数量","所属小类","详情信息","颜色","规格"};
        List<Shang> list = shangService.exportList();
        List<Object[]> dataList = new ArrayList<Object[]>();
        Object[] obj = null;
        for (int i = 0; i < list.size(); i++) {
            obj = new Object[rowName.length];
            Shang u = list.get(i);
            obj[0] = u.getGoodsid();
            obj[1] = u.getGoodsname();
            obj[2] = u.getGoodsimg();
            obj[3] = u.getShangdate();
            obj[4] = u.getGoodsprice();
            obj[5] = u.getZhuangtai();
            obj[6] = u.getChunum();
            obj[7] = u.getMintypeid();
            obj[8] = u.getGoodsinfo();
            obj[9] = u.getGoodscolor();
            obj[10] = u.getGoodsgg();
            dataList.add(obj);
        }
        ExportExcel exportExcel = new ExportExcel("商品信息",rowName, dataList, response);
        exportExcel.export();

    }
    //停售
    @RequestMapping("Ting")
    @ResponseBody
    public String Suo(@RequestParam("goodsid") Integer goodsid){

        shangService.Ting(goodsid);
        return"updateSuccess";
    }
    //开售
    @RequestMapping("Kai")
    @ResponseBody
    public String Kai(@RequestParam("goodsid") Integer goodsid){

        shangService.Kai(goodsid);
        return"updateSuccess";
    }
}
