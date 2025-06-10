CREATE TABLE BasicInfo (
                           StudentID                             INT PRIMARY KEY,
                           Name                                  VARCHAR(50) NOT NULL,
                           Name_PY                               VARCHAR(50),
                           Gender                                VARCHAR(10),
                           nation                                VARCHAR(20),
                           BirthDate                             DATE,
                           native_place                          VARCHAR(50),
                           political_status                      VARCHAR(20),
                           ID_type                               VARCHAR(20),
                           ID_number                             VARCHAR(20),
                           country                               VARCHAR(20),
                           marital_status                        VARCHAR(20),
                           BirthPlace                            VARCHAR(50),
                           origin_place                          VARCHAR(50),
                           family_address                        VARCHAR(50),
                           HuKou_place                           VARCHAR(50),
                           HuKou_detailed_place                  VARCHAR(50),
                           HuKou_postal_code                     VARCHAR(50),
                           Railway_Station_start                 VARCHAR(50),
                           Railway_Station_end                   VARCHAR(50),
                           phone_number                          VARCHAR(50),
                           campus_email                          VARCHAR(50),
                           personal_email                        VARCHAR(50),
                           Join_party_date                       DATE,
                           student_label                         VARCHAR(50),
                           department_ID                         VARCHAR(50),
                           award                                 VARCHAR(50),
                           grade                                 VARCHAR(50),
                           entrance_season                       VARCHAR(50),
                           Cultivation_level                     VARCHAR(50),
                           Student_category                      VARCHAR(50),
                           college                               VARCHAR(50),
                           management_department                 VARCHAR(50),
                           major                                 VARCHAR(50),
                           length_of_schooling                   VARCHAR(50),
                           entrance_method                       VARCHAR(50),
                           campus_zone                           VARCHAR(50),
                           entrance_date                         DATE,
                           class                                 VARCHAR(50),
                           Enrollment_major                      VARCHAR(50),
                           Degree_Category                       VARCHAR(50),
                           Degree_type                           VARCHAR(50),
                           major_way                             VARCHAR(50),
                           culture_method                        VARCHAR(50),
                           study_method                          VARCHAR(50),
                           JinXiu_category                       VARCHAR(50),
                           special_plan                          VARCHAR(50),
                           Expected_graduation_time              DATE,
                           Joint_Training_Unit                   VARCHAR(50),
                           interdisciplinary                     VARCHAR(50),
                           overseas                              VARCHAR(50),
                           Actual_graduation_time                DATE,
                           Student_status                        VARCHAR(50),
                           Student_status_change_status          VARCHAR(50),
                           mentor                                VARCHAR(50),
                           mentor2                               VARCHAR(50),
                           Joint_training_mentors                VARCHAR(50),
                           On_campus                             VARCHAR(50),
                           Research_Direction                    VARCHAR(50),
                           Registration_Status                   VARCHAR(50),
                           Payment_status                        VARCHAR(50),
                           degrees                               VARCHAR(50),
                           receive_academic_education            VARCHAR(50),
                           degree_status                         VARCHAR(50),
                           professional_degree_category          VARCHAR(50),
                           Interdisciplinary_training            VARCHAR(50),
                           Interdisciplinary_training_discipline VARCHAR(50),
                           Date_of_degree_award                  DATE
);

