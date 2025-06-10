package com.example.pgms.daoImpl;

import com.example.pgms.bean.ExtensionInfo;
import com.example.pgms.dao.ExtensionInfoDAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ExtensionInfoDAOImpl implements ExtensionInfoDAO {
//    String connectionUrl = "jdbc:mysql://127.0.0.1:3306/data?user=root&password=123456&serverTimezone=UTC&allowPublicKeyRetrieval=true";
String connectionUrl = "jdbc:mysql://127.0.0.1:3306/web?user=root&password=123456&useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    public ExtensionInfoDAOImpl() {
    }

    public ExtensionInfo getExtensionInfo(String userid) {
        ExtensionInfo extensionInfo = new ExtensionInfo();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(this.connectionUrl);
            String sql = "SELECT * FROM ExtensionInfo WHERE StudentID=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, userid);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                extensionInfo.setStudentID(rs.getInt("StudentID"));
                extensionInfo.setWxID(rs.getString("WxID"));
                extensionInfo.setQqID(rs.getString("QQID"));
                extensionInfo.setPhone(rs.getString("Phone"));
                extensionInfo.setAddress(rs.getString("Address"));
                extensionInfo.setPostCode(rs.getString("PostCode"));
                extensionInfo.setStudyUnit(rs.getString("StudyUnit"));
                extensionInfo.setUnitPhone(rs.getString("UnitPhone"));
                extensionInfo.setUnitPostCode(rs.getString("UnitPostCode"));
                extensionInfo.setUnitAddress(rs.getString("UnitAddress"));
                extensionInfo.setEmergencyContact(rs.getString("EmergencyContact"));
                extensionInfo.setEmergencyPhone(rs.getString("EmergencyPhone"));
                extensionInfo.setEmergencyPostCode(rs.getString("EmergencyPostCode"));
                extensionInfo.setEmergencyAddress(rs.getString("EmergencyAddress"));
                extensionInfo.setDormitoryAddress(rs.getString("DormitoryAddress"));
                extensionInfo.setDormitoryPhone(rs.getString("DormitoryPhone"));
                extensionInfo.setTechnicalPosition(rs.getString("TechnicalPosition"));
                extensionInfo.setAdministrativePositionLevel(rs.getString("AdministrativePositionLevel"));
                extensionInfo.setFamilyAddress(rs.getString("FamilyAddress"));
                extensionInfo.setFamilyPostCode(rs.getString("FamilyPostCode"));
                extensionInfo.setFamilyPhone(rs.getString("FamilyPhone"));
                extensionInfo.setFamilyContact(rs.getString("FamilyContact"));
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

        return extensionInfo;
    }

    public boolean updateExtensionInfo(ExtensionInfo updatedInfo) {
        PreparedStatement pstmt = null;
        Connection con = null;

        boolean var5;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(this.connectionUrl);
            String sql = "UPDATE ExtensionInfo SET WxID=?, QQID=?, Phone=?, Address=?, PostCode=?, StudyUnit=?, UnitPhone=?, UnitPostCode=?, UnitAddress=?, EmergencyContact=?, EmergencyPhone=?, EmergencyPostCode=?, EmergencyAddress=?, DormitoryAddress=?, DormitoryPhone=?, TechnicalPosition=?, AdministrativePositionLevel=?, FamilyAddress=?, FamilyPostCode=?, FamilyPhone=?, FamilyContact=? WHERE StudentID=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, updatedInfo.getWxID());
            pstmt.setString(2, updatedInfo.getQqID());
            pstmt.setString(3, updatedInfo.getPhone());
            pstmt.setString(4, updatedInfo.getAddress());
            pstmt.setString(5, updatedInfo.getPostCode());
            pstmt.setString(6, updatedInfo.getStudyUnit());
            pstmt.setString(7, updatedInfo.getUnitPhone());
            pstmt.setString(8, updatedInfo.getUnitPostCode());
            pstmt.setString(9, updatedInfo.getUnitAddress());
            pstmt.setString(10, updatedInfo.getEmergencyContact());
            pstmt.setString(11, updatedInfo.getEmergencyPhone());
            pstmt.setString(12, updatedInfo.getEmergencyPostCode());
            pstmt.setString(13, updatedInfo.getEmergencyAddress());
            pstmt.setString(14, updatedInfo.getDormitoryAddress());
            pstmt.setString(15, updatedInfo.getDormitoryPhone());
            pstmt.setString(16, updatedInfo.getTechnicalPosition());
            pstmt.setString(17, updatedInfo.getAdministrativePositionLevel());
            pstmt.setString(18, updatedInfo.getFamilyAddress());
            pstmt.setString(19, updatedInfo.getFamilyPostCode());
            pstmt.setString(20, updatedInfo.getFamilyPhone());
            pstmt.setString(21, updatedInfo.getFamilyContact());
            pstmt.setString(22, String.valueOf(updatedInfo.getStudentID()));
            int rowsUpdated = pstmt.executeUpdate();
            boolean var6 = rowsUpdated > 0;
            return var6;
        } catch (Exception var16) {
            var16.printStackTrace();
            var5 = false;
        } finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }

                if (con != null) {
                    con.close();
                }
            } catch (SQLException var15) {
                var15.printStackTrace();
            }

        }

        return var5;
    }
}
