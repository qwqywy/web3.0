package com.example.pgms.daoImpl;

import com.example.pgms.bean.AdmissionInfo;
import com.example.pgms.dao.AdmissionInfoDAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdmissionInfoDAOImpl implements AdmissionInfoDAO {
//    String connectionUrl = "jdbc:mysql://127.0.0.1:3306/data?user=root&password=123456&useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
String connectionUrl = "jdbc:mysql://127.0.0.1:3306/web?user=root&password=123456&useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    public AdmissionInfoDAOImpl() {
    }

    public AdmissionInfo getAdmissionInfo(String userid) {
        AdmissionInfo admissionInfo = new AdmissionInfo();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(this.connectionUrl);
            String sql = "SELECT * FROM AdmissionInfo WHERE StudentID=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, userid);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                admissionInfo.setStudentID(rs.getInt("StudentID"));
                admissionInfo.setEnrollmentYear(rs.getInt("EnrollmentYear"));
                admissionInfo.setCandidateID(rs.getInt("CandidateID"));
                admissionInfo.setApplicationCategory(rs.getString("ApplicationCategory"));
                admissionInfo.setCandidateSource(rs.getString("CandidateSource"));
                admissionInfo.setAdmissionCategory(rs.getString("AdmissionCategory"));
                admissionInfo.setExaminationMethods(rs.getString("ExaminationMethods"));
                admissionInfo.setReturnStatus(rs.getString("ReturnStatus"));
                admissionInfo.setRetentionQualificationYears(rs.getInt("RetentionQualificationYears"));
                admissionInfo.setTargetedTrainingUnits(rs.getString("TargetedTrainingUnits"));
                admissionInfo.setTargetedTrainingUnitsPlace(rs.getString("TargetedTrainingUnitsPlace"));
                admissionInfo.setRecommendedUnit(rs.getString("RecommendedUnit"));
                admissionInfo.setFinalGraduationSchool(rs.getString("FinalGraduationSchool"));
                admissionInfo.setFinalGraduationSchoolName(rs.getString("FinalGraduationSchoolName"));
                admissionInfo.setFinalGraduationMajor(rs.getString("FinalGraduationMajor"));
                admissionInfo.setFinalGraduationMajorName(rs.getString("FinalGraduationMajorName"));
                admissionInfo.setLastDegreeUnit(rs.getString("LastDegreeUnit"));
                admissionInfo.setFinalGraduationCertificateNumber(rs.getString("FinalGraduationCertificateNumber"));
                admissionInfo.setFinalEducation(rs.getString("FinalEducation"));
                admissionInfo.setFinalDegree(rs.getString("FinalDegree"));
                admissionInfo.setFinalGraduationDate(rs.getString("FinalGraduationDate"));
                admissionInfo.setFinalDegreeDate(rs.getString("FinalDegreeDate"));
                admissionInfo.setFinalAcademicLearningForm(rs.getString("FinalAcademicLearningForm"));
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

        return admissionInfo;
    }
}