CREATE TABLE AdmissionInfo (
                               StudentID                    INT PRIMARY KEY,
                               EnrollmentYear               INT,
                               CandidateID                  INT,
                               ApplicationCategory          VARCHAR(20),
                               CandidateSource              VARCHAR(20),
                               AdmissionCategory            VARCHAR(20),
                               ExaminationMethods           VARCHAR(20),
                               ReturnStatus                 VARCHAR(20),
                               RetentionQualificationYears  INT,
                               targetedTrainingUnits        VARCHAR(20),
                               targetedTrainingUnitsPlace   VARCHAR(20),
                               RecommendedUnit              VARCHAR(20),
                               FinalGraduationSchool        VARCHAR(20),
                               FinalGraduationSchoolName    VARCHAR(20),
                               FinalGraduationMajor         VARCHAR(20),
                               FinalGraduationMajorName     VARCHAR(20),
                               LastDegreeUnit               VARCHAR(20),
                               FinalGraduationCertificateNumber VARCHAR(20),
                               FinalEducation               VARCHAR(20),
                               FinalDegree                  VARCHAR(20),
                               FinalGraduationDate          VARCHAR(20),
                               FinalDegreeDate              VARCHAR(20),
                               FinalAcademicLearningForm    VARCHAR(20),
                               FOREIGN KEY (StudentID) REFERENCES BasicInfo (StudentID)
);

CREATE TABLE ExtensionInfo (
                               StudentID                    INT PRIMARY KEY,
                               WxID                         VARCHAR(20),
                               QQID                         VARCHAR(20),
                               Phone                        VARCHAR(20),
                               Address                      VARCHAR(100),
                               PostCode                     VARCHAR(10),
                               StudyUnit                    VARCHAR(20),
                               UnitPhone                    VARCHAR(20),
                               UnitPostCode                 VARCHAR(10),
                               UnitAddress                  VARCHAR(100),
                               EmergencyContact             VARCHAR(20),
                               EmergencyPhone               VARCHAR(20),
                               EmergencyPostCode            VARCHAR(10),
                               EmergencyAddress             VARCHAR(100),
                               DormitoryAddress             VARCHAR(100),
                               DormitoryPhone               VARCHAR(20),
                               technicalPosition            VARCHAR(20),
                               AdministrativePositionLevel  VARCHAR(20),
                               FamilyAddress                VARCHAR(100),
                               FamilyPostCode               VARCHAR(10),
                               FamilyPhone                  VARCHAR(20),
                               FamilyContact                VARCHAR(20),
                               FOREIGN KEY (StudentID) REFERENCES BasicInfo (StudentID)
);

CREATE TABLE UserInfo (
                          UserID              INT PRIMARY KEY,
                          username            VARCHAR(20),
                          password            VARCHAR(20),
                          role                VARCHAR(20),
                          isFirstLogin        VARCHAR(20),
                          department          VARCHAR(20)
);

CREATE TABLE PostGraduate (
                              UserID              INT PRIMARY KEY,
                              Password            VARCHAR(20),
                              newPassword         VARCHAR(20),
                              FOREIGN KEY (UserID) REFERENCES UserInfo (UserID)
);

CREATE TABLE WorkExperience (
                                StudentID           INT PRIMARY KEY,
                                startTime           DATE,
                                endTime             DATE,
                                workUnit            VARCHAR(100),
                                workCategory        VARCHAR(20),
                                WorkPosition        VARCHAR(20),
                                WorkDuty            VARCHAR(100),
                                provePerson         VARCHAR(20),
                                notes               VARCHAR(100),
                                FOREIGN KEY (StudentID) REFERENCES BasicInfo (StudentID)
);

CREATE TABLE EducationExperience (
                                     StudentID           INT PRIMARY KEY,
                                     SchoolName          VARCHAR(100),
                                     startTime           DATE,
                                     endTime             DATE,
                                     major               VARCHAR(20),
                                     majorDescription    VARCHAR(100),
                                     degree              VARCHAR(20),
                                     degreeType          VARCHAR(20),
                                     graduatePosition    VARCHAR(20),
                                     RestTime            VARCHAR(20),
                                     IsGraduate          VARCHAR(20),
                                     FOREIGN KEY (StudentID) REFERENCES BasicInfo (StudentID)
);

