package com.jk.pojo;

public class Maxgoods {

    private Integer maxTypeId;
    private String maxTypeName;

    public Integer getMaxTypeId() {
        return maxTypeId;
    }

    public void setMaxTypeId(Integer maxTypeId) {
        this.maxTypeId = maxTypeId;
    }

    public String getMaxTypeName() {
        return maxTypeName;
    }

    public void setMaxTypeName(String maxTypeName) {
        this.maxTypeName = maxTypeName;
    }

    @Override
    public String toString() {
        return "Maxgoods{" +
                "maxTypeId=" + maxTypeId +
                ", maxTypeName='" + maxTypeName + '\'' +
                '}';
    }
}
