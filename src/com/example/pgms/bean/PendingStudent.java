package com.example.pgms.bean;

import java.time.LocalDateTime;

public class PendingStudent {
    private Integer studentID;
    private String name;
    private String gender;
    private String college;
    private String major;
    private Integer id; // 待审核记录的唯一ID（自增主键）
    private String operationType; // 操作类型: ADD, UPDATE
    private String status = "PENDING"; // 审核状态: PENDING, APPROVED, REJECTED
    private LocalDateTime submitTime; // 提交时间

    // Getter 和 Setter 方法
    public Integer getStudentID() {
        return studentID;
    }

    public void setStudentID(Integer studentID) {
        this.studentID = studentID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
    public String getCollege() {
        return college;
    }
    public void setCollege(String college) {
        this.college = college;
    }
    public String getMajor() {
        return major;
    }
    public void setMajor(String major) {
        this.major = major;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    public LocalDateTime getSubmitTime() {
        return submitTime;
    }
    public void setSubmitTime(LocalDateTime submitTime) {
        this.submitTime = submitTime;
    }
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public String getOperationType() {
        return operationType;
    }
    public void setOperationType(String operationType) {
        this.operationType = operationType;
    }


    // 重写 toString 方法，方便打印对象信息
    @Override
    public String toString() {
        return "PendingStudent{" +
                "studentID=" + studentID +
                ", name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", college='" + college + '\'' +
                ", major='" + major + '\'' +
                ", status='" + status + '\'' +
                ", submitTime=" + submitTime +
                '}';
    }
}