CREATE TABLE pending_student (
                                 StudentID                             INT,
                                 Name                                  VARCHAR(50),
                                 Gender                                VARCHAR(10),
                                 college                               VARCHAR(50),
                                 major                                 VARCHAR(50),
                                 id                                    INT AUTO_INCREMENT PRIMARY KEY, -- 待审核记录的唯一ID（自增主键）
                                 operationType VARCHAR(10) NOT NULL, -- 操作类型: ADD, UPDATE
                                 status VARCHAR(10) NOT NULL DEFAULT 'PENDING', -- 审核状态: PENDING, APPROVED, REJECTED
                                 submitTime DATETIME(6) NOT NULL -- 提交时间
);


--  插入张三的基本信息
INSERT INTO BasicInfo (StudentID, Name, Name_PY, Gender, nation, BirthDate, native_place, political_status, ID_type, ID_number, country, marital_status, BirthPlace, origin_place, family_address, HuKou_place, HuKou_detailed_place, HuKou_postal_code, Railway_Station_start, Railway_Station_end, phone_number, campus_email, personal_email, Join_party_date, student_label, department_ID, award, grade, entrance_season, Cultivation_level, Student_category, college, management_department, major, length_of_schooling, entrance_method, campus_zone, entrance_date, class, Enrollment_major, Degree_Category, Degree_type, major_way, culture_method, study_method, JinXiu_category, special_plan, Expected_graduation_time, Joint_Training_Unit, interdisciplinary, overseas, Actual_graduation_time, Student_status, Student_status_change_status, mentor, mentor2, Joint_training_mentors, On_campus, Research_Direction, Registration_Status, Payment_status, degrees, receive_academic_education, degree_status, professional_degree_category, Interdisciplinary_training, Interdisciplinary_training_discipline, Date_of_degree_award)
VALUES (1, '张三', 'Zhang San', '男', '汉族', '1998-05-25', '北京', '党员', '身份证', '110101199805250011', '中国', '未婚', '北京', '北京', '北京', '北京', '东城区', '100010', '北京火车站', '上海火车站', '13812345678', 'zhangsan@university.edu', 'zhangsan@gmail.com', '2017-06-01', '大一', '001', '优秀学生奖', 'A', '春季', '硕士研究生', '全日制专业学位硕士', '计算机科学与技术学院', '浙江工业大学', '软件工程专业', '3年', '全国统考', '屏峰校区', '2017-09-01', 'CS101', '软件工程', '软件工程', '专业学位', 'cs', '非定向', '全日制', '校内进修', '无', '2021-06-30', '无', '否', '否', '2021-06-30', '正常', '转专业', '李四', '无', '无', '在校', '人工智能', '已注册', '已付款', '学士', '是', '未获', '计算机科学与技术', '否', '无', '2021-06-30');

--   插入张三的入学信息
INSERT INTO AdmissionInfo (StudentID, EnrollmentYear, CandidateID, ApplicationCategory, CandidateSource, AdmissionCategory, ExaminationMethods, ReturnStatus, RetentionQualificationYears, targetedTrainingUnits, targetedTrainingUnitsPlace, RecommendedUnit, FinalGraduationSchool, FinalGraduationSchoolName, FinalGraduationMajor, FinalGraduationMajorName, LastDegreeUnit, FinalGraduationCertificateNumber, FinalEducation, FinalDegree, FinalGraduationDate, FinalDegreeDate, FinalAcademicLearningForm)
VALUES (1, 2012, 987654, '普通入学', '高考', '统考录取', '笔试', '正常', 0, '无', '', '学校推荐', '北京大学', '北京大学', '计算机科学与技术', '硕士研究生', '学士学位', '123456789', '研究生', '硕士', '2012-09-01', '2015-06-30', '全日制');

--   插入张三的扩展信息
INSERT INTO ExtensionInfo (StudentID, WxID, QQID, Phone, Address, PostCode, StudyUnit, UnitPhone, UnitPostCode, UnitAddress, EmergencyContact, EmergencyPhone, EmergencyPostCode, EmergencyAddress, DormitoryAddress, DormitoryPhone, technicalPosition, AdministrativePositionLevel, FamilyAddress, FamilyPostCode, FamilyPhone, FamilyContact)
VALUES (1, 'wx123456', 'qq987654', '13899998888', '北京市朝阳区学院路甲1号', '100101', '北京大学', '010-12345678', '100101', '北京市海淀区中关村大街1号', '王小明父亲', '13987654321', '100102', '北京市朝阳区学院路甲1号', '北京市朝阳区学院路甲1号', '010-87654321', '高级工程师', '副院长', '北京市朝阳区学院路甲1号', '100101', '010-12345678', '王小明父亲');

