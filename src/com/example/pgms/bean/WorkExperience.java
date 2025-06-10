package com.example.pgms.bean;

import java.io.Serializable;
import java.util.Date;

public class WorkExperience implements Serializable {
    private int studentID;
    private Date startTime;
    private Date endTime;
    private String workUnit;
    private String workPosition;
    private String workDuty;
    private String provePerson;
    private String notes;

    public WorkExperience() {
    }

    public int getStudentID() {
        return this.studentID;
    }

    public void setStudentID(int studentID) {
        this.studentID = studentID;
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

    public String getWorkUnit() {
        return this.workUnit;
    }

    public void setWorkUnit(String workUnit) {
        this.workUnit = workUnit;
    }

    public String getWorkPosition() {
        return this.workPosition;
    }

    public void setWorkPosition(String workPosition) {
        this.workPosition = workPosition;
    }

    public String getWorkDuty() {
        return this.workDuty;
    }

    public void setWorkDuty(String workDuty) {
        this.workDuty = workDuty;
    }

    public String getProvePerson() {
        return this.provePerson;
    }

    public void setProvePerson(String provePerson) {
        this.provePerson = provePerson;
    }

    public String getNotes() {
        return this.notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }
}

