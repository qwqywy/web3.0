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
import java.util.List;


@WebServlet("/MentorView")
public class MentorViewServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 在 Servlet 的 doGet 方法开头添加日志
        System.out.println("Servlet 被调用！请求路径: " + request.getRequestURI());
        // 获取所有学生数据
        StudentDAO studentDao = new StudentDAOImpl();
        List<Student> students = studentDao.getAllStudents();
        System.out.println("Servlet 获取学生数: " + students.size());

        // 检查第一个学生数据
        if(!students.isEmpty()) {
            Student first = students.get(0);
            System.out.println("示例学生数据: " +
                    first.getName() + " | " +
                    first.getGender());
        }
        // 将数据放入请求属性
        request.setAttribute("students", students);

        // 转发到JSP页面
        request.getRequestDispatcher("/mentorView.jsp").forward(request, response);
    }
}
