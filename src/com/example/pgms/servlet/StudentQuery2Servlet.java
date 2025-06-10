package com.example.pgms.servlet;

import com.example.pgms.bean.Student;
import com.example.pgms.dao.StudentDAO;
import com.example.pgms.daoImpl.StudentDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import java.util.logging.Logger;

@WebServlet("/StudentQuery2Servlet")
public class StudentQuery2Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(StudentQuery2Servlet.class.getName()); // 使用当前类的名称

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // 获取学号参数
        String studentID = request.getParameter("studentID");

        // 日志记录请求开始
        LOGGER.info("开始处理学生查询请求，学号: " + studentID);

        if (studentID != null && !studentID.isEmpty()) {
            try {
                int id = Integer.parseInt(studentID);
                StudentDAO studentDAO = new StudentDAOImpl();
                Student student = studentDAO.getStudentByID(id);

                if (student != null) {
                    // 日志记录查询成功
                    LOGGER.info("查询成功，找到学号为 " + studentID + " 的学生");
                    request.setAttribute("student", student);
                    request.getRequestDispatcher("updateInformation.jsp").forward(request, response);
                } else {
                    // 日志记录未找到学生
                    LOGGER.info("未找到学号为 " + studentID + " 的学生");
                    request.setAttribute("error", "找不到学号为 " + studentID + " 的学生");
                    request.getRequestDispatcher("studentNotFound.jsp").forward(request, response);
                }
            } catch (NumberFormatException e) {
                // 日志记录学号格式错误
                LOGGER.warning("学号格式不正确，学号: " + studentID);
                request.setAttribute("error", "学号格式不正确");
                request.getRequestDispatcher("studentNotFound.jsp").forward(request, response);
            }
        } else {
            // 日志记录未输入学号
            LOGGER.warning("未输入学号");
            request.setAttribute("error", "请输入学号");
            request.getRequestDispatcher("studentNotFound.jsp").forward(request, response);
        }
    }
}