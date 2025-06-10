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
import java.util.logging.Logger;

@WebServlet("/ReviewServlet")
public class ReviewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(ReviewServlet.class.getName()); // 使用当前类的名称

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 日志记录请求开始
        LOGGER.info("开始处理审核请求");

        // 从请求中获取待审核记录的ID和操作类型（批准或拒绝）
        int pendingId = Integer.parseInt(request.getParameter("id"));
        String action = request.getParameter("action"); // APPROVE 或 REJECT

        // 日志记录请求参数
        LOGGER.info("接收到的审核请求：待审核记录ID=" + pendingId + ", 操作类型=" + action);

        // 创建DAO对象用于数据库操作
        PendingStudentDAO pendingStudentDAO = new PendingStudentDAOImpl();
        StudentDAO studentDAO = new StudentDAOImpl();

        // 获取待审核记录
        PendingStudent pendingStudent = pendingStudentDAO.getPendingStudentById(pendingId);

        if (pendingStudent != null) {
            LOGGER.info("找到待审核记录：ID=" + pendingId);

            // 如果操作是批准
            if ("APPROVE".equals(action)) {
                LOGGER.info("执行批准操作");

                // 根据操作类型（添加或更新）执行相应逻辑
                if ("ADD".equals(pendingStudent.getOperationType())) {
                    LOGGER.info("执行添加操作");

                    // 创建一个新的学生对象并设置属性
                    Student newStudent = new Student();
                    newStudent.setStudentID(pendingStudent.getStudentID());
                    newStudent.setName(pendingStudent.getName());
                    newStudent.setGender(pendingStudent.getGender());
                    newStudent.setCollege(pendingStudent.getCollege());
                    newStudent.setMajor(pendingStudent.getMajor());

                    // 将新学生添加到数据库
                    if (studentDAO.addStudent(newStudent)) {
                        LOGGER.info("新学生添加成功，学生ID=" + newStudent.getStudentID());
                        // 更新待审核记录状态为“已批准”
                        pendingStudentDAO.updatePendingStudentStatus(pendingId, "APPROVED");
                        LOGGER.info("待审核记录状态更新为已批准，记录ID=" + pendingId);
                    } else {
                        LOGGER.severe("新学生添加失败，学生ID=" + newStudent.getStudentID());
                    }
                }
                // 如果是修改操作
                else if ("UPDATE".equals(pendingStudent.getOperationType())) {
                    LOGGER.info("执行更新操作");

                    // 获取现有学生记录
                    Student existingStudent = studentDAO.getStudentByID(pendingStudent.getStudentID());
                    if (existingStudent != null) {
                        LOGGER.info("找到现有学生记录，学生ID=" + existingStudent.getStudentID());

                        // 更新学生信息
                        existingStudent.setName(pendingStudent.getName());
                        existingStudent.setGender(pendingStudent.getGender());
                        existingStudent.setCollege(pendingStudent.getCollege());
                        existingStudent.setMajor(pendingStudent.getMajor());

                        // 将更新后的学生信息保存到数据库
                        if (studentDAO.updateStudent(existingStudent)) {
                            LOGGER.info("学生信息更新成功，学生ID=" + existingStudent.getStudentID());
                            // 更新待审核记录状态为“已批准”
                            pendingStudentDAO.updatePendingStudentStatus(pendingId, "APPROVED");
                            LOGGER.info("待审核记录状态更新为已批准，记录ID=" + pendingId);
                        } else {
                            LOGGER.severe("学生信息更新失败，学生ID=" + existingStudent.getStudentID());
                        }
                    } else {
                        LOGGER.warning("未找到现有学生记录，学生ID=" + pendingStudent.getStudentID());
                    }
                }
            }
            // 如果操作是拒绝
            else if ("REJECT".equals(action)) {
                LOGGER.info("执行拒绝操作");

                // 直接更新待审核记录状态为“已拒绝”
                pendingStudentDAO.updatePendingStudentStatus(pendingId, "REJECTED");
                LOGGER.info("待审核记录状态更新为已拒绝，记录ID=" + pendingId);
            }
        } else {
            LOGGER.warning("未找到待审核记录，记录ID=" + pendingId);
        }

        // 重定向到待审核列表页面
        LOGGER.info("重定向到待审核列表页面");
        response.sendRedirect("PendingListServlet");
    }
}