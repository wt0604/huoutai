package com.jk.service.impl;


import com.jk.dao.OrderDao;

import com.jk.pojo.*;
import com.jk.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class OrderServiceIml implements OrderService {

    @Autowired
       private OrderDao orderDao;

    public Map<String, Object> queryOrder(Integer page, Integer rows,OrderTable oderTable) {
        Integer integer=orderDao.queryOrder(oderTable);

        Integer startIndex=(page-1)*rows;
        Integer endIndex=rows;

        List<OrderTable> list=orderDao.queryOrderPage(startIndex,endIndex,oderTable);
        Map<String,Object> map=new HashMap<String,Object>();

        map.put("total", integer);
        map.put("rows", list);

        return map;
    }

    public void orderAdd(OrderTable orderTable) {
        orderDao.orderAdd(orderTable);
    }

    public void orderDeleById(String ids) {

        /*String[] split=ids.split(",");
        List<Integer> list=new ArrayList<Integer>();
        for (int i = 0; i < split.length; i++) {
            list.add(Integer.valueOf(split[i]));
        }
        for (String aa : idstr) {
            list.add(Integer.valueOf(aa));
        }*/
         orderDao.orderDeleById(ids);

    }

    public List<Mingoods> queryMinType(Integer maxId) {

        List<Mingoods> list=orderDao.queryMinType(maxId);
          return list;
    }

    public OrderTable huiOrder(Integer orId) {

        OrderTable orderTable=orderDao.huiOrder(orId);
           return orderTable;
    }

    public void updateOrder(OrderTable orderTable) {

        orderDao.updateOrder(orderTable);

    }

    public void updateStatus(Integer orId) {
        orderDao.updateStatus(orId);
    }

    public List<Maxgoods> queryMaxType() {
        List<Maxgoods> list=orderDao.queryMaxType();
        return list;
    }

    public List<OrderTable> exportInfo() {
        return orderDao.exportInfo();
    }

    public OrderStatus testEchar() {


        //未发货数量
        Integer wei=orderDao.testEcharWei();
        //已发货数量
       Integer yi= orderDao.testEcharYi();

        //已完成数量
        Integer wan= orderDao.testEcharWan();
        //提交财务
        Integer ti=orderDao.testEcharTi();

        OrderStatus os=new OrderStatus();
          os.setWeifa(wei);
          os.setYiafa(yi);
          os.setYiwan(wan);
          os.setYiti(ti);
        return os;
    }
    //新增财务表
   public void addMoney(Integer orId) {



        //查出对应Id的总付  在新增财务表中对应的字段  款金额  goodsprice
        OrderTable orderTable=orderDao.addMoneyGetAllPay(orId);
        double money=orderTable.getOrAllPay();
        Integer orNumber = orderTable.getOrNumber();
       //  商品名称  goodsname
         Integer ss=orderTable.getGoodsname();
         Mingoods min=orderDao.getGoodsName(ss);
         String goodsname=min.getMinTypeName();

        // 订单号 membernum
        String membernum =orderTable.getOrId().toString();

         //客户名称 username
        String username= orderTable.getNumberName();

         //提交时间 cwdate
        Date date=new Date();
        SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd");
        String format = sim.format(date);
        String cwdate=format;

        //echa  月份
       Integer echa;

       String[] split = format.split("-");
       echa= Integer.valueOf(split[1]);

       //进货价 jinprice
       double jinp= orderDao.getjinprice(ss);
       double jinprice =jinp*orNumber;
       //利润 profit
       double goodsp = orderTable.getGoodsprice();
       double profit=(goodsp-jinprice)*orNumber;

       //将值赋给实体类
      Account acc=new Account();
         acc.setCwdate(cwdate);
         acc.setGoodsname(goodsname);
         acc.setGoodsprice(money);
         acc.setJinprice(jinprice);
         acc.setMembernum(membernum);
         acc.setProfit(profit);
         acc.setUsername(username);
         acc.setEcha(echa);

          System.out.print(acc.getMembernum());
       //新增财务信息
       //orderDao.addMoneyPay3(acc);
       orderDao.addMoneyPay2(acc);

       //修改状态
       orderDao.updateStatusPay(orId);


   }

    public void orderDeleTuiById(Integer orId) {

        orderDao.orderDeleTuiById(orId);

    }


}
