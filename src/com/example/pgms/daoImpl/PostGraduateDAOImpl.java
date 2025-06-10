package com.example.pgms.daoImpl;

import com.example.pgms.dao.PostGraduateDAO;
import com.example.pgms.utils.SM3Util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class PostGraduateDAOImpl implements PostGraduateDAO {
    String connectionUrl = "jdbc:mysql://127.0.0.1:3306/web?user=root&password=123456&useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";

    public PostGraduateDAOImpl() {
    }

    public boolean changePassword(String userid, String newPassword) {
        boolean isChanged = false;
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // 对新密码进行SM3加密
            String encryptedPassword = encryptPassword(newPassword);
            if (encryptedPassword == null) {
                return false; // 加密失败，返回修改失败
            }

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(this.connectionUrl);
            String sql = "UPDATE UserInfo SET password=? WHERE UserID=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, encryptedPassword);
            pstmt.setString(2, userid);
            int result = pstmt.executeUpdate();
            if (result > 0) {
                isChanged = true;
            }
        } catch (Exception var17) {
            var17.printStackTrace();
        } finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }

                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException var16) {
                var16.printStackTrace();
            }
        }

        return isChanged;
    }

    public boolean changeLoginStatus(String userid, String Password) {
        boolean isChanged = false;
        PreparedStatement pstmt = null;

        try {
            // 对密码进行SM3加密
            String encryptedPassword = encryptPassword(Password);
            if (encryptedPassword == null) {
                return false; // 加密失败，返回修改失败
            }

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(this.connectionUrl);
            String sql = "UPDATE UserInfo SET isFirstLogin=0 WHERE UserID=? AND password=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, userid);
            pstmt.setString(2, encryptedPassword);
            int result = pstmt.executeUpdate();
            if (result > 0) {
                isChanged = true;
            }
        } catch (Exception var17) {
            var17.printStackTrace();
        } finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }

            } catch (SQLException var16) {
                var16.printStackTrace();
            }
        }

        return isChanged;
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