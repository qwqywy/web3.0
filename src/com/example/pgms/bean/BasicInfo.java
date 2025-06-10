package com.example.pgms.bean;

import java.io.Serializable;
import java.util.Date;

public class BasicInfo implements Serializable {
    private int studentID;
    private String name;
    private String namePY;
    private String gender;
    private String nation;
    private Date birthDate;
    private String nativePlace;
    private String politicalStatus;
    private String IDType;
    private String IDNumber;
    private String country;
    private String maritalStatus;
    private String birthPlace;
    private String originPlace;
    private String familyAddress;
    private String huKouPlace;
    private String huKouDetailedPlace;
    private String huKouPostalCode;
    private String railwayStationStart;
    private String railwayStationEnd;
    private String phoneNumber;
    private String campusEmail;
    private String personalEmail;
    private Date joinPartyDate;
    private String studentLabel;
    private String departmentID;
    private String award;
    private String grade;
    private String entranceSeason;
    private String cultivationLevel;
    private String studentCategory;
    private String college;
    private String managementDepartment;
    private String major;
    private String lengthOfSchooling;
    private String entranceMethod;
    private String campusZone;
    private Date entranceDate;
    private String studentClass;
    private String enrollmentMajor;
    private String degreeCategory;
    private String degreeType;
    private String majorWay;
    private String cultureMethod;
    private String studyMethod;
    private String jinXiuCategory;
    private String specialPlan;
    private Date expectedGraduationTime;
    private String jointTrainingUnit;
    private String interdisciplinary;
    private String overseas;
    private Date actualGraduationTime;
    private String studentStatus;
    private String studentStatusChangeStatus;
    private String mentor;
    private String mentor2;
    private String jointTrainingMentors;
    private String onCampus;
    private String researchDirection;
    private String registrationStatus;
    private String paymentStatus;
    private String degrees;
    private String receiveAcademicEducation;
    private String degreeStatus;
    private String professionalDegreeCategory;
    private String interdisciplinaryTraining;
    private String interdisciplinaryTrainingDiscipline;
    private Date dateOfDegreeAward;

    public BasicInfo() {
    }

    public BasicInfo(int studentID, String name, String gender, String nation, Date birthDate, String nativePlace, String politicalStatus, String IDNumber, String IDType, String maritalStatus, String birthPlace, String familyAddress, String phoneNumber, String campusEmail, Date joinPartyDate) {
        this.studentID = studentID;
        this.name = name;
        this.gender = gender;
        this.nation = nation;
        this.birthDate = birthDate;
        this.nativePlace = nativePlace;
        this.politicalStatus = politicalStatus;
        this.IDNumber = IDNumber;
        this.IDType = IDType;
        this.maritalStatus = maritalStatus;
        this.birthPlace = birthPlace;
        this.familyAddress = familyAddress;
        this.phoneNumber = phoneNumber;
        this.campusEmail = campusEmail;
        this.joinPartyDate = joinPartyDate;
    }

    public int getStudentID() {
        return this.studentID;
    }

    public String getName() {
        return this.name;
    }

    public String getNamePY() {
        return this.namePY;
    }

    public String getGender() {
        return this.gender;
    }

    public String getNation() {
        return this.nation;
    }

    public Date getBirthDate() {
        return this.birthDate;
    }

    public String getNativePlace() {
        return this.nativePlace;
    }

    public String getPoliticalStatus() {
        return this.politicalStatus;
    }

    public String getIDType() {
        return this.IDType;
    }

    // 脱敏后的身份证号
    public String getIDNumber() {
        if (IDNumber == null || IDNumber.length() <= 4) {
            return IDNumber;
        }
        return IDNumber.substring(0, 4) + "********" + IDNumber.substring(IDNumber.length() - 4);
    }

    public String getCountry() {
        return this.country;
    }

    public String getMaritalStatus() {
        return this.maritalStatus;
    }

    public String getBirthPlace() {
        return this.birthPlace;
    }

    public String getOriginPlace() {
        return this.originPlace;
    }

    // 脱敏后的家庭地址
    public String getFamilyAddress() {
        if (familyAddress == null || familyAddress.length() <= 4) {
            return familyAddress;
        }
        return familyAddress.substring(0, 4) + "****";
    }

    public String getHuKouPlace() {
        return this.huKouPlace;
    }

    public String getHuKouDetailedPlace() {
        return this.huKouDetailedPlace;
    }

    public String getHuKouPostalCode() {
        return this.huKouPostalCode;
    }

    public String getRailwayStationStart() {
        return this.railwayStationStart;
    }

    public String getRailwayStationEnd() {
        return this.railwayStationEnd;
    }

    public String getPhoneNumber() {
        if (phoneNumber == null || phoneNumber.length() <= 7) {
            return phoneNumber;
        }
        return phoneNumber.substring(0, 3) + "****" + phoneNumber.substring(phoneNumber.length() - 4);
    }

