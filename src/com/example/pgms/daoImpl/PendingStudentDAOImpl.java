package com.example.pgms.daoImpl;

import com.example.pgms.bean.PendingStudent;
import com.example.pgms.dao.PendingStudentDAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PendingStudentDAOImpl implements PendingStudentDAO {
    private static final String URL = "jdbc:mysql://127.0.0.1:3306/web?user=root&password=123456&useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    private static final String USER = "root";
    private static final String PASSWORD = "123456";

//    将一个 PendingStudent 对象插入到数据库的 pending_student 表
//    数字代表的是SQL语句中的占位符（通常用?表示）的索引位置
@Override
public boolean addPendingStudent(PendingStudent pendingStudent) {
    System.out.println("【DAO层】准备插入待审核学生:");
    System.out.println("  ID: " + pendingStudent.getStudentID());
    System.out.println("  姓名: " + pendingStudent.getName());
    System.out.println("  性别: " + pendingStudent.getGender());
    System.out.println("  学院: " + pendingStudent.getCollege());
    System.out.println("  专业: " + pendingStudent.getMajor());
    System.out.println("  操作类型: " + pendingStudent.getOperationType());
    System.out.println("  状态: " + pendingStudent.getStatus());
    System.out.println("  提交时间: " + pendingStudent.getSubmitTime());
        String sql = "INSERT INTO pending_student (studentID, name, gender, college, major, operationType, status, submitTime) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, pendingStudent.getStudentID());
            pstmt.setString(2, pendingStudent.getName());
            pstmt.setString(3, pendingStudent.getGender());
            pstmt.setString(4, pendingStudent.getCollege());
            pstmt.setString(5, pendingStudent.getMajor());
            pstmt.setString(6, pendingStudent.getOperationType());
            pstmt.setString(7, pendingStudent.getStatus());
            pstmt.setTimestamp(8, Timestamp.valueOf(pendingStudent.getSubmitTime()));

            int rowsAffected = pstmt.executeUpdate();
            System.out.println("影响行数: " + rowsAffected);  // 关键输出！
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.err.println("【数据库错误】插入失败:");
            e.printStackTrace();
            // 添加更详细的错误信息
            System.err.println("SQL状态码: " + e.getSQLState());
            System.err.println("错误代码: " + e.getErrorCode());
            System.err.println("错误信息: " + e.getMessage());
            return false;
        }
    }

//    更新指定 ID 的待审核学生记录的状态
    @Override
    public boolean updatePendingStudentStatus(int id, String status) {
        String sql = "UPDATE pending_student SET status = ? WHERE id = ?";

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, status);
            pstmt.setInt(2, id);

            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

//    查询所有状态为 PENDING 的待审核学生记录。
    @Override
    public List<PendingStudent> getAllPendingStudents() {
        List<PendingStudent> list = new ArrayList<>();
        String sql = "SELECT * FROM pending_student WHERE status = 'PENDING'";

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                PendingStudent ps = mapResultSetToPendingStudent(rs);
                list.add(ps);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

//    根据 ID 查询单条待审核学生记录
    @Override
    public PendingStudent getPendingStudentById(int id) {
        String sql = "SELECT * FROM pending_student WHERE id = ?";

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToPendingStudent(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private PendingStudent mapResultSetToPendingStudent(ResultSet rs) throws SQLException {
        PendingStudent ps = new PendingStudent();
        ps.setId(rs.getInt("id"));
        ps.setStudentID(rs.getInt("studentID"));
        ps.setName(rs.getString("name"));
        ps.setGender(rs.getString("gender"));
        ps.setCollege(rs.getString("college"));
        ps.setMajor(rs.getString("major"));
        ps.setOperationType(rs.getString("operationType"));
        ps.setStatus(rs.getString("status"));
        ps.setSubmitTime(rs.getTimestamp("submitTime").toLocalDateTime());

        return ps;
    }

    // 在PendingStudentDAOImpl中添加
    public void testConnection() {
        System.out.println("测试数据库连接...");
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD)) {
            System.out.println("连接成功! 数据库版本: " + conn.getMetaData().getDatabaseProductVersion());

            // 检查表是否存在
            DatabaseMetaData meta = conn.getMetaData();
            ResultSet tables = meta.getTables(null, null, "pending_student", null);
            if (tables.next()) {
                System.out.println("找到表: pending_student");
            } else {
                System.err.println("❌ 错误: 未找到pending_student表");
            }
        } catch (SQLException e) {
            System.err.println("连接失败:");
            e.printStackTrace();
        }
    }

}