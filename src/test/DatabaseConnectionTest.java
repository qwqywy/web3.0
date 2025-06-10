package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnectionTest {
    public static void main(String[] args) {
        // 数据库连接信息（修改为你的实际配置）
        String url = "jdbc:mysql://localhost:3306/web";
        String username = "root";
        String password = "123456";

        try (Connection conn = DriverManager.getConnection(url, username, password)) {
            if (conn != null) {
                System.out.println("数据库连接成功！");
                System.out.println("连接信息：" + conn.getMetaData().getURL());
            }
        } catch (SQLException e) {
            System.err.println("数据库连接失败：" + e.getMessage());
            e.printStackTrace();
        }
    }
}