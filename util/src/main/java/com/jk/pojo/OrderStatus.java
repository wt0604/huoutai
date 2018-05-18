package com.jk.pojo;

public class OrderStatus {

    private Integer yiafa;
    private Integer weifa;
    private Integer yiwan;
    private Integer yiti;

    public Integer getYiafa() {
        return yiafa;
    }

    public void setYiafa(Integer yiafa) {
        this.yiafa = yiafa;
    }

    public Integer getWeifa() {
        return weifa;
    }

    public void setWeifa(Integer weifa) {
        this.weifa = weifa;
    }

    public Integer getYiwan() {
        return yiwan;
    }

    public void setYiwan(Integer yiwan) {
        this.yiwan = yiwan;
    }

    public Integer getYiti() {
        return yiti;
    }

    public void setYiti(Integer yiti) {
        this.yiti = yiti;
    }

    @Override
    public String toString() {
        return "OrderStatus{" +
                "yiafa=" + yiafa +
                ", weifa=" + weifa +
                ", yiwan=" + yiwan +
                ", yiti=" + yiti +
                '}';
    }
}