--   插入张三的工作经验
INSERT INTO WorkExperience (StudentID, startTime, endTime, workUnit, workCategory, WorkPosition, WorkDuty, provePerson, notes)
VALUES (1, '2022-07-01', '2024-07-01', '腾讯科技有限公司', '技术类', '软件工程师', '负责软件开发与维护', '王经理', '无');

--   插入张三的教育经历
INSERT INTO EducationExperience (StudentID, SchoolName, startTime, endTime, major, majorDescription, degree, degreeType, graduatePosition, RestTime, IsGraduate)
VALUES (1, '北京大学', '2012-09-01', '2015-06-30', '计算机科学与技术', '主要学习计算机编程、算法等相关课程', '学士', '工学学士', '计算机科学与技术专业学士', '无', '是');

--   插入李四的基本信息
INSERT INTO BasicInfo (StudentID, Name, Name_PY, Gender, nation, BirthDate, native_place, political_status, ID_type, ID_number, country, marital_status, BirthPlace, origin_place, family_address, HuKou_place, HuKou_detailed_place, HuKou_postal_code, Railway_Station_start, Railway_Station_end, phone_number, campus_email, personal_email, Join_party_date, student_label, department_ID, award, grade, entrance_season, Cultivation_level, Student_category, college, management_department, major, length_of_schooling, entrance_method, campus_zone, entrance_date, class, Enrollment_major, Degree_Category, Degree_type, major_way, culture_method, study_method, JinXiu_category, special_plan, Expected_graduation_time, Joint_Training_Unit, interdisciplinary, overseas, Actual_graduation_time, Student_status, Student_status_change_status, mentor, mentor2, Joint_training_mentors, On_campus, Research_Direction, Registration_Status, Payment_status, degrees, receive_academic_education, degree_status, professional_degree_category, Interdisciplinary_training, Interdisciplinary_training_discipline, Date_of_degree_award)
VALUES (2, '李四', 'Li Si', '男', '汉族', '1999-03-15', '上海', '党员', '身份证', '310101199903150022', '中国', '未婚', '上海', '上海', '上海', '上海', '黄浦区', '200010', '上海火车站', '广州火车站', '13987654321', 'lisi@university.edu', 'lisi@gmail.com', '2018-05-01', '大二', '002', '三好学生奖', 'B', '秋季', '硕士研究生', '全日制专业学位硕士', '计算机科学与技术学院', '浙江工业大学', '软件工程专业', '3年', '全国统考', '屏峰校区', '2018-09-01', 'CS102', '软件工程', '软件工程', '专业学位', 'cs', '非定向', '全日制', '校内进修', '无', '2022-06-30', '无', '否', '否', '2022-06-30', '正常', '转专业', '王小明', '无', '无', '在校', '人工智能', '已注册', '已付款', '学士', '是', '未获', '计算机科学与技术', '否', '无', '2022-06-30');

--   插入李四的入学信息
INSERT INTO AdmissionInfo (StudentID, EnrollmentYear, CandidateID, ApplicationCategory, CandidateSource, AdmissionCategory, ExaminationMethods, ReturnStatus, RetentionQualificationYears, targetedTrainingUnits, targetedTrainingUnitsPlace, RecommendedUnit, FinalGraduationSchool, FinalGraduationSchoolName, FinalGraduationMajor, FinalGraduationMajorName, LastDegreeUnit, FinalGraduationCertificateNumber, FinalEducation, FinalDegree, FinalGraduationDate, FinalDegreeDate, FinalAcademicLearningForm)
VALUES (2, 2013, 876543, '普通入学', '高考', '统考录取', '笔试', '正常', 0, '无', '', '学校推荐', '北京大学', '北京大学', '计算机科学与技术', '硕士研究生', '学士学位', '987654321', '研究生', '硕士', '2013-09-01', '2016-06-30', '全日制');

