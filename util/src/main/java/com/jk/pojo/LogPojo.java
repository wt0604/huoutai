package com.jk.pojo;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.io.Serializable;

@Document(collection="logpojo")
public class LogPojo implements Serializable{



    @Id
    private String logid;
    private Object returnvals;
    private String methodname;
    private Object params;
    private String urlstr;
    private String acttime;

    private String logtimestart;
    private String logtimeend;

    public String getLogid() {
        return logid;
    }

    public void setLogid(String logid) {
        this.logid = logid;
    }

    public Object getReturnvals() {
        return returnvals;
    }

    public void setReturnvals(Object returnvals) {
        this.returnvals = returnvals;
    }

    public String getMethodname() {
        return methodname;
    }

    public void setMethodname(String methodname) {
        this.methodname = methodname;
    }

    public Object getParams() {
        return params;
    }

    public void setParams(Object params) {
        this.params = params;
    }

    public String getUrlstr() {
        return urlstr;
    }

    public void setUrlstr(String urlstr) {
        this.urlstr = urlstr;
    }

    public String getActtime() {
        return acttime;
    }

    public void setActtime(String acttime) {
        this.acttime = acttime;
    }

    public String getLogtimestart() {
        return logtimestart;
    }

    public void setLogtimestart(String logtimestart) {
        this.logtimestart = logtimestart;
    }

    public String getLogtimeend() {
        return logtimeend;
    }

    public void setLogtimeend(String logtimeend) {
        this.logtimeend = logtimeend;
    }










    @Override
    public String toString() {
        return "LogPojo{" +
                "logid='" + logid + '\'' +
                ", returnvals=" + returnvals +
                ", methodname='" + methodname + '\'' +
                ", params=" + params +
                ", urlstr='" + urlstr + '\'' +
                ", acttime='" + acttime + '\'' +
                ", logtimestart='" + logtimestart + '\'' +
                ", logtimeend='" + logtimeend + '\'' +
                '}';
    }
}
