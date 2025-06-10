package com.example.pgms.servlet;

import com.example.pgms.daoImpl.BasicInfoDAOImpl;
import com.example.pgms.bean.BasicInfo;
import com.example.pgms.bean.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import org.apache.log4j.Logger;

@WebServlet("/StudentQyery")
public class studentQueryServlet extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(studentQueryServlet.class.getName());

    public studentQueryServlet() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String studentID = request.getParameter("studentID");
        String name = request.getParameter("name");
        User user = (User)session.getAttribute("user");
        BasicInfoDAOImpl BasicInfoDAO = new BasicInfoDAOImpl();
        BasicInfo basicInfo = BasicInfoDAO.getBasicInfo(studentID);
        if (session.getAttribute("role").equals("研究生院管理员") ||session.getAttribute("role").equals("研究生院领导") || session.getAttribute("role").equals("学校领导")||session.getAttribute("role").equals("学院研究生秘书") || session.getAttribute("role").equals("学院领导")) {
            if (name.equals(basicInfo.getName())) {
                session.setAttribute("userid", studentID);
                LOGGER.info("成功查询用户： " + studentID);
                request.getRequestDispatcher("InfoServlet2").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "学号与姓名不匹配，或您无权查看，请重新输入！");
                LOGGER.warn("失败查询用户： " + studentID);
                request.getRequestDispatcher("studentQuery.jsp").forward(request, response);
            }
        }

    }
}
