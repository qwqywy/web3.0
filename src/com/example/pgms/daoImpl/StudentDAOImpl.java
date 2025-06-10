package com.example.pgms.daoImpl;

import com.example.pgms.bean.Student;
import com.example.pgms.dao.StudentDAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

// 学生数据访问实现
public class StudentDAOImpl implements StudentDAO {
    String connectionUrl = "jdbc:mysql://127.0.0.1:3306/web?user=root&password=123456&useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";

    private static final String URL = "jdbc:mysql://127.0.0.1:3306/web?user=root&password=123456&useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    private static final String USER = "root";
    private static final String PASSWORD = "123456";
    public StudentDAOImpl() {
    }

    @Override
    public List<Student> getAllStudents() {
        System.out.println("开始查询数据库...");
        List<Student> students = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(this.connectionUrl);
            String sql = "SELECT studentID, name, gender, college, major FROM web.basicinfo";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            int count = 0;
            while (rs.next()) {
                Student student = new Student();
                student.setStudentID(rs.getInt("studentID"));
                student.setName(rs.getString("name"));
                student.setGender(rs.getString("gender"));
                student.setCollege(rs.getString("college"));
                student.setMajor(rs.getString("major"));

                count++;
                System.out.println("读取学生 #" + count + ": " + rs.getString("Name"));
                students.add(student);
            }
            System.out.println("共查询到 " + count + " 条记录");
        } catch (Exception e) {
            System.err.println("DAO 错误: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return students;
    }

    @Override
    public Student getStudentByID(int studentID) {
        String sql = "SELECT * FROM basicinfo WHERE studentID = ?";
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, studentID);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToStudent(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean addStudent(Student student) {
        String sql = "INSERT INTO basicinfo (studentID, name, gender, college, major) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, student.getStudentID());
            pstmt.setString(2, student.getName());
            pstmt.setString(3, student.getGender());
            pstmt.setString(4, student.getCollege());
            pstmt.setString(5, student.getMajor());
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean updateStudent(Student student) {
        String sql = "UPDATE basicinfo SET name=?, gender=?, college=?, major=? WHERE studentID=?";
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, student.getName());
            pstmt.setString(2, student.getGender());
            pstmt.setString(3, student.getCollege());
            pstmt.setString(4, student.getMajor());
            pstmt.setInt(5, student.getStudentID());
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private Student mapResultSetToStudent(ResultSet rs) throws SQLException {
        Student student = new Student();
        student.setStudentID(rs.getInt("studentID"));
        student.setName(rs.getString("name"));
        student.setGender(rs.getString("gender"));
        student.setCollege(rs.getString("college"));
        student.setMajor(rs.getString("major"));
        return student;
    }
}