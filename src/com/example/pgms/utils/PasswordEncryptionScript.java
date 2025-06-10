package com.example.pgms.utils;

import com.example.pgms.bean.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PasswordEncryptionScript {
    private static final String CONNECTION_URL = "jdbc:mysql://127.0.0.1:3306/web?user=root&password=123456&useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";

    public static void main(String[] args) {
        try (Connection con = DriverManager.getConnection(CONNECTION_URL)) {
            System.out.println("成功连接到数据库");

            // 1. 从数据库读取所有用户ID和明文密码
            List<User> users = readUsersFromDatabase(con);

            // 2. 对密码进行批量加密并更新
            batchUpdatePasswords(con, users);

            System.out.println("所有密码加密完成");
        } catch (SQLException e) {
            System.out.println("数据库操作失败: " + e.getMessage());
            e.printStackTrace();
        }
    }

    // 从数据库读取用户ID和明文密码
    private static List<User> readUsersFromDatabase(Connection con) throws SQLException {
        List<User> users = new ArrayList<>();
        String selectSql = "SELECT UserID, password FROM userinfo";

        try (Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery(selectSql)) {

            while (rs.next()) {
                String userId = rs.getString("UserID");
                String password = rs.getString("password");
                users.add(new User(userId, password));
            }
        }
        System.out.println("读取到 " + users.size() + " 个用户");
        return users;
    }

    // 批量加密并更新密码
    private static void batchUpdatePasswords(Connection con, List<User> users) throws SQLException {
        String updateSql = "UPDATE userinfo SET password = ? WHERE UserID = ?";

        try (PreparedStatement pstmt = con.prepareStatement(updateSql)) {
            con.setAutoCommit(false); // 开启事务

            for (User user : users) {
                String encryptedPassword = encryptPassword(user.getPassword());
                if (encryptedPassword != null) {
                    pstmt.setString(1, encryptedPassword);
                    pstmt.setString(2, user.getUserID());
                    pstmt.addBatch();
                }
            }

            int[] results = pstmt.executeBatch();
            con.commit(); // 提交事务

            int totalUpdated = 0;
            for (int count : results) {
                totalUpdated += count;
            }
            System.out.println("成功更新 " + totalUpdated + " 个用户密码");
        } catch (SQLException e) {
            con.rollback(); // 回滚事务
            throw e;
        } finally {
            con.setAutoCommit(true); // 恢复自动提交
        }
    }

    private static String encryptPassword(String password) {
        try {
            String encryptedPassword = SM3Util.hash(password);
            System.out.println("原始密码: " + password + ", 加密后的密码: " + encryptedPassword);
            return encryptedPassword;
        } catch (Exception e) {
            System.out.println("密码加密失败: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

}