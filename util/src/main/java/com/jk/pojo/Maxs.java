package com.jk.pojo;


public class Maxs{

    private Integer maxtypeid;
    private String maxtypename;

    public Integer getMaxtypeid() {
        return maxtypeid;
    }

    public String getMaxtypename() {
        return maxtypename;
    }

    public void setMaxtypeid(Integer maxtypeid) {
        this.maxtypeid = maxtypeid;
    }

    public void setMaxtypename(String maxtypename) {
        this.maxtypename = maxtypename;
    }

    @Override
    public String toString() {
        return "Maxs{" +
                "maxtypeid=" + maxtypeid +
                ", maxtypename='" + maxtypename + '\'' +
                '}';
    }
}
