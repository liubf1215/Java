package com.liubf.share.pojo;

public class Admin {
    private String adid;

    private String username;

    private String password;

    public String getAdid() {
        return adid;
    }

    public void setAdid(String adid) {
        this.adid = adid == null ? null : adid.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }
}