--   插入李四的扩展信息
INSERT INTO ExtensionInfo (StudentID, WxID, QQID, Phone, Address, PostCode, StudyUnit, UnitPhone, UnitPostCode, UnitAddress, EmergencyContact, EmergencyPhone, EmergencyPostCode, EmergencyAddress, DormitoryAddress, DormitoryPhone, technicalPosition, AdministrativePositionLevel, FamilyAddress, FamilyPostCode, FamilyPhone, FamilyContact)
VALUES (2, 'wx654321', 'qq123456', '13911118888', '上海市黄浦区延安东路100号', '200001', '上海交通大学', '021-87654321', '200001', '上海市闵行区东川路800号', '李四母亲', '13876543210', '200002', '上海市黄浦区延安东路100号', '上海市黄浦区延安东路100号', '021-76543210', '高级工程师', '院长', '上海市黄浦区延安东路100号', '200001', '021-87654321', '李四母亲');

--   插入李四的工作经验
INSERT INTO WorkExperience (StudentID, startTime, endTime, workUnit, workCategory, WorkPosition, WorkDuty, provePerson, notes)
VALUES (2, '2023-07-01', '2025-07-01', '阿里巴巴集团', '技术类', '软件工程师', '负责软件开发与维护', '张经理', '无');

--   插入李四的教育经历
INSERT INTO EducationExperience (StudentID, SchoolName, startTime, endTime, major, majorDescription, degree, degreeType, graduatePosition, RestTime, IsGraduate)
VALUES (2, '上海交通大学', '2013-09-01', '2016-06-30', '计算机科学与技术', '主要学习计算机编程、算法等相关课程', '学士', '工学学士', '计算机科学与技术专业学士', '无', '是');

--   插入王五的基本信息
INSERT INTO BasicInfo (StudentID, Name, Name_PY, Gender, nation, BirthDate, native_place, political_status, ID_type, ID_number, country, marital_status, BirthPlace, origin_place, family_address, HuKou_place, HuKou_detailed_place, HuKou_postal_code, Railway_Station_start, Railway_Station_end, phone_number, campus_email, personal_email, Join_party_date, student_label, department_ID, award, grade, entrance_season, Cultivation_level, Student_category, college, management_department, major, length_of_schooling, entrance_method, campus_zone, entrance_date, class, Enrollment_major, Degree_Category, Degree_type, major_way, culture_method, study_method, JinXiu_category, special_plan, Expected_graduation_time, Joint_Training_Unit, interdisciplinary, overseas, Actual_graduation_time, Student_status, Student_status_change_status, mentor, mentor2, Joint_training_mentors, On_campus, Research_Direction, Registration_Status, Payment_status, degrees, receive_academic_education, degree_status, professional_degree_category, Interdisciplinary_training, Interdisciplinary_training_discipline, Date_of_degree_award)
VALUES (3, '王五', 'Wang Wu', '男', '汉族', '2000-12-05', '广州', '党员', '身份证', '440101200012050033', '中国', '未婚', '广州', '广州', '广州', '广州', '越秀区', '510030', '广州火车站', '深圳火车站', '13812345678', 'wangwu@university.edu', 'wangwu@gmail.com', '2019-06-01', '大三', '003', '优良学风奖', 'A', '春季', '硕士研究生', '全日制专业学位硕士', '计算机科学与技术学院', '浙江工业大学', '软件工程专业', '3年', '全国统考', '屏峰校区', '2019-09-01', 'CS103', '软件工程', '软件工程', '专业学位', 'cs', '非定向', '全日制', '校内进修', '无', '2023-06-30', '无', '否', '否', '2023-06-30', '正常', '转专业', '李小明', '无', '无', '在校', '人工智能', '已注册', '已付款', '学士', '是', '未获', '计算机科学与技术', '否', '无', '2023-06-30');

