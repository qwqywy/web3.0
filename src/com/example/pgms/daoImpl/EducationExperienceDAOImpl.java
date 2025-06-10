package com.example.pgms.daoImpl;

import com.example.pgms.bean.EducationExperience;
import com.example.pgms.dao.EducationExperienceDAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class EducationExperienceDAOImpl implements EducationExperienceDAO {
//    String connectionUrl = "jdbc:mysql://127.0.0.1:3306/data?user=root&password=123456&useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
String connectionUrl = "jdbc:mysql://127.0.0.1:3306/web?user=root&password=123456&useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    public EducationExperienceDAOImpl() {
    }

    public EducationExperience getEducationExperience(String userid) {
        EducationExperience educationExperience = new EducationExperience();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(this.connectionUrl);
            String sql = "SELECT * FROM EducationExperience WHERE StudentID=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, userid);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                educationExperience.setStudentID(rs.getInt("StudentID"));
                educationExperience.setSchoolName(rs.getString("SchoolName"));
                educationExperience.setStartTime(rs.getDate("startTime"));
                educationExperience.setEndTime(rs.getDate("endTime"));
                educationExperience.setMajor(rs.getString("major"));
                educationExperience.setMajorDescription(rs.getString("majorDescription"));
                educationExperience.setDegree(rs.getString("degree"));
                educationExperience.setDegreeType(rs.getString("degreeType"));
                educationExperience.setGraduatePosition(rs.getString("graduatePosition"));
                educationExperience.setRestTime(rs.getString("restTime"));
                educationExperience.setIsGraduate(rs.getString("isGraduate"));
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

        return educationExperience;
    }
}
