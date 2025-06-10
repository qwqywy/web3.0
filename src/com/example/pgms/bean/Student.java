package com.example.pgms.bean;

// 学生基础信息实体类
public class Student {
    private int studentID;
    private String name;
    private String gender;
    private String college;    // 学院
    private String major;      // 专业

    // 构造方法、getter和setter
    public Student(){
    }

    public Student(int studentID, String name, String gender, String college, String major) {
        this.studentID = studentID;
        this.name = name;
        this.gender = gender;
        this.college = college;
        this.major = major;
    }

    public int getStudentID() {
        return this.studentID;
    }

    public String getName() {
        return this.name;
    }

    public String getGender() {
        return this.gender;
    }

    public String getCollege() { return this.college; }

    public String getMajor() { return this.major; }

    public void setStudentID(int studentID) {
        this.studentID = studentID;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setCollege(String college) { this.college = college; }

    public void setMajor(String major) { this.major = major; }

}
