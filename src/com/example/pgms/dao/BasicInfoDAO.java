package com.example.pgms.dao;

import com.example.pgms.bean.BasicInfo;

public interface BasicInfoDAO {
    BasicInfo getBasicInfo(String var1);

    boolean updateBasicInfo(BasicInfo var1);
}