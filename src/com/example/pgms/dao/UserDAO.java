package com.example.pgms.dao;

import com.example.pgms.bean.User;

public interface UserDAO {
    boolean available(String var1, String var2);

    User getUser(String var1, String var2);

    User getUser(String var1);

    boolean changeRole(String var1, String var2);
}