    // 脱敏后的校园邮箱
    public String getCampusEmail() {
        if (campusEmail == null) {
            return null;
        }
        int atIndex = campusEmail.indexOf('@');
        if (atIndex <= 1) {
            return campusEmail;
        }
        return campusEmail.charAt(0) + "****" + campusEmail.substring(atIndex);
    }

    // 脱敏后的个人邮箱
    public String getPersonalEmail() {
        if (personalEmail == null) {
            return null;
        }
        int atIndex = personalEmail.indexOf('@');
        if (atIndex <= 1) {
            return personalEmail;
        }
        return personalEmail.charAt(0) + "****" + personalEmail.substring(atIndex);
    }

    public Date getJoinPartyDate() {
        return this.joinPartyDate;
    }

    public String getStudentLabel() {
        return this.studentLabel;
    }

    public String getDepartmentID() {
        return this.departmentID;
    }

    public String getAward() {
        return this.award;
    }

    public String getGrade() {
        return this.grade;
    }

    public String getEntranceSeason() {
        return this.entranceSeason;
    }

    public String getCultivationLevel() {
        return this.cultivationLevel;
    }

    public String getStudentCategory() {
        return this.studentCategory;
    }

    public String getCollege() {
        return this.college;
    }

    public String getManagementDepartment() {
        return this.managementDepartment;
    }

    public String getMajor() {
        return this.major;
    }

    public String getLengthOfSchooling() {
        return this.lengthOfSchooling;
    }

    public String getEntranceMethod() {
        return this.entranceMethod;
    }

    public String getCampusZone() {
        return this.campusZone;
    }

    public Date getEntranceDate() {
        return this.entranceDate;
    }

    public String getStudentClass() {
        return this.studentClass;
    }

    public String getEnrollmentMajor() {
        return this.enrollmentMajor;
    }

    public String getDegreeCategory() {
        return this.degreeCategory;
    }

    public String getDegreeType() {
        return this.degreeType;
    }

    public String getMajorWay() {
        return this.majorWay;
    }

    public String getCultureMethod() {
        return this.cultureMethod;
    }

    public String getStudyMethod() {
        return this.studyMethod;
    }

    public String getJinXiuCategory() {
        return this.jinXiuCategory;
    }

    public String getSpecialPlan() {
        return this.specialPlan;
    }

    public Date getExpectedGraduationTime() {
        return this.expectedGraduationTime;
    }

    public String getJointTrainingUnit() {
        return this.jointTrainingUnit;
    }

    public String getInterdisciplinary() {
        return this.interdisciplinary;
    }

    public String getOverseas() {
        return this.overseas;
    }

    public Date getActualGraduationTime() {
        return this.actualGraduationTime;
    }

    public String getStudentStatus() {
        return this.studentStatus;
    }

    public String getStudentStatusChangeStatus() {
        return this.studentStatusChangeStatus;
    }

    public String getMentor() {
        return this.mentor;
    }

    public String getMentor2() {
        return this.mentor2;
    }

    public String getJointTrainingMentors() {
        return this.jointTrainingMentors;
    }

    public String getOnCampus() {
        return this.onCampus;
    }

    public String getResearchDirection() {
        return this.researchDirection;
    }

    public String getRegistrationStatus() {
        return this.registrationStatus;
    }

    public String getPaymentStatus() {
        return this.paymentStatus;
    }

    public String getDegrees() {
        return this.degrees;
    }

    public String getReceiveAcademicEducation() {
        return this.receiveAcademicEducation;
    }

    public String getDegreeStatus() {
        return this.degreeStatus;
    }

    public String getProfessionalDegreeCategory() {
        return this.professionalDegreeCategory;
    }

    public String getInterdisciplinaryTraining() {
        return this.interdisciplinaryTraining;
    }

    public String getInterdisciplinaryTrainingDiscipline() {
        return this.interdisciplinaryTrainingDiscipline;
    }

    public Date getDateOfDegreeAward() {
        return this.dateOfDegreeAward;
    }

