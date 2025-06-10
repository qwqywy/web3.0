package com.example.pgms.bean;

import java.io.Serializable;
import java.util.Date;

public class EducationExperience implements Serializable {
    private int studentID;
    private String schoolName;
    private Date startTime;
    private Date endTime;
    private String major;
    private String majorDescription;
    private String degree;
    private String degreeType;
    private String graduatePosition;
    private String restTime;
    private String isGraduate;

    public EducationExperience() {
    }

    public int getStudentID() {
        return this.studentID;
    }

    public void setStudentID(int studentID) {
        this.studentID = studentID;
    }

    public String getSchoolName() {
        return this.schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    public Date getStartTime() {
        return this.startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return this.endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public String getMajor() {
        return this.major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getMajorDescription() {
        return this.majorDescription;
    }

    public void setMajorDescription(String majorDescription) {
        this.majorDescription = majorDescription;
    }

    public String getDegree() {
        return this.degree;
    }

    public void setDegree(String degree) {
        this.degree = degree;
    }

    public String getDegreeType() {
        return this.degreeType;
    }

    public void setDegreeType(String degreeType) {
        this.degreeType = degreeType;
    }

    public String getGraduatePosition() {
        return this.graduatePosition;
    }

    public void setGraduatePosition(String graduatePosition) {
        this.graduatePosition = graduatePosition;
    }

    public String getRestTime() {
        return this.restTime;
    }

    public void setRestTime(String restTime) {
        this.restTime = restTime;
    }

    public String getIsGraduate() {
        return this.isGraduate;
    }

    public void setIsGraduate(String isGraduate) {
        this.isGraduate = isGraduate;
    }
}

