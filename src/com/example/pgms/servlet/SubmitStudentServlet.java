package com.example.pgms.servlet;

import com.example.pgms.bean.PendingStudent;
import com.example.pgms.bean.Student;
import com.example.pgms.dao.PendingStudentDAO;
import com.example.pgms.dao.StudentDAO;
import com.example.pgms.daoImpl.PendingStudentDAOImpl;
import com.example.pgms.daoImpl.StudentDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDateTime;

import java.util.logging.Logger;

@WebServlet("/SubmitStudentServlet")
public class SubmitStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(SubmitStudentServlet.class.getName()); // 使用当前类的名称

    @Override
    public void init() throws ServletException {
        LOGGER.info("初始化Servlet，测试数据库连接");
        new PendingStudentDAOImpl().testConnection();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // 获取操作类型 (ADD 或 UPDATE)
        String operationType = request.getParameter("operationType");

        // 在doPost方法开头添加
        LOGGER.info("==== 开始处理请求 ====");
        LOGGER.info("操作类型: " + operationType);

        // 创建PendingStudent对象
        PendingStudent pendingStudent = new PendingStudent();
        pendingStudent.setOperationType(operationType);
        pendingStudent.setSubmitTime(LocalDateTime.now());
        pendingStudent.setStatus("PENDING");

        if ("UPDATE".equals(operationType)) {
            LOGGER.info("执行更新操作");

            // 获取学生ID
            int studentID = Integer.parseInt(request.getParameter("studentID"));
            pendingStudent.setStudentID(studentID);

            // 获取当前学生信息
            StudentDAO studentDAO = new StudentDAOImpl();
            Student currentStudent = studentDAO.getStudentByID(studentID);

            if (currentStudent == null) {
                LOGGER.warning("未找到学生信息，学生ID: " + studentID);
                request.setAttribute("error", "找不到该学生信息");
                request.getRequestDispatcher("studentNotFound.jsp").forward(request, response);
                return;
            }

            // 设置字段值：用户输入了新值则使用新值，否则保留原值
            pendingStudent.setStudentID(currentStudent.getStudentID());

            // 姓名
            String newName = request.getParameter("newName");
            pendingStudent.setName(newName != null && !newName.isEmpty() ? newName : currentStudent.getName());

            // 性别
            String newGender = request.getParameter("newGender");
            pendingStudent.setGender(newGender != null && !newGender.isEmpty() ? newGender : currentStudent.getGender());

            // 学院
            String newCollege = request.getParameter("newCollege");
            pendingStudent.setCollege(newCollege != null && !newCollege.isEmpty() ? newCollege : currentStudent.getCollege());

            // 专业
            String newMajor = request.getParameter("newMajor");
            pendingStudent.setMajor(newMajor != null && !newMajor.isEmpty() ? newMajor : currentStudent.getMajor());
        } else if ("ADD".equals(operationType)) {
            LOGGER.info("执行新增操作");

            // 获取所有参数并打印
            String studentIDParam = request.getParameter("studentID");
            String nameParam = request.getParameter("name");
            String genderParam = request.getParameter("gender");
            String collegeParam = request.getParameter("college");
            String majorParam = request.getParameter("major");

            LOGGER.info("前端参数: ");
            LOGGER.info("  studentID=" + studentIDParam);
            LOGGER.info("  name=" + nameParam);
            LOGGER.info("  gender=" + genderParam);
            LOGGER.info("  college=" + collegeParam);
            LOGGER.info("  major=" + majorParam);

            // 填充学生基本信息
            pendingStudent.setStudentID(Integer.parseInt(studentIDParam));
            pendingStudent.setName(nameParam);
            pendingStudent.setGender(genderParam);
            pendingStudent.setCollege(collegeParam);
            pendingStudent.setMajor(majorParam);
        }

        // 保存到待审核表
        PendingStudentDAO pendingStudentDAO = new PendingStudentDAOImpl();
        boolean success = pendingStudentDAO.addPendingStudent(pendingStudent);

        if (success) {
            LOGGER.info("添加/修改申请已提交，等待审核");
            request.setAttribute("message", "添加/修改申请已提交，等待审核");
            request.setAttribute("studentID", pendingStudent.getStudentID());
            request.getRequestDispatcher("success2.jsp").forward(request, response);
        } else {
            LOGGER.warning("提交失败，请重试");
            request.setAttribute("error", "提交失败，请重试");
            request.setAttribute("studentID", pendingStudent.getStudentID());
            request.getRequestDispatcher("/web1_0_war_exploded/CollegeleaderView").forward(request, response);
        }
    }
}
