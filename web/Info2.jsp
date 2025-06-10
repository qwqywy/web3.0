<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>领导查询学籍信息</title>
    <style>
        :root {
            --primary-color: #007bff;
            --secondary-color: #0b77e4;
            --dark-color: #2c3e50;
            --light-color: #f5f7fa;
            --success-color: #27ae60;
            --warning-color: #f39c12;
            --danger-color: #e74c3c;
            --text-color: #1e1f22;
            --border-radius: 6px;
            --box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            --transition: all 0.3s ease;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--light-color);
            color: #333;
            line-height: 1.6;
            margin: 0;
            padding: 0;
        }
        .header {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 15px 30px;
            box-shadow: var(--box-shadow);
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 100;
        }
        .header img {
            height: 50px;
            margin-right: 15px;
        }
        .logo_1 {
            display: flex;
            align-items: center;
        }
        .header #xtmc {
            font-size: 1.5rem;
            font-weight: 600;
        }
        .header a {
            color: white;
            text-decoration: none;
            margin-left: 20px;
            padding: 5px 10px;
            border-radius: var(--border-radius);
            transition: var(--transition);
        }
        .header a:hover {
            background-color: rgba(255, 255, 255, 0.2);
        }
        .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 20px;
            margin-left: 180px;
            transition: var(--transition);
        }


        .center_bar {
            display: none;
            animation: fadeIn 0.5s ease;
        }
        .center_bar.active {
            display: block;
        }

        .tabs {
            display: flex;
            border-bottom: 2px solid var(--primary-color);
            margin-bottom: 25px;
        }
        .tabs a {
            padding: 12px 25px;
            margin-right: 5px;
            border-radius: var(--border-radius) var(--border-radius) 0 0;
            transition: var(--transition);
            text-decoration: none;
            color: var(--primary-color);
            font-weight: 500;
        }
        .tabs a:hover {
            background-color: rgba(52, 152, 219, 0.1);
        }
        .tabs a.active {
            background-color: var(--primary-color);
            color: white;
        }

        .content-section {
            display: none;
            padding: 20px;
            background-color: white;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            margin-bottom: 30px;
        }
        .content-section.active {
            display: block;
            animation: fadeIn 0.5s ease;
        }
        .content-section h2 {
            color: var(--text-color);
            margin-top: 0;
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
        }

        .info-table {
            width: 100%;
            border: 0.5px;
            border-color: #c3c3c3;
            border-collapse: collapse;
            border-spacing: 0;
            margin: 25px 0;
            background-color: white;
            box-shadow: var(--box-shadow);
            border-radius: var(--border-radius);
            overflow: hidden;
        }
        .info-table th {
            background-color: var(--light-color);
            color: var(--text-color);
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }
        .info-table td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }
        .info-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .info-table td:hover {
            background-color: #f1f1f1;
        }

        .form-section {
            display: none;
            background-color: white;
            padding: 30px;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            max-width: 800px;
            margin: 0 auto;
        }
        .form-section.active {
            display: block;
            animation: fadeIn 0.5s ease;
        }
        .form-section h2 {
            color: var(--text-color);
            margin-bottom: 25px;
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
            text-align: center;
        }
        .form-section label {
            display: block;
            margin: 15px 0 5px;
            font-weight: 500;
            color: var(--dark-color);
        }

        .form-section input,
        .form-section select,
        .form-section textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: var(--border-radius);
            box-sizing: border-box;
            font-size: 16px;
            transition: var(--transition);
        }

        .form-section input:focus,
        .form-section select:focus,
        .form-section textarea:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
            outline: none;
        }

        .form-section input[type="text"],
        .form-section input[type="date"],
        .form-section input[type="email"] {
            width: 100%;
        }

        .form-section button {
            background-color: var(--success-color);
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: var(--border-radius);
            cursor: pointer;
            font-size: 16px;
            font-weight: 500;
            transition: var(--transition);
            margin-top: 20px;
            width: 100%;
        }
        .form-section button:hover {
            background-color: #219653;
            transform: translateY(-2px);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* 响应式设计 */
        @media (max-width: 1200px) {
            .container {
                margin-left: auto;
            }
        }
        @media (max-width: 992px) {
            .side_bar {
                width: 60px;
                padding: 10px 5px;
            }

            .side_bar_button span {
                display: none;
            }

            .container {
                margin-left: 80px;
            }
        }
        @media (max-width: 768px) {
            .header {
                flex-direction: column;
                text-align: center;
                padding: 15px;
            }

            .header > div {
                margin-top: 10px;
            }


            .container {
                margin-left: 0;
                padding: 15px;
            }

            .tabs {
                flex-wrap: wrap;
            }

            .tabs a {
                margin-bottom: 5px;
                padding: 8px 15px;
            }

            .info-table {
                font-size: 14px;
            }

            .info-table th,
            .info-table td {
                padding: 8px;
            }
        }
        @media (max-width: 576px) {
            .header #xtmc {
                font-size: 1.2rem;
            }

            .content-section,
            .form-section {
                padding: 15px;
            }

            .form-section input,
            .form-section select,
            .form-section textarea {
                padding: 8px;
            }
        }
    </style>
    <script>
        function showContent(id) {
            var sections = document.querySelectorAll('.center_bar');
            sections.forEach(function(section) {
                section.classList.remove('active');
            });
            document.getElementById(id).classList.add('active');
        }

        function showSection(id, tabID) {
            var sections = document.querySelectorAll('.content-section');
            sections.forEach(function(section) {
                section.classList.remove('active');
            });
            document.getElementById(id).classList.add('active');
            for(let i=1; i<=3; i++) {
                document.getElementById('tab'+i).classList.remove('active');
            }
            document.getElementById(tabID).classList.add('active');
        }
    </script>