    public void setStudentID(int studentID) {
        this.studentID = studentID;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setNamePY(String namePY) {
        this.namePY = namePY;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public void setNativePlace(String nativePlace) {
        this.nativePlace = nativePlace;
    }

    public void setPoliticalStatus(String politicalStatus) {
        this.politicalStatus = politicalStatus;
    }

    public void setIDType(String IDType) {
        this.IDType = IDType;
    }

    public void setIDNumber(String IDNumber) {
        this.IDNumber = IDNumber;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public void setMaritalStatus(String maritalStatus) {
        this.maritalStatus = maritalStatus;
    }

    public void setBirthPlace(String birthPlace) {
        this.birthPlace = birthPlace;
    }

    public void setOriginPlace(String originPlace) {
        this.originPlace = originPlace;
    }

    public void setFamilyAddress(String familyAddress) {
        this.familyAddress = familyAddress;
    }

    public void setHuKouPlace(String huKouPlace) {
        this.huKouPlace = huKouPlace;
    }

    public void setHuKouDetailedPlace(String huKouDetailedPlace) {
        this.huKouDetailedPlace = huKouDetailedPlace;
    }

    public void setHuKouPostalCode(String huKouPostalCode) {
        this.huKouPostalCode = huKouPostalCode;
    }

    public void setRailwayStationStart(String railwayStationStart) {
        this.railwayStationStart = railwayStationStart;
    }

    public void setRailwayStationEnd(String railwayStationEnd) {
        this.railwayStationEnd = railwayStationEnd;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void setCampusEmail(String campusEmail) {
        this.campusEmail = campusEmail;
    }

    public void setPersonalEmail(String personalEmail) {
        this.personalEmail = personalEmail;
    }

    public void setJoinPartyDate(Date joinPartyDate) {
        this.joinPartyDate = joinPartyDate;
    }

    public void setStudentLabel(String studentLabel) {
        this.studentLabel = studentLabel;
    }

    public void setDepartmentID(String departmentID) {
        this.departmentID = departmentID;
    }

    public void setAward(String award) {
        this.award = award;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public void setEntranceSeason(String entranceSeason) {
        this.entranceSeason = entranceSeason;
    }

    public void setCultivationLevel(String cultivationLevel) {
        this.cultivationLevel = cultivationLevel;
    }

    public void setStudentCategory(String studentCategory) {
        this.studentCategory = studentCategory;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    public void setManagementDepartment(String managementDepartment) {
        this.managementDepartment = managementDepartment;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public void setLengthOfSchooling(String lengthOfSchooling) {
        this.lengthOfSchooling = lengthOfSchooling;
    }

    public void setEntranceMethod(String entranceMethod) {
        this.entranceMethod = entranceMethod;
    }

    public void setCampusZone(String campusZone) {
        this.campusZone = campusZone;
    }

    public void setEntranceDate(Date entranceDate) {
        this.entranceDate = entranceDate;
    }

    public void setStudentClass(String studentClass) {
        this.studentClass = studentClass;
    }

    public void setEnrollmentMajor(String enrollmentMajor) {
        this.enrollmentMajor = enrollmentMajor;
    }

    public void setDegreeCategory(String degreeCategory) {
        this.degreeCategory = degreeCategory;
    }

    public void setDegreeType(String degreeType) {
        this.degreeType = degreeType;
    }

    public void setMajorWay(String majorWay) {
        this.majorWay = majorWay;
    }

    public void setCultureMethod(String cultureMethod) {
        this.cultureMethod = cultureMethod;
    }

    public void setStudyMethod(String studyMethod) {
        this.studyMethod = studyMethod;
    }

    public void setJinXiuCategory(String jinXiuCategory) {
        this.jinXiuCategory = jinXiuCategory;
    }

    public void setSpecialPlan(String specialPlan) {
        this.specialPlan = specialPlan;
    }

    public void setExpectedGraduationTime(Date expectedGraduationTime) {
        this.expectedGraduationTime = expectedGraduationTime;
    }

    public void setJointTrainingUnit(String jointTrainingUnit) {
        this.jointTrainingUnit = jointTrainingUnit;
    }

    public void setInterdisciplinary(String interdisciplinary) {
        this.interdisciplinary = interdisciplinary;
    }

    public void setOverseas(String overseas) {
        this.overseas = overseas;
    }

    public void setActualGraduationTime(Date actualGraduationTime) {
        this.actualGraduationTime = actualGraduationTime;
    }

    public void setStudentStatus(String studentStatus) {
        this.studentStatus = studentStatus;
    }

    public void setStudentStatusChangeStatus(String studentStatusChangeStatus) {
        this.studentStatusChangeStatus = studentStatusChangeStatus;
    }

    public void setMentor(String mentor) {
        this.mentor = mentor;
    }

    public void setMentor2(String mentor2) {
        this.mentor2 = mentor2;
    }

    public void setJointTrainingMentors(String jointTrainingMentors) {
        this.jointTrainingMentors = jointTrainingMentors;
    }

    public void setOnCampus(String onCampus) {
        this.onCampus = onCampus;
    }

    public void setResearchDirection(String researchDirection) {
        this.researchDirection = researchDirection;
    }

    public void setRegistrationStatus(String registrationStatus) {
        this.registrationStatus = registrationStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public void setDegrees(String degrees) {
        this.degrees = degrees;
    }

    public void setReceiveAcademicEducation(String receiveAcademicEducation) {
        this.receiveAcademicEducation = receiveAcademicEducation;
    }

    public void setDegreeStatus(String degreeStatus) {
        this.degreeStatus = degreeStatus;
    }

    public void setProfessionalDegreeCategory(String professionalDegreeCategory) {
        this.professionalDegreeCategory = professionalDegreeCategory;
    }

    public void setInterdisciplinaryTraining(String interdisciplinaryTraining) {
        this.interdisciplinaryTraining = interdisciplinaryTraining;
    }

    public void setInterdisciplinaryTrainingDiscipline(String interdisciplinaryTrainingDiscipline) {
        this.interdisciplinaryTrainingDiscipline = interdisciplinaryTrainingDiscipline;
    }

    public void setDateOfDegreeAward(Date dateOfDegreeAward) {
        this.dateOfDegreeAward = dateOfDegreeAward;
    }
}

