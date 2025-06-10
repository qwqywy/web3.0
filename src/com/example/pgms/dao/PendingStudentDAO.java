package com.example.pgms.dao;

import com.example.pgms.bean.PendingStudent;
import java.util.List;

public interface PendingStudentDAO {
    boolean addPendingStudent(PendingStudent pendingStudent);
    boolean updatePendingStudentStatus(int id, String status);
    List<PendingStudent> getAllPendingStudents();
    PendingStudent getPendingStudentById(int id);
}
