package com.example.pgms.daoImpl;

import com.example.pgms.bean.WorkExperience;
import com.example.pgms.dao.WorkExperienceDAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class WorkExperienceDAOImpl implements WorkExperienceDAO {
//    String connectionUrl = "jdbc:mysql://127.0.0.1:3306/data?user=root&password=123456&useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
String connectionUrl = "jdbc:mysql://127.0.0.1:3306/web?user=root&password=123456&useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    public WorkExperienceDAOImpl() {
    }

    public WorkExperience getWorkExperience(String userid) {
        WorkExperience workExperience = new WorkExperience();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(this.connectionUrl);
            String sql = "SELECT * FROM WorkExperience WHERE StudentID=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, userid);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                workExperience.setStudentID(rs.getInt("StudentID"));
                workExperience.setStartTime(rs.getDate("startTime"));
                workExperience.setEndTime(rs.getDate("endTime"));
                workExperience.setWorkUnit(rs.getString("workUnit"));
                workExperience.setWorkPosition(rs.getString("workPosition"));
                workExperience.setWorkDuty(rs.getString("workDuty"));
                workExperience.setProvePerson(rs.getString("provePerson"));
                workExperience.setNotes(rs.getString("notes"));
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

        return workExperience;
    }
}
