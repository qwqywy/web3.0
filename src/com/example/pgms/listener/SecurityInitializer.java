package com.example.pgms.listener;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import com.example.pgms.security.SecurityProviderConfig;

@WebListener
public class SecurityInitializer implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // 触发 SecurityProviderConfig 的静态代码块
        Class<?> providerClass = SecurityProviderConfig.class;
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // 无需操作
    }
}