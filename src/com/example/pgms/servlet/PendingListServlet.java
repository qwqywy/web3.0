package com.example.pgms.servlet;

import com.example.pgms.bean.PendingStudent;
import com.example.pgms.dao.PendingStudentDAO;
import com.example.pgms.daoImpl.PendingStudentDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

//从数据库中获取所有待审核的学生记录，并将这些记录传递给JSP页面进行显示
@WebServlet("/PendingListServlet")
public class PendingListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 创建DAO对象用于数据库操作
        PendingStudentDAO pendingStudentDAO = new PendingStudentDAOImpl();

        // 从数据库中获取所有待审核的学生记录
        List<PendingStudent> pendingStudents = pendingStudentDAO.getAllPendingStudents();

        // 将待审核记录设置为请求属性
        request.setAttribute("pendingStudents", pendingStudents);

        // 转发请求到JSP页面进行显示
        request.getRequestDispatcher("review.jsp").forward(request, response);
    }
}