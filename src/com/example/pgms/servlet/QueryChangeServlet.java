package com.example.pgms.servlet;

import com.example.pgms.daoImpl.BasicInfoDAOImpl;
import com.example.pgms.bean.BasicInfo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.util.logging.Logger;

@WebServlet({"/QueryChangeServlet"})
public class QueryChangeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(QueryChangeServlet.class.getName());

    public QueryChangeServlet() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 日志记录请求开始
        LOGGER.info("开始处理查询变更请求");

        String studentID = request.getParameter("studentID");
        String studentName = request.getParameter("name");

        // 日志记录用户输入的参数
        LOGGER.info("接收到的学号: " + studentID + ", 姓名: " + studentName);

        BasicInfoDAOImpl basicInfoDAO = new BasicInfoDAOImpl();
        BasicInfo originalInfo = basicInfoDAO.getBasicInfo(studentID);

        // 日志记录数据库查询结果
        if (originalInfo == null) {
            LOGGER.warning("未找到学号为 " + studentID + " 的学生信息");
            request.setAttribute("errorMessage", "未找到对应的学生信息，请检查学号是否正确！");
            request.getRequestDispatcher("QueryChange.jsp").forward(request, response);
            return;
        }

        if (!studentName.equals(originalInfo.getName())) {
            LOGGER.warning("学号与姓名不匹配，学号: " + studentID + ", 输入姓名: " + studentName + ", 数据库姓名: " + originalInfo.getName());
            request.setAttribute("errorMessage", "学号与姓名不匹配，请重新输入！");
            request.getRequestDispatcher("QueryChange.jsp").forward(request, response);
        } else {
            LOGGER.info("学号和姓名匹配，允许进行信息变更");
            request.setAttribute("originalInfo", originalInfo);
            request.getRequestDispatcher("changeInformation.jsp").forward(request, response);
        }
    }
}