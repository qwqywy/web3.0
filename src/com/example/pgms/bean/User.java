package com.example.pgms.bean;

import java.io.Serializable;

public class User implements Serializable {
    private String UserID;
    private String username;
    private String password;
    private String role;
    private String isfirstlogin;
    private String department;

    public User() {
    }

    public User(String UserId, String password) {
            this.UserID = UserId;
            this.password = password;
        }

    public String getUserID() {
        return this.UserID;
    }

    public void setUserID(String userID) {
        this.UserID = userID;
    }

    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return this.role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getIsfirstlogin() {
        return this.isfirstlogin;
    }

    public void setIsfirstlogin(String isfirstlogin) {
        this.isfirstlogin = isfirstlogin;
    }

    public String getDepartment() {
        return this.department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

}