package com.jk.pojo;


public class Mins{
    private Integer mintypeid;
    private String mintypename;

    private  String maxtypeid;
    private  String maxtypename;

    public String getMintypename() {
        return mintypename;
    }

    public Integer getMintypeid() {
        return mintypeid;
    }

    public void setMintypeid(Integer mintypeid) {
        this.mintypeid = mintypeid;
    }

    public void setMintypename(String mintypename) {
        this.mintypename = mintypename;
    }

    public String getMaxtypeid() {
        return maxtypeid;
    }

    public String getMaxtypename() {
        return maxtypename;
    }

    public void setMaxtypeid(String maxtypeid) {
        this.maxtypeid = maxtypeid;
    }

    public void setMaxtypename(String maxtypename) {
        this.maxtypename = maxtypename;
    }

    @Override
    public String toString() {
        return "Mins{" +
                "mintypeid=" + mintypeid +
                ", mintypename='" + mintypename + '\'' +
                ", maxtypeid=" + maxtypeid +
                ", maxtypename=" + maxtypename +
                '}';
    }
}
