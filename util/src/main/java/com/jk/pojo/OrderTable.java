package com.jk.pojo;

import org.springframework.data.annotation.Id;
public class OrderTable {

    /*orId          Integer   订单号
    membernum        Integer   用户Id(关联用户表)
    goodsid     Integer   物品Id(关联商品表)
    goodsname   String    物品名称
    orNumber      Integer   物品数量
    goodsprice double    物品单价
    orAllPay      double    物品总价
    orStatus      Integer   状态
    orDate        date      时间*/


    private Integer orId;

    private String numberName;

    private Integer goodsid;
    private String goodsids;

    private Integer goodsname;
    private String goodsnames;

    private Integer orNumber;

    private double goodsprice;

    private double orAllPay;

    private Integer orStatus;

    private String orDate;
    private String orDateStart;
    private String orDateEnd;

    private String orAddress;


    public Integer getOrId() {
        return orId;
    }

    public void setOrId(Integer orId) {
        this.orId = orId;
    }

    public String getNumberName() {
        return numberName;
    }

    public void setNumberName(String numberName) {
        this.numberName = numberName;
    }

    public Integer getGoodsid() {
        return goodsid;
    }

    public void setGoodsid(Integer goodsid) {
        this.goodsid = goodsid;
    }

    public String getGoodsids() {
        return goodsids;
    }

    public void setGoodsids(String goodsids) {
        this.goodsids = goodsids;
    }

    public Integer getGoodsname() {
        return goodsname;
    }

    public void setGoodsname(Integer goodsname) {
        this.goodsname = goodsname;
    }

    public String getGoodsnames() {
        return goodsnames;
    }

    public void setGoodsnames(String goodsnames) {
        this.goodsnames = goodsnames;
    }

    public Integer getOrNumber() {
        return orNumber;
    }

    public void setOrNumber(Integer orNumber) {
        this.orNumber = orNumber;
    }

    public double getGoodsprice() {
        return goodsprice;
    }

    public void setGoodsprice(double goodsprice) {
        this.goodsprice = goodsprice;
    }

    public double getOrAllPay() {
        return orAllPay;
    }

    public void setOrAllPay(double orAllPay) {
        this.orAllPay = orAllPay;
    }

    public Integer getOrStatus() {
        return orStatus;
    }

    public void setOrStatus(Integer orStatus) {
        this.orStatus = orStatus;
    }

    public String getOrDate() {
        return orDate;
    }

    public void setOrDate(String orDate) {
        this.orDate = orDate;
    }

    public String getOrDateStart() {
        return orDateStart;
    }

    public void setOrDateStart(String orDateStart) {
        this.orDateStart = orDateStart;
    }

    public String getOrDateEnd() {
        return orDateEnd;
    }

    public void setOrDateEnd(String orDateEnd) {
        this.orDateEnd = orDateEnd;
    }

    public String getOrAddress() {
        return orAddress;
    }

    public void setOrAddress(String orAddress) {
        this.orAddress = orAddress;
    }


    @Override
    public String toString() {
        return "OrderTable{" +
                "orId=" + orId +
                ", numberName='" + numberName + '\'' +
                ", goodsid=" + goodsid +
                ", goodsids='" + goodsids + '\'' +
                ", goodsname=" + goodsname +
                ", goodsnames='" + goodsnames + '\'' +
                ", orNumber=" + orNumber +
                ", goodsprice=" + goodsprice +
                ", orAllPay=" + orAllPay +
                ", orStatus=" + orStatus +
                ", orDate='" + orDate + '\'' +
                ", orDateStart='" + orDateStart + '\'' +
                ", orDateEnd='" + orDateEnd + '\'' +
                ", orAddress='" + orAddress + '\'' +
                '}';
    }
}
