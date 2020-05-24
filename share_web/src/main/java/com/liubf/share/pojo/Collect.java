package com.liubf.share.pojo;

import java.util.Date;

public class Collect {
    private Integer state;

    private String name;

    private String uid;

    private String pid;

    private String coid;

    private Date collecttime;

    public void setCoid(String coid) {
        this.coid = coid == null ? null : coid.trim();
    }

    public Date getCollecttime() {
        return collecttime;
    }

    public void setCollecttime(Date collecttime) {
        this.collecttime = collecttime;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getName() {
        return name;
    }

    public String getCoid() {
        return coid;
    }


    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid == null ? null : uid.trim();
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid == null ? null : pid.trim();
    }
}