--   插入王五的入学信息
INSERT INTO AdmissionInfo (StudentID, EnrollmentYear, CandidateID, ApplicationCategory, CandidateSource, AdmissionCategory, ExaminationMethods, ReturnStatus, RetentionQualificationYears, targetedTrainingUnits, targetedTrainingUnitsPlace, RecommendedUnit, FinalGraduationSchool, FinalGraduationSchoolName, FinalGraduationMajor, FinalGraduationMajorName, LastDegreeUnit, FinalGraduationCertificateNumber, FinalEducation, FinalDegree, FinalGraduationDate, FinalDegreeDate, FinalAcademicLearningForm)
VALUES (3, 2014, 765432, '普通入学', '高考', '统考录取', '笔试', '正常', 0, '无', '', '学校推荐', '北京大学', '北京大学', '计算机科学与技术', '硕士研究生', '学士学位', '654321987', '研究生', '硕士', '2014-09-01', '2017-06-30', '全日制');

--   插入王五的扩展信息
INSERT INTO ExtensionInfo (StudentID, WxID, QQID, Phone, Address, PostCode, StudyUnit, UnitPhone, UnitPostCode, UnitAddress, EmergencyContact, EmergencyPhone, EmergencyPostCode, EmergencyAddress, DormitoryAddress, DormitoryPhone, technicalPosition, AdministrativePositionLevel, FamilyAddress, FamilyPostCode, FamilyPhone, FamilyContact)
VALUES (3, 'wx987654', 'qq654321', '13888889999', '广州市天河区五山路甲1号', '510075', '中山大学', '020-12345678', '510075', '广州市海珠区新港西路135号', '王五母亲', '13876543211', '510076', '广州市天河区五山路甲1号', '广州市天河区五山路甲1号', '020-87654321', '高级工程师', '副院长', '广州市天河区五山路甲1号', '510075', '020-12345678', '王五母亲');

--   插入王五的工作经验
INSERT INTO WorkExperience (StudentID, startTime, endTime, workUnit, workCategory, WorkPosition, WorkDuty, provePerson, notes)
VALUES (3, '2024-07-01', '2026-07-01', '百度公司', '技术类', '软件工程师', '负责软件开发与维护', '李经理', '无');

--   插入王五的教育经历
INSERT INTO EducationExperience (StudentID, SchoolName, startTime, endTime, major, majorDescription, degree, degreeType, graduatePosition, RestTime, IsGraduate)
VALUES (3, '中山大学', '2014-09-01', '2017-06-30', '计算机科学与技术', '主要学习计算机编程、算法等相关课程', '学士', '工学学士', '计算机科学与技术专业学士', '无', '是');

INSERT INTO UserInfo (UserID, username, password, role, isFirstLogin, department) VALUES
                                                                                      (1, '张三', '123456aA.', '研究生', '0', '无'),
                                                                                      (2, '李四', '123456aA.', '研究生', '0', '无'),
                                                                                      (3, '王五', '123456aA.', '研究生', '0', '无'),
                                                                                      (11, '导师', '123456aA.', '导师', '0', '无'),
                                                                                      (1011, '研究生院领导', '123456aA.', '研究生院领导', '0', '无'),
                                                                                      (110, '学校领导', '123456aA.', '学校领导', '0', '无'),
                                                                                      (111, '学院研究生秘书', '123456aA.', '学院研究生秘书', '0', '无'),
                                                                                      (1001, '学院领导', '123456aA.', '学院领导', '0', '无'),
                                                                                      (1101, '研究生院管理员', '123456aA.', '研究生院管理员', '0', '无'),
                                                                                      (100, '系统管理员', '123456aA.', '系统管理员', '0', '无'),
                                                                                      (101, '审计管理员', '123456aA.', '审计管理员', '0', '无');

