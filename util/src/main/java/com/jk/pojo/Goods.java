package com.jk.pojo;

import java.io.Serializable;
import java.util.Date;

public class Goods {

    private Integer goodsid;

    private String goodsname;

    private Double goodsprice;

    private String goodsimg;

    private Integer goodsstate;

    private Integer runum;

    private String rudate;

    private Integer chunum;

    private String chudate;

    private Integer kucun;

    private Double jinjia;

    private String goodstype;

    private Integer mintypeid;

    private Integer maxtypeid;

    private Double jinjiaB;

    private Double jinjiaE;

    private String rudateB;

    private String rudateE;

    private String maxtypename; //类型
    private String mintypename; //种类

    public Goods() {
        super();
    }

    public Goods(Integer goodsid, String goodsname, Double goodsprice, String goodsimg, Integer goodsstate, Integer runum, String rudate, Integer chunum, String chudate, Integer kucun, Double jinjia, String goodstype, Integer mintypeid, Integer maxtypeid, Double jinjiaB, Double jinjiaE, String rudateB, String rudateE, String maxtypename, String mintypename) {
        this.goodsid = goodsid;
        this.goodsname = goodsname;
        this.goodsprice = goodsprice;
        this.goodsimg = goodsimg;
        this.goodsstate = goodsstate;
        this.runum = runum;
        this.rudate = rudate;
        this.chunum = chunum;
        this.chudate = chudate;
        this.kucun = kucun;
        this.jinjia = jinjia;
        this.goodstype = goodstype;
        this.mintypeid = mintypeid;
        this.maxtypeid = maxtypeid;
        this.jinjiaB = jinjiaB;
        this.jinjiaE = jinjiaE;
        this.rudateB = rudateB;
        this.rudateE = rudateE;
        this.maxtypename = maxtypename;
        this.mintypename = mintypename;
    }

    public Integer getGoodsid() {
        return goodsid;
    }

    public void setGoodsid(Integer goodsid) {
        this.goodsid = goodsid;
    }

    public String getGoodsname() {
        return goodsname;
    }

    public void setGoodsname(String goodsname) {
        this.goodsname = goodsname;
    }

    public Double getGoodsprice() {
        return goodsprice;
    }

    public void setGoodsprice(Double goodsprice) {
        this.goodsprice = goodsprice;
    }

    public String getGoodsimg() {
        return goodsimg;
    }

    public void setGoodsimg(String goodsimg) {
        this.goodsimg = goodsimg;
    }

    public Integer getGoodsstate() {
        return goodsstate;
    }

    public void setGoodsstate(Integer goodsstate) {
        this.goodsstate = goodsstate;
    }

    public Integer getRunum() {
        return runum;
    }

    public void setRunum(Integer runum) {
        this.runum = runum;
    }

    public String getRudate() {
        return rudate;
    }

    public void setRudate(String rudate) {
        this.rudate = rudate;
    }

    public Integer getChunum() {
        return chunum;
    }

    public void setChunum(Integer chunum) {
        this.chunum = chunum;
    }

    public String getChudate() {
        return chudate;
    }

    public void setChudate(String chudate) {
        this.chudate = chudate;
    }

    public Integer getKucun() {
        return kucun;
    }

    public void setKucun(Integer kucun) {
        this.kucun = kucun;
    }

    public Double getJinjia() {
        return jinjia;
    }

    public void setJinjia(Double jinjia) {
        this.jinjia = jinjia;
    }

    public String getGoodstype() {
        return goodstype;
    }

    public void setGoodstype(String goodstype) {
        this.goodstype = goodstype;
    }

    public Integer getMintypeid() {
        return mintypeid;
    }

    public void setMintypeid(Integer mintypeid) {
        this.mintypeid = mintypeid;
    }

    public Double getJinjiaB() {
        return jinjiaB;
    }

    public void setJinjiaB(Double jinjiaB) {
        this.jinjiaB = jinjiaB;
    }

    public Double getJinjiaE() {
        return jinjiaE;
    }

    public void setJinjiaE(Double jinjiaE) {
        this.jinjiaE = jinjiaE;
    }

    public String getRudateB() {
        return rudateB;
    }

    public void setRudateB(String rudateB) {
        this.rudateB = rudateB;
    }

    public String getRudateE() {
        return rudateE;
    }

    public void setRudateE(String rudateE) {
        this.rudateE = rudateE;
    }

    public String getMaxtypename() {
        return maxtypename;
    }

    public void setMaxtypename(String maxtypename) {
        this.maxtypename = maxtypename;
    }

    public String getMintypename() {
        return mintypename;
    }

    public void setMintypename(String mintypename) {
        this.mintypename = mintypename;
    }

    public Integer getMaxtypeid() {
        return maxtypeid;
    }

    public void setMaxtypeid(Integer maxtypeid) {
        this.maxtypeid = maxtypeid;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "goodsid=" + goodsid +
                ", goodsname='" + goodsname + '\'' +
                ", goodsprice=" + goodsprice +
                ", goodsimg='" + goodsimg + '\'' +
                ", goodsstate=" + goodsstate +
                ", runum=" + runum +
                ", rudate='" + rudate + '\'' +
                ", chunum=" + chunum +
                ", chudate='" + chudate + '\'' +
                ", kucun=" + kucun +
                ", jinjia=" + jinjia +
                ", goodstype='" + goodstype + '\'' +
                ", mintypeid=" + mintypeid +
                ", maxtypeid=" + maxtypeid +
                ", jinjiaB=" + jinjiaB +
                ", jinjiaE=" + jinjiaE +
                ", rudateB='" + rudateB + '\'' +
                ", rudateE='" + rudateE + '\'' +
                ", maxtypename='" + maxtypename + '\'' +
                ", mintypename='" + mintypename + '\'' +
                '}';
    }
}
