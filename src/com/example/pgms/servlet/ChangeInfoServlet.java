package com.example.pgms.servlet;

import com.example.pgms.bean.BasicInfo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet({"/changeInfoServlet"})
public class ChangeInfoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(ChangeInfoServlet.class.getName());

    public ChangeInfoServlet() {
    }

    private String getParamOrDefault(HttpServletRequest request, String param) {
        String value = request.getParameter(param);
        return value != null && !value.trim().isEmpty() ? value : "";
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentID = this.getParamOrDefault(request, "studentID");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String name = this.getParamOrDefault(request, "name");
        String namePY = this.getParamOrDefault(request, "namePY");
        String gender = this.getParamOrDefault(request, "gender");
        String nation = this.getParamOrDefault(request, "nation");

        Date birthDate;
        String nativePlace;
        try {
            nativePlace = this.getParamOrDefault(request, "birthDate");
            birthDate = nativePlace.isEmpty() ? null : sdf.parse(nativePlace);
        } catch (ParseException var31) {
            birthDate = null;
        }

        nativePlace = this.getParamOrDefault(request, "nativePlace");
        String politicalStatus = this.getParamOrDefault(request, "politicalStatus");
        String IDNumber = this.getParamOrDefault(request, "IDNumber");
        String IDType = this.getParamOrDefault(request, "IDType");
        String maritalStatus = this.getParamOrDefault(request, "maritalStatus");
        String birthPlace = this.getParamOrDefault(request, "birthPlace");
        String familyAddress = this.getParamOrDefault(request, "familyAddress");
        String phoneNumber = this.getParamOrDefault(request, "phoneNumber");
        String campusEmail = this.getParamOrDefault(request, "campusEmail");
        String personalEmail = this.getParamOrDefault(request, "personalEmail");

        try {
            String joinPartyDateStr = this.getParamOrDefault(request, "joinPartyDate");
            if (joinPartyDateStr.isEmpty()) {
            } else {
                sdf.parse(joinPartyDateStr);
            }
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }

        BasicInfo updatedInfo = new BasicInfo();
        updatedInfo.setStudentID(Integer.parseInt(studentID));
        updatedInfo.setName(name);
        updatedInfo.setNamePY(namePY);
        updatedInfo.setGender(gender);
        updatedInfo.setNation(nation);
        updatedInfo.setBirthDate(birthDate);
        updatedInfo.setNativePlace(nativePlace);
        updatedInfo.setPoliticalStatus(politicalStatus);
        updatedInfo.setIDNumber(IDNumber);
        updatedInfo.setIDType(IDType);
        updatedInfo.setMaritalStatus(maritalStatus);
        updatedInfo.setBirthPlace(birthPlace);
        updatedInfo.setFamilyAddress(familyAddress);
        updatedInfo.setPhoneNumber(phoneNumber);
        updatedInfo.setCampusEmail(campusEmail);
        updatedInfo.setPersonalEmail(personalEmail);
        updatedInfo.setCountry("");
        updatedInfo.setOriginPlace("");
        updatedInfo.setOverseas("");
        updatedInfo.setHuKouPlace("");
        updatedInfo.setHuKouDetailedPlace("");
        updatedInfo.setHuKouPostalCode("");
        updatedInfo.setRailwayStationEnd("");
        updatedInfo.setRailwayStationStart("");
        updatedInfo.setStudentLabel("");
        updatedInfo.setDepartmentID("");
        updatedInfo.setAward("");
        updatedInfo.setGrade("");
        updatedInfo.setEntranceSeason("");
        updatedInfo.setCultivationLevel("");
        updatedInfo.setStudentCategory("");
        updatedInfo.setCollege("");
        updatedInfo.setManagementDepartment("");
        updatedInfo.setMajor("");
        updatedInfo.setLengthOfSchooling("");
        updatedInfo.setEntranceMethod("");
        updatedInfo.setCampusZone("");
        updatedInfo.setStudentClass("");
        updatedInfo.setEnrollmentMajor("");
        updatedInfo.setDegreeCategory("");
        updatedInfo.setDegreeType("");
        updatedInfo.setMajorWay("");
        updatedInfo.setCultureMethod("");
        updatedInfo.setStudyMethod("");
        updatedInfo.setJinXiuCategory("");
        updatedInfo.setSpecialPlan("");
        updatedInfo.setJointTrainingUnit("");
        updatedInfo.setInterdisciplinary("");
        updatedInfo.setOverseas("");
        updatedInfo.setStudentStatus("");
        updatedInfo.setStudentStatusChangeStatus("");
        updatedInfo.setMentor("");
        updatedInfo.setMentor2("");
        updatedInfo.setJointTrainingMentors("");
        updatedInfo.setOnCampus("");
        updatedInfo.setResearchDirection("");
        updatedInfo.setRegistrationStatus("");
        updatedInfo.setPaymentStatus("");
        updatedInfo.setDegrees("");
        updatedInfo.setReceiveAcademicEducation("");
        updatedInfo.setDegreeStatus("");
        updatedInfo.setProfessionalDegreeCategory("");
        updatedInfo.setInterdisciplinaryTraining("");
        updatedInfo.setInterdisciplinaryTrainingDiscipline("");

        response.getWriter().write("修改成功！");
        LOGGER.info("研究生 " + studentID + " 成功修改信息");
        request.getRequestDispatcher("QueryChange.jsp").forward(request, response);
    }
}

