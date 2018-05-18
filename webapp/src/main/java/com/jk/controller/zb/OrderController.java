package com.jk.controller.zb;

import com.alibaba.fastjson.JSON;
import com.jk.pojo.Maxgoods;
import com.jk.pojo.Mingoods;
import com.jk.pojo.OrderStatus;
import com.jk.pojo.OrderTable;
import com.jk.service.OrderService;
import com.jk.util.ExportExcel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

@Controller
@RequestMapping("orderController")
public class OrderController {

    @Autowired private OrderService orderService;

    //订单 --------- 查询方法
    @RequestMapping("queryOrder")
    @ResponseBody
    public Map<String, Object> queryOrder(Integer page, Integer rows, OrderTable oderTable){

        Map<String,Object> map=orderService.queryOrder(page,rows,oderTable);

        return map;
    }

    //新增的方法
    @RequestMapping("orderAdd")
    @ResponseBody
    public String orderAdd(OrderTable orderTable){
        //总价=单价*数量
        orderTable.setOrAllPay(orderTable.getGoodsprice()*orderTable.getOrNumber());
        orderTable.setOrStatus(1);
        orderService.orderAdd(orderTable);
        return"orderAdd";
    }
    //修改的方法
    @RequestMapping("updateOrder")
    @ResponseBody
    public String updateOrder(OrderTable orderTable){
        orderTable.setOrAllPay(orderTable.getGoodsprice()*orderTable.getOrNumber());
        //orderTable.setOrStatus(1);
        orderService.updateOrder(orderTable);
        return"updateOrder";
    }
    //新增财务 增加收入
    @RequestMapping("addMoney")
    @ResponseBody
    public String addMoney(Integer orId){

        orderService.addMoney(orId);
        return"updateOrder";
    }
    //修改状态的方法
    @RequestMapping("updateStatus")
    @ResponseBody
    public String updateStatus(Integer orId){

        orderService.updateStatus(orId);
        return"updateStatus";
    }
    //修改回显的方法
    @RequestMapping("huiOrder")

    public String huiOrder(Integer orId,Model model){


        OrderTable orderTable=orderService.huiOrder(orId);
        System.out.print(orderTable);
        model.addAttribute("hui",orderTable);

        return "zb/orderAdd";
    }
    //批量删除的方法
    @RequestMapping("orderDeleById")
    @ResponseBody
    public String orderDeleById(String ids){

        orderService.orderDeleById(ids);
        return "orderDeleById";
    }
    // 同意退款 删除的方法
    @RequestMapping("orderDeleTuiById")
    @ResponseBody
    public String orderDeleTuiById(Integer orId){

        orderService.orderDeleTuiById(orId);
        return "orderDeleById";
    }
    //新增二级联动的方法
    @RequestMapping("queryMinType")
    @ResponseBody
    public String queryMinType(Integer maxId){

        List<Mingoods> list=orderService.queryMinType(maxId);

           return JSON.toJSONString(list);
    }
    //新增一级联动的方法
    @RequestMapping("queryMaxType")
    @ResponseBody
    public String queryMaxType(){

        List<Maxgoods> list=orderService.queryMaxType();

           return JSON.toJSONString(list);
    }
    //关闭echar 窗口
    @RequestMapping("echarClose")
    @ResponseBody
    public String echarClose(){

           return "echarClose";
    }
    //Echar状态的方法
    @RequestMapping("testEchar")
    public String testEchar(Model model){

        OrderStatus os=orderService.testEchar();
          //System.out.print(os);
          model.addAttribute("os",os);
           return "zb/orderEchar";
    }
   //test export excls
    @RequestMapping("exportInfo")
    public void exportInfo(HttpServletResponse response, HttpServletRequest request) {
        //  查询数据
        List<OrderTable> list = orderService.exportInfo();
        //  设置标头
        String[] rowName = {"订单编号", "顾客姓名", "商品名称", "物品单价", "购买数量", "支付费用", "发货地址", "购买日期"};

        List<Object[]> dataList = new ArrayList<Object[]>();
        Object[] obj = null;
        for (int i = 0; i < list.size(); i++) {
            obj = new Object[rowName.length];
            OrderTable u = list.get(i);
            obj[0] = u.getOrId();
            obj[1] = u.getNumberName();
            obj[2] = u.getGoodsid();
            obj[3] = u.getGoodsname();
            obj[4] = u.getOrNumber();
            obj[5] = u.getOrAllPay();
            obj[6] = u.getOrAddress();
            obj[7] = u.getOrDate();
            dataList.add(obj);
        }
        ExportExcel exportExcel = new ExportExcel("已完成订单表",rowName, dataList, response);
        try {
            exportExcel.export();
        } catch (Exception e) {
            e.printStackTrace();
        }


    }



    }


