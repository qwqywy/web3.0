package com.example.pgms.servlet;

import com.example.pgms.daoImpl.PostGraduateDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import org.apache.log4j.Logger;

@WebServlet({"/ChangePasswordServlet"})
public class ChangePasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(ChangePasswordServlet.class.getName());

    public ChangePasswordServlet() {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userid = (String) session.getAttribute("userid");
        String password = (String) session.getAttribute("password");//来源于用户登录成功后存储在 HttpSession 中的旧密码值（是明码）
        String oldPassword = request.getParameter("currentPassword");//来源于用户在表单输入的当前密码（是明码）
        String newPassword = request.getParameter("newPassword");//来源于用户在表单输入的新密码（是明码）

        if (password.equals(oldPassword)) {
            PostGraduateDAOImpl postGraduateDAO = new PostGraduateDAOImpl();
            if (postGraduateDAO.changePassword(userid, newPassword) && postGraduateDAO.changeLoginStatus(userid, newPassword)) {
                LOGGER.info("用户 " + userid + " 成功修改密码");
                request.getRequestDispatcher("InfoServlet").forward(request, response);
            }
        } else {
            request.setAttribute("message", "与原密码不符，请重新输入！");
            LOGGER.warn("用户 " + userid + " 修改密码失败");
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
        }
    }
}