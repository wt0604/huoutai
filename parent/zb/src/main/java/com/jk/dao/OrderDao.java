package com.jk.dao;

import com.jk.pojo.Account;
import com.jk.pojo.Maxgoods;
import com.jk.pojo.Mingoods;
import com.jk.pojo.OrderTable;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderDao {
    Integer queryOrder(@Param("oderTable") OrderTable oderTable);

    List<OrderTable> queryOrderPage(@Param("startIndex") Integer startIndex, @Param("endIndex") Integer endIndex, @Param("oderTable") OrderTable oderTable);

    void orderDeleById(@Param("ids") String ids);

    void orderAdd(OrderTable orderTable);

    List<Mingoods> queryMinType(@Param("maxId") Integer maxId);

    OrderTable huiOrder(@Param("orId") Integer orId);

    void updateOrder(@Param("orderTable") OrderTable orderTable);

    void updateStatus(@Param("orId") Integer orId);

    List<Maxgoods> queryMaxType();

    OrderTable addMoneyGetAllPay(@Param("orId") Integer orId);

    Mingoods getGoodsName(@Param("ss") Integer ss);

    List<OrderTable> exportInfo();

    Integer testEcharYi();

    Integer testEcharWei();

    Integer testEcharWan();

    Integer testEcharTi();

    double getjinprice(@Param("ss") Integer ss);

    void addMoneyPay2(Account acc);

    void updateStatusPay(@Param("orId") Integer orId);

    void orderDeleTuiById(@Param("orId") Integer orId);

    void addMoneyPay3(@Param("orId") Account acc);
}
