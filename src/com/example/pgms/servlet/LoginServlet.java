package com.example.pgms.servlet;

import com.example.pgms.daoImpl.UserDAOImpl;
import com.example.pgms.bean.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import org.apache.log4j.Logger;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final int MAX_LOGIN_ATTEMPTS = 5;
    private static final long LOCKOUT_DURATION = 1800000L;
    private static final long SESSION_TIMEOUT = 1800000L;
    private static final Logger LOGGER = Logger.getLogger(LoginServlet.class.getName());

    public LoginServlet() {
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String userid = request.getParameter("userid");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();
        session.setMaxInactiveInterval(1800); // 30分钟超时

        // 登录失败次数控制
        Integer loginAttempts = (Integer) session.getAttribute("loginAttempts");
        if (loginAttempts == null) loginAttempts = 0;

        Long lastLoginTime = (Long) session.getAttribute("lastLoginTime");
        if (lastLoginTime == null) lastLoginTime = System.currentTimeMillis();
        session.setAttribute("lastLoginTime", lastLoginTime);

        if (loginAttempts >= 5) {
            long currentTime = System.currentTimeMillis();
            long diff = currentTime - lastLoginTime;

            if (diff < 1800000L) { // 30分钟
                long remaining = (1800000L - diff) / 1000;
                session.setAttribute("message", "登录失败次数过多，请 " + remaining + " 秒后重试。");
                response.sendRedirect("login.jsp");
                return;
            } else {
                session.setAttribute("loginAttempts", 0); // 超时后重置
            }
        }

        // 验证用户
        UserDAOImpl userDAO = new UserDAOImpl();
        User user = userDAO.getUser(userid, password);

        if (user != null) {
            String role = user.getRole();
            String isFirstLogin = user.getIsfirstlogin();

            if (role == null || role.trim().isEmpty()) {
                session.setAttribute("message", "用户角色信息异常，请联系管理员。");
                response.sendRedirect("login.jsp");
                return;
            }

            // 设置 session
            session.setAttribute("userid", userid);
            session.setAttribute("password", password);
            session.setAttribute("role", role);
            session.setAttribute("user", user);
            session.setAttribute("loginAttempts", 0);

            // 添加日志 - 记录存储在 session 中的密码哈希值
            LOGGER.info("用户 [" + userid + "] 登录成功，角色为 [" + role + "]\"，存储在 session 的密码值: " + password);

            RequestDispatcher dispatcher;
            switch (role) {
                case "研究生":
                    if ("1".equals(isFirstLogin)) {
                        response.sendRedirect("changePassword.jsp");
                    } else {
                        dispatcher = request.getRequestDispatcher("/InfoServlet");
                        dispatcher.forward(request, response);
                    }
                    break;
                case "研究生院领导":
                case "学校领导":
                    response.sendRedirect(request.getContextPath() +"/schoolleaderView");
                    break;
                case "导师":
                    // 重定向到 Servlet URL 而不是直接到 JSP
                    response.sendRedirect(request.getContextPath() + "/MentorView");
                    break;
                case "学院研究生秘书":
                case "学院领导":
                    response.sendRedirect(request.getContextPath() +"/CollegeleaderView");
                    break;
                case "研究生院管理员":
                    response.sendRedirect(request.getContextPath() +"/ReviewViewServlet");
                    break;
                case "系统管理员":
                    response.sendRedirect("ChangeRole.jsp");
                    break;
                case "审计管理员":
                    response.sendRedirect("log.jsp");
                    break;
                default:
                    session.setAttribute("message", "未知角色，无法跳转页面！");
                    response.sendRedirect("login.jsp");
            }

        } else {
            loginAttempts++;
            session.setAttribute("loginAttempts", loginAttempts);
            session.setAttribute("lastLoginTime", System.currentTimeMillis());
            session.setAttribute("message", "用户名或密码错误，请重新输入！");
            LOGGER.warn("用户 [" + userid + "] 登录失败，第 " + loginAttempts + " 次尝试。");
            response.sendRedirect("login.jsp");
        }
    }
}
