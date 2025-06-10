package com.example.pgms.servlet;

import com.example.pgms.daoImpl.UserDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;

import java.io.IOException;

@WebServlet({"/ChangeRoleServlet"})
public class ChangeRoleServlet extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(ChangeInfoServlet.class.getName());
    public ChangeRoleServlet() {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userid = request.getParameter("userid");
        String role = request.getParameter("newRole");
        UserDAOImpl userDAO = new UserDAOImpl();
        boolean success = userDAO.changeRole(userid, role);
        request.setAttribute("changeRoleSuccess", success);
        response.sendRedirect("success.jsp");
        LOGGER.info("用户 " + userid + " 成功修改角色为："+ role);
    }
}