</head>
<body>
<div class="header">
    <div class="logo_1">
        <img src="${pageContext.request.contextPath}/IMG/logo_jw_d.png" alt="学校Logo">
        <span id="xtmc">浙江工业大学研究生学籍管理系统</span>
    </div>
    <div>
        <a href="login.jsp">退出登录</a>
    </div>
</div>
<div class="container">
    <div class="center_bar" id="table1">
        <div class="tabs">
            <a href="#basic-info" class="active" id="tab1" onclick="showSection('basic-info', 'tab1'); return false;">基础信息</a>
            <a href="#admission-info" id="tab2" onclick="showSection('admission-info', 'tab2'); return false;">入学信息</a>
            <a href="#extended-info" id="tab3" onclick="showSection('extended-info', 'tab3'); return false;">扩展信息</a>
        </div>
        <div id="basic-info" class="content-section active">
            <h2>基础信息</h2>
            <table class="info-table">
                <tr>
                    <th>学号</th>
                    <td>${basicInfo.studentID}</td>
                    <th>姓名</th>
                    <td>${basicInfo.name}</td>
                    <th>姓名拼音</th>
                    <td>${basicInfo.namePY}</td>
                </tr>
                <tr>
                    <th>性别</th>
                    <td>${basicInfo.gender}</td>
                    <th>民族</th>
                    <td>${basicInfo.nation}</td>
                    <th>出生日期</th>
                    <td>${basicInfo.birthDate}</td>
                </tr>
                <tr>
                    <th>籍贯</th>
                    <td>${basicInfo.nativePlace}</td>
                    <th>政治面貌</th>
                    <td>${basicInfo.politicalStatus}</td>
                    <th>证件类型</th>
                    <td>${basicInfo.IDType}</td>
                </tr>
                <tr>
                    <th>证件号码</th>
                    <td>${basicInfo.IDNumber}</td>
                    <th>国家地区</th>
                    <td>${basicInfo.country}</td>
                    <th>婚姻状况</th>
                    <td>${basicInfo.maritalStatus}</td>
                </tr>
                <tr>
                    <th>出生地</th>
                    <td>${basicInfo.birthPlace}</td>
                    <th>生源地</th>
                    <td>${basicInfo.originPlace}</td>
                <tr>
                    <th>家庭地址</th>
                    <td>${basicInfo.familyAddress}</td>
                    <th>户口所在地</th>
                    <td>${basicInfo.huKouPlace}</td>


                </tr>
                <tr>
                    <th>户口所在地详细地址</th>
                    <td>${basicInfo.huKouDetailedPlace}</td>
                    <th>户口所在地邮编</th>
                    <td>${basicInfo.huKouPostalCode}</td>

                </tr>
                <tr>
                    <th>火车起点站</th>
                    <td>${basicInfo.railwayStationStart}</td>
                    <th>火车终点站</th>
                    <td>${basicInfo.railwayStationEnd}</td>

                    <th>手机号码</th>
                    <td>${basicInfo.phoneNumber}</td>
                </tr>
                <tr>
                    <th>校内电子邮箱</th>
                    <td>${basicInfo.campusEmail}</td>
                    <th>电子邮箱</th>
                    <td>${basicInfo.personalEmail}</td>

                    <th>入党日期</th>
                    <td>${basicInfo.joinPartyDate}</td>
                </tr>
                <tr>
                    <th>学生标签</th>
                    <td>${basicInfo.studentLabel}</td>

                    <th>宿舍号</th>
                    <td>${basicInfo.departmentID}</td>
                </tr>
                <tr>
                    <th>奖励情况</th>
                    <td>${basicInfo.award}</td>
                </tr>
            </table>
            <h2>在校信息</h2>
            <table class="info-table">
                <tr>
                    <th>年级</th>
                    <td>${basicInfo.grade}</td>
                    <th>入学季节</th>
                    <td>${basicInfo.entranceSeason}</td>
                    <th>培养层次</th>
                    <td>${basicInfo.cultivationLevel}</td>
                </tr>
                <tr>
                    <th>学生类别</th>
                    <td>${basicInfo.studentCategory}</td>
                    <th>学院</th>
                    <td>${basicInfo.college}</td>
                    <th>管理单位</th>
                    <td>${basicInfo.managementDepartment}</td>
                </tr>
                <tr>
                    <th>专业</th>
                    <td>${basicInfo.major}</td>
                    <th>学制</th>
                    <td>${basicInfo.lengthOfSchooling}</td>
                    <th>入学方式</th>
                    <td>${basicInfo.entranceMethod}</td>
                </tr>
                <tr>
                    <th>校区</th>
                    <td>${basicInfo.campusZone}</td>
                    <th>入学年月</th>
                    <td>${basicInfo.entranceDate}</td>
                    <th>班级</th>
                    <td>${basicInfo.studentClass}</td>

                </tr>

                <tr>
                    <th>招生专业</th>
                    <td>${basicInfo.enrollmentMajor}</td>
                    <th>门类/学业学位类别</th>
                    <td>${basicInfo.degreeCategory}</td>
                    <th>学位类型</th>
                    <td>${basicInfo.degreeType}</td>
                </tr>
                <tr>
                    <th>专业方向</th>
                    <td>${basicInfo.majorWay}</td>
                    <th>培养方式</th>
                    <td>${basicInfo.cultureMethod}</td>
                    <th>学习方式</th>
                    <td>${basicInfo.studyMethod}</td>
                </tr>
                <tr><th>进修性质</th>
                    <td>${basicInfo.jinXiuCategory}</td>
                    <th>专项计划</th>
                    <td>${basicInfo.specialPlan}</td>
                    <th>预计毕业时间</th>
                    <td>${basicInfo.expectedGraduationTime}</td>

                </tr>
                <tr><th>联合培养单位名称</th>
                    <td>${basicInfo.jointTrainingUnit}</td>
                    <th>是否跨学科</th>
                    <td>${basicInfo.interdisciplinary}</td>
                    <th>是否留学生</th>
                    <td>${basicInfo.overseas}</td>

                </tr>
                <tr>
                    <th>实际毕业时间</th>
                    <td>${basicInfo.actualGraduationTime}</td>
                    <th>学籍状态</th>
                    <td>${basicInfo.studentStatus}</td>
                    <th>学籍异动状态</th>
                    <td>${basicInfo.studentStatusChangeStatus}</td>
                </tr>
                <tr>
                    <th>导师</th>
                    <td>${basicInfo.mentor}</td>
                    <th>导师2</th>
                    <td>${basicInfo.mentor2}</td>
                    <th>联合培养导师</th>
                    <td>${basicInfo.jointTrainingMentors}</td>
                </tr>
                <tr>
                    <th>在校标识</th>
                    <td>${basicInfo.onCampus}</td>
                    <th>研究方向</th>
                    <td>${basicInfo.researchDirection}</td>
                    <th>注册状态</th>
                    <td>${basicInfo.registrationStatus}</td>
                </tr>
                <tr>
                    <th>缴费情况</th>
                    <td>${basicInfo.paymentStatus}</td>
                    <th>学位</th>
                    <td>${basicInfo.degrees}</td>
                    <th>是否接受学历教育</th>
                    <td>${basicInfo.receiveAcademicEducation}</td>
                </tr>
                <tr>
                    <th>学位情况</th>
                    <td>${basicInfo.degreeStatus}</td>
                    <th>一级学科/专业学位类别</th>
                    <td>${basicInfo.professionalDegreeCategory}</td>
                    <th>是否学科交叉培养</th>
                    <td>${basicInfo.interdisciplinaryTraining}</td>
                </tr>
                <tr>
                    <th>交叉培养学科</th>
                    <td>${basicInfo.interdisciplinaryTrainingDiscipline}</td>
                    <th>学位授予时间</th>
                    <td>${basicInfo.dateOfDegreeAward}</td>
                </tr>
            </table>
        </div>
        <div id="admission-info" class="content-section">
            <h2>入学信息</h2>
            <table class="info-table">
                <tr>
                    <th>招生年度</th>
                    <td>${admissionInfo.enrollmentYear}</td>
                    <th>考生编号</th>
                    <td>${admissionInfo.candidateID}</td>
                    <th>报考类别</th>
                    <td>${admissionInfo. applicationCategory}</td>
                </tr>
                <tr>
                    <th>考生来源</th>
                    <td>${admissionInfo.candidateSource}</td>
                    <th>录取类别</th>
                    <td>${admissionInfo.admissionCategory}</td>
                    <th>考试方式</th>
                    <td>${admissionInfo.examinationMethods}</td>
                </tr>
                <tr>
                    <th>是否保送</th>
                    <td>${admissionInfo.returnStatus}</td>
                    <th>保留入学资格年限</th>
                    <td>${admissionInfo.retentionQualificationYears}</td>
                    <th>定向委培单位所在地</th>
                    <td>${admissionInfo.targetedTrainingUnitsPlace}</td>
                </tr>
                <tr>
                    <th>定向委培单位</th>
                    <td><"${admissionInfo.targetedTrainingUnits}/></td>
                    <th>推免单位</th>
                    <td>${admissionInfo.recommendedUnit}</td>
                </tr>
                <!-- 其他入学信息字段 -->
            </table>
            <h2>入学前学历信息</h2>
            <table class="info-table">
                <tr>
                    <th>最后毕业学校</th>
                    <td>${admissionInfo.finalGraduationSchool}</td>
                    <th>最后毕业学校名称</th>
                    <td>${admissionInfo.finalGraduationSchoolName}</td>
                </tr>
                <tr>
                    <th>最后毕业专业</th>
                    <td>${admissionInfo.finalGraduationMajor}</td>
                    <th>最后毕业专业名称</th>
                    <td>${admissionInfo.finalGraduationMajorName}</td>
                    <th>最后学历单位</th>
                    <td>${admissionInfo.lastDegreeUnit}</td>
                </tr>
                <tr>
                    <th>最后学位单位名称</th>
                    <td>${admissionInfo. finalGraduationSchoolName}</td>
                    <th>最后学位专业</th>
                    <td>${admissionInfo.finalGraduationMajor}</td>
                    <th>最后学历专业名称</th>
                    <td>${admissionInfo.finalGraduationMajorName}</td>
                </tr>
                <tr>
                    <th>最后毕业证书编号</th>
                    <td>${admissionInfo.finalGraduationCertificateNumber}</td>
                    <th>最后学历</th>
                    <td>${admissionInfo.finalEducation}</td>
                </tr>
                <tr>
                    <th>最后学位</th>
                    <td>${admissionInfo.finalDegree}</td>
                    <th>最后毕业时间</th>
                    <td><"${admissionInfo.finalGraduationDate}"/></td>
                    <th>最后学位时间</th>
                    <td><"${admissionInfo.finalDegreeDate}"/></td>
                </tr>
                <tr>
                    <th>最后学历学习形式</th>
                    <td>${admissionInfo.finalAcademicLearningForm}</td>
                </tr>
            </table>
        </div>
        <div id="extended-info" class="content-section">
            <h2>扩展信息</h2>
            <table class="info-table">
                <tr>
                    <th>微信号</th>
                    <td>${extensionInfo.wxID}</td>
                    <th>QQ</th>
                    <td>${extensionInfo.qqID}</td>
                    <th>联系电话</th>
                    <td>${extensionInfo.phone}</td>
                </tr>
                <tr>
                    <th>通讯地址</th>
                    <td colspan="3">${extensionInfo.address}</td>
                    <th>邮政编码</th>
                    <td>${extensionInfo.postCode}</td>
                </tr>
                <tr>
                    <th>现就学习或工作单位</th>
                    <td>${extensionInfo.studyUnit}</td>
                    <th>单位电话</th>
                    <td>${extensionInfo.unitPhone}</td>
                    <th>单位邮编</th>
                    <td>${extensionInfo.unitPostCode}</td>
                </tr>
                <tr>
                    <th>现就学习或工作单位地址</th>
                    <td colspan="3">${extensionInfo.unitAddress}</td>
                </tr>
                <tr>
                    <th>紧急联系人</th>
                    <td>${extensionInfo.emergencyContact}</td>
                    <th>紧急电话</th>
                    <td>${extensionInfo.emergencyPhone}</td>
                    <th>紧急联系人邮政编码</th>
                    <td>${extensionInfo.emergencyPostCode}</td>
                </tr>
                <tr>
                    <th>紧急联系人住址</th>
                    <td colspan="3">${extensionInfo.emergencyAddress}</td>
                </tr>
                <tr>
                    <th>宿舍地址</th>
                    <td>${extensionInfo.dormitoryAddress}</td>
                    <th>宿舍电话</th>
                    <td>${extensionInfo.dormitoryPhone}</td>
                    <th>专业技术职务</th>
                    <td>${extensionInfo.technicalPosition}</td>
                </tr>
                <tr>
                    <th>行政职务级别</th>
                    <td>${extensionInfo.administrativePositionLevel}</td>
                    <th>家庭所在地</th>
                    <td>${extensionInfo.familyAddress}</td>
                    <th>家庭邮政编码</th>
                    <td>${extensionInfo.familyPostCode}</td>
                </tr>
                <tr>
                    <th>家庭电话</th>
                    <td>${extensionInfo.familyPhone}</td>
                    <th>家庭联系人</th>
                    <td>${extensionInfo.familyContact}</td>
                </tr>
            </table>
            <h2>工作经历</h2>
            <table class="info-table">
                <thead>
                <tr>
                    <th>起始日期</th>
                    <th>结束日期</th>
                    <th>所在单位</th>
                    <th>从事工作</th>
                    <th>担任职务</th>
                    <th>证明人</th>
                    <th>备注</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>${workExperience.startTime}</td>
                    <td>${workExperience.endTime}</td>
                    <td>${workExperience.workUnit}</td>
                    <td>${workExperience.workPosition}</td>
                    <td>${workExperience.provePerson}</td>
                    <td>${workExperience.notes}</td>
                </tr>
                </tbody>
            </table>
            <%--    <div id="education-experience" class="content-section">--%>
            <h2>教育经历</h2>
            <table class="info-table">
                <thead>
                <tr>
                    <th>学校名称</th>
                    <th>起始日期</th>
                    <th>结束日期</th>
                    <th>专业名称</th>
                    <th>专业描述</th>
                    <th>学历</th>
                    <th>学位类型</th>
                    <th>毕业学校地点</th>
                    <th>修学年限</th>
                    <th>是否毕业</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>${educationExperience.schoolName}</td>
                    <td>${educationExperience.startTime}</td>
                    <td>${educationExperience.endTime}</td>
                    <td>${educationExperience.major}</td>
                    <td>${educationExperience.majorDescription}</td>
                    <td>${educationExperience.degreeType}</td>
                    <td>${educationExperience.graduatePosition}</td>
                    <td>${educationExperience.restTime}</td>
                    <td>${educationExperience.isGraduate}</td>
                </tr>
                <!-- 可以添加更多的教育经历记录 -->
                </tbody>
            </table>
        </div>
    </div>
    <script>
        showContent('table1');
    </script>
    <div class="center_bar" id="table2">
        <div class="form-section active">
            <h2>修改个人信息</h2>
            <form class="change-form" action="studentUpdateInfo" method="post">
                <label for="studentID">学号</label>
                <input type="text" id="studentID" name="studentID" value="${extensionInfo.studentID}" readonly>

                <label for="wxID">微信号</label>
                <input type="text" id="wxID" name="wxID" value="${extensionInfo.wxID}">

                <label for="qqID">QQ号</label>
                <input type="text" id="qqID" name="qqID" value="${extensionInfo.qqID}">

                <label for="phone">手机号码</label>
                <input type="text" id="phone" name="phone" value="${extensionInfo.phone}">

                <label for="address">地址</label>
                <input type="text" id="address" name="address" value="${extensionInfo.address}">

                <label for="postCode">邮政编码</label>
                <input type="text" id="postCode" name="postCode" value="${extensionInfo.postCode}">

                <label for="studyUnit">学习单位</label>
                <input type="text" id="studyUnit" name="studyUnit" value="${extensionInfo.studyUnit}">

                <label for="unitPhone">单位电话</label>
                <input type="text" id="unitPhone" name="unitPhone" value="${extensionInfo.unitPhone}">

                <label for="unitPostCode">单位邮政编码</label>
                <input type="text" id="unitPostCode" name="unitPostCode" value="${extensionInfo.unitPostCode}">

                <label for="unitAddress">单位地址</label>
                <input type="text" id="unitAddress" name="unitAddress" value="${extensionInfo.unitAddress}">

                <label for="emergencyContact">紧急联系人</label>
                <input type="text" id="emergencyContact" name="emergencyContact" value="${extensionInfo.emergencyContact}">

                <label for="emergencyPhone">紧急联系人电话</label>
                <input type="text" id="emergencyPhone" name="emergencyPhone" value="${extensionInfo.emergencyPhone}">

                <label for="emergencyPostCode">紧急联系人邮政编码</label>
                <input type="text" id="emergencyPostCode" name="emergencyPostCode" value="${extensionInfo.emergencyPostCode}">

                <label for="emergencyAddress">紧急联系人地址</label>
                <input type="text" id="emergencyAddress" name="emergencyAddress" value="${extensionInfo.emergencyAddress}">

                <label for="dormitoryAddress">宿舍地址</label>
                <input type="text" id="dormitoryAddress" name="dormitoryAddress" value="${extensionInfo.dormitoryAddress}">

                <label for="dormitoryPhone">宿舍电话</label>
                <input type="text" id="dormitoryPhone" name="dormitoryPhone" value="${extensionInfo.dormitoryPhone}">

                <label for="technicalPosition">技术职务</label>
                <input type="text" id="technicalPosition" name="technicalPosition" value="${extensionInfo.technicalPosition}">

                <label for="administrativePositionLevel">行政职务级别</label>
                <input type="text" id="administrativePositionLevel" name="administrativePositionLevel" value="${extensionInfo.administrativePositionLevel}">

                <label for="familyAddress">家庭地址</label>
                <input type="text" id="familyAddress" name="familyAddress" value="${extensionInfo.familyAddress}">

                <label for="familyPostCode">家庭邮政编码</label>
                <input type="text" id="familyPostCode" name="familyPostCode" value="${extensionInfo.familyPostCode}">

                <label for="familyPhone">家庭电话</label>
                <input type="text" id="familyPhone" name="familyPhone" value="${extensionInfo.familyPhone}">

                <label for="familyContact">家庭联系人</label>
                <input type="text" id="familyContact" name="familyContact" value="${extensionInfo.familyContact}">

                <button type="submit">保存修改</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>

