package com.example.pgms.dao;

import com.example.pgms.bean.Student;
import java.util.List;

// 学生数据访问接口
public interface StudentDAO {
    List<Student> getAllStudents();
    Student getStudentByID(int studentID);
    boolean addStudent(Student student);
    boolean updateStudent(Student student);
}