INSERT INTO PostGraduate (UserID, Password, newPassword) VALUES
                                                             (1, '123456aA.', NULL),
                                                             (2, '123456aA.', NULL),
                                                             (3, '123456aA.', NULL),
                                                             (11, '123456aA.', NULL),
                                                             (1011, '123456aA.', NULL),
                                                             (110, '123456aA.', NULL),
                                                             (111, '123456aA.', NULL),
                                                             (1001, '123456aA.', NULL),
                                                             (100, '123456aA.', NULL),
                                                             (101, '123456aA.', NULL);

ALTER TABLE userinfo MODIFY COLUMN password VARCHAR(64);

DELIMITER //
CREATE TRIGGER trg_insert_basicinfo_to_userinfo
AFTER INSERT ON BasicInfo
FOR EACH ROW
BEGIN
    -- 自动将BasicInfo中的StudentID同步到UserInfo的UserID
    -- 同时将Name同步到username，并设置默认role和isFirstLogin
    INSERT INTO UserInfo (UserID, username, password, role, isFirstLogin, department)
    VALUES (
        NEW.StudentID,       -- 同步StudentID到UserID
        NEW.Name,            -- 同步Name到username
        '123456aA.',         -- 默认密码（建议后续通过业务逻辑修改）
        '研究生',            -- 默认角色为研究生
        '1',                 -- 默认首次登录标记为1
        NULL                 -- 部门默认为空
    )
    ON DUPLICATE KEY UPDATE  -- 处理唯一键冲突（如UserID已存在）
        username = NEW.Name,
        role = '研究生',
        isFirstLogin = '1';
END //
DELIMITER ;
DELIMITER //
CREATE TRIGGER trg_insert_basicinfo_to_postgraduate
AFTER INSERT ON BasicInfo
FOR EACH ROW
BEGIN
    -- 自动将BasicInfo中的StudentID同步到PostGraduate的UserID
    INSERT INTO PostGraduate (UserID, Password, newPassword)
    VALUES (
        NEW.StudentID,       -- 同步StudentID到UserID
        '123456aA.',         -- 默认密码
        NULL                 -- 新密码默认为空
    )
    ON DUPLICATE KEY UPDATE  -- 处理唯一键冲突
        Password = '123456aA.';
END //
DELIMITER ;
DELIMITER //
CREATE TRIGGER trg_update_basicinfo_to_userinfo
AFTER UPDATE ON BasicInfo
FOR EACH ROW
BEGIN
    -- 当BasicInfo的Name更新时，同步更新UserInfo的username
    IF NEW.Name <> OLD.Name THEN
        UPDATE UserInfo
        SET username = NEW.Name
        WHERE UserID = NEW.StudentID;
    END IF;
END //
DELIMITER ;
DELIMITER // -- 当 UserInfo 插入新记录时，同步到 PostGraduate CREATE TRIGGER trg_userinfo_insert_to_postgraduate AFTER INSERT ON UserInfo FOR EACH ROW BEGIN -- 若 PostGraduate 不存在该 UserID，则插入新记录 IF NOT EXISTS (SELECT 1 FROM PostGraduate WHERE UserID = NEW.UserID) THEN INSERT INTO PostGraduate (UserID, Password, newPassword) VALUES (NEW.UserID, NEW.password, NULL); END IF; END // -- 当 UserInfo 更新密码时，同步更新 PostGraduate CREATE TRIGGER trg_userinfo_update_to_postgraduate AFTER UPDATE ON UserInfo FOR EACH ROW BEGIN -- 若密码字段发生变化，则更新 PostGraduate IF NEW.password <> OLD.password THEN UPDATE PostGraduate SET Password = NEW.password WHERE UserID = NEW.UserID; END IF; END // DELIMITER ;

-- 删除PostGraduate表（如果存在）
DROP TABLE IF EXISTS PostGraduate;