package com.example.pgms.daoImpl;

import com.example.pgms.bean.User;
import com.example.pgms.dao.UserDAO;
import com.example.pgms.utils.SM3Util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class UserDAOImpl implements UserDAO {
    String connectionUrl = "jdbc:mysql://127.0.0.1:3306/web?user=root&password=123456&useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";

    public UserDAOImpl() {
    }

    public boolean available(String userid, String password) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean available = false;

        try {
            // 对输入的密码进行SM3加密
            String encryptedPassword = encryptPassword(password);
            if (encryptedPassword == null) {
                return false; // 加密失败，返回不可用
            }

            System.out.println("Encrypted Password: " + encryptedPassword);

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(this.connectionUrl);
            String sql = "SELECT * FROM userinfo WHERE UserID=? AND password=?";
            System.out.println("SQL Query: " + sql.replaceFirst("\\?", userid).replaceFirst("\\?", encryptedPassword));

            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, userid);
            pstmt.setString(2, encryptedPassword);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                available = true;
            }
        } catch (Exception var16) {
            var16.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }

                if (pstmt != null) {
                    pstmt.close();
                }
            } catch (SQLException var15) {
                var15.printStackTrace();
            }
        }

        return available;
    }

    public User getUser(String userid, String password) {
        Properties properties = new Properties();
        properties.setProperty("encrypt", "true");
        properties.setProperty("trustServerCertificate", "true");
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        User user = new User();

        try {
            // 对输入的密码进行SM3加密
            String encryptedPassword = encryptPassword(password);
            if (encryptedPassword == null) {
                return null; // 加密失败，返回null
            }

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(this.connectionUrl);
            String sql = "SELECT * FROM userinfo WHERE UserID=? AND password=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, userid);
            pstmt.setString(2, encryptedPassword);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                user.setUserID(rs.getString("UserID"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));
                user.setIsfirstlogin(rs.getString("isFirstLogin"));
                user.setDepartment(rs.getString("department"));
            } else {
                user = null;
            }
        } catch (Exception var17) {
            var17.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }

                if (pstmt != null) {
                    pstmt.close();
                }
            } catch (SQLException var16) {
                var16.printStackTrace();
            }
        }

        return user;
    }

    public User getUser(String userid) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        User user = new User();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(this.connectionUrl);
            String sql = "SELECT * FROM userinfo WHERE UserID=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, userid);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                user.setUserID(rs.getString("UserID"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));
                user.setIsfirstlogin(rs.getString("isFirstLogin"));
            } else {
                user = null;
            }
        } catch (Exception var15) {
            var15.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }

                if (pstmt != null) {
                    pstmt.close();
                }
            } catch (SQLException var14) {
                var14.printStackTrace();
            }
        }

        return user;
    }

    public boolean changeRole(String studentID, String role) {
        PreparedStatement pstmt = null;
        boolean success = false;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(this.connectionUrl);
            String sql = "UPDATE userinfo SET role=? WHERE UserID=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, role);
            pstmt.setString(2, studentID);
            pstmt.executeUpdate();
            success = true;
        } catch (Exception var15) {
            var15.printStackTrace();
        } finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
            } catch (SQLException var14) {
                var14.printStackTrace();
            }
        }

        return success;
    }

    private String encryptPassword(String password) {
        try {
            return SM3Util.hash(password);
        } catch (Exception e) {
            e.printStackTrace();
            return null; // 加密失败，返回null
        }
    }
}