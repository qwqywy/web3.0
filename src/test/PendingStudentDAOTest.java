package test;

import com.example.pgms.bean.PendingStudent;
import com.example.pgms.dao.PendingStudentDAO;
import com.example.pgms.daoImpl.PendingStudentDAOImpl;

import java.time.LocalDateTime;

public class PendingStudentDAOTest {
    public static void main(String[] args) {
        PendingStudentDAO dao = new PendingStudentDAOImpl();

        // 创建测试对象
        PendingStudent testStudent = new PendingStudent();
        testStudent.setStudentID(999999); // 用不存在的ID
        testStudent.setName("测试学生");
        testStudent.setGender("男");
        testStudent.setCollege("测试学院");
        testStudent.setMajor("测试专业");
        testStudent.setOperationType("ADD");
        testStudent.setStatus("PENDING");
        testStudent.setSubmitTime(LocalDateTime.now());

        System.out.println("开始手动测试插入...");
        boolean success = dao.addPendingStudent(testStudent);
        System.out.println("插入结果: " + (success ? "成功" : "失败"));

        if(!success) {
            System.out.println("⚠️ 手动测试失败，问题在DAO层");
        } else {
            System.out.println("✅ 手动测试成功，问题在Servlet或前端");
        }
    }
}
