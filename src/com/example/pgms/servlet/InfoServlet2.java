package com.example.pgms.servlet;

import com.example.pgms.daoImpl.AdmissionInfoDAOImpl;
import com.example.pgms.daoImpl.BasicInfoDAOImpl;
import com.example.pgms.daoImpl.EducationExperienceDAOImpl;
import com.example.pgms.daoImpl.ExtensionInfoDAOImpl;
import com.example.pgms.daoImpl.WorkExperienceDAOImpl;
import com.example.pgms.bean.AdmissionInfo;
import com.example.pgms.bean.BasicInfo;
import com.example.pgms.bean.EducationExperience;
import com.example.pgms.bean.ExtensionInfo;
import com.example.pgms.bean.WorkExperience;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import org.apache.log4j.Logger;

@WebServlet("/InfoServlet2")
public class InfoServlet2 extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(InfoServlet2.class.getName());

    public InfoServlet2() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String studentID = (String)session.getAttribute("userid");
        BasicInfoDAOImpl BasicInfoDAO = new BasicInfoDAOImpl();
        BasicInfo basicInfo = BasicInfoDAO.getBasicInfo(studentID);
        AdmissionInfoDAOImpl AdmissionInfoDAO = new AdmissionInfoDAOImpl();
        AdmissionInfo admissionInfo = AdmissionInfoDAO.getAdmissionInfo(studentID);
        ExtensionInfoDAOImpl ExtensionInfoDAO = new ExtensionInfoDAOImpl();
        ExtensionInfo extensionInfo = ExtensionInfoDAO.getExtensionInfo(studentID);
        WorkExperienceDAOImpl WorkExperienceDAO = new WorkExperienceDAOImpl();
        WorkExperience workExperience = WorkExperienceDAO.getWorkExperience(studentID);
        EducationExperienceDAOImpl EducationExperienceDAO = new EducationExperienceDAOImpl();
        EducationExperience educationExperience = EducationExperienceDAO.getEducationExperience(studentID);
        LOGGER.info("检索用户信息：" + studentID);
        request.setAttribute("basicInfo", basicInfo);
        request.setAttribute("admissionInfo", admissionInfo);
        request.setAttribute("extensionInfo", extensionInfo);
        request.setAttribute("workExperience", workExperience);
        request.setAttribute("educationExperience", educationExperience);
        request.getRequestDispatcher("Info2.jsp").forward(request, response);
    }
}