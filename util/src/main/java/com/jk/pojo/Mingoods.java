package com.jk.pojo;

public class Mingoods {

    private Integer minTypeId;
    private String minTypeName;
    private Integer maxTypeId;

    public Integer getMinTypeId() {
        return minTypeId;
    }

    public void setMinTypeId(Integer minTypeId) {
        this.minTypeId = minTypeId;
    }

    public String getMinTypeName() {
        return minTypeName;
    }

    public void setMinTypeName(String minTypeName) {
        this.minTypeName = minTypeName;
    }

    public Integer getMaxTypeId() {
        return maxTypeId;
    }

    public void setMaxTypeId(Integer maxTypeId) {
        this.maxTypeId = maxTypeId;
    }

    @Override
    public String toString() {
        return "Mingoods{" +
                "minTypeId=" + minTypeId +
                ", minTypeName='" + minTypeName + '\'' +
                ", maxTypeId=" + maxTypeId +
                '}';
    }
}
