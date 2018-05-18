package com.jk.service;

import com.jk.pojo.Maxgoods;
import com.jk.pojo.Mingoods;
import com.jk.pojo.OrderStatus;
import com.jk.pojo.OrderTable;

import java.util.List;
import java.util.Map;

public interface OrderService {
    Map<String,Object> queryOrder(Integer page, Integer rows, OrderTable oderTable);

    void orderAdd(OrderTable orderTable);

    void orderDeleById(String ids);

    List<Mingoods> queryMinType(Integer maxId);

    OrderTable huiOrder(Integer orId);

    void updateOrder(OrderTable orderTable);

    void updateStatus(Integer orId);

    List<Maxgoods> queryMaxType();

    List<OrderTable> exportInfo();

    OrderStatus testEchar();

    void addMoney(Integer orId);

    void orderDeleTuiById(Integer orId);
}
