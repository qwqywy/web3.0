<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>修改学生信息</title>
    <style>
        :root {
            --primary-color: #007bff;
            --secondary-color: #0b77e4;
            --dark-color: #2c3e50;
            --light-color: #f5f7fa;
            --success-color: #27ae60;
            --warning-color: #f39c12;
            --danger-color: #e74c3c;
            --border-radius: 6px;
            --box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            --transition: all 0.3s ease;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f7fa;
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
            display: flex;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 80px);
            flex-wrap: wrap;
            padding: 20px;
            transition: var(--transition);
        }

        .form-section {
            width: 500px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            padding: 40px 80px;
            margin: 10px;
        }
        .form-section h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
        .query-form input,
        .btn-query{
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 14px;
        }
        .query-form input[type="text"]:focus {
            border-color: #007bff;
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.2);
        }
        .query-form input[type="submit"] {
            background-color: var(--primary-color);
            border: none;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .query-form input[type="submit"]:hover {
            background-color: var(--secondary-color);
        }
        .btn-query {
            color: white;
            background-color: var(--primary-color);
        }
        .btn-change {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 14px;
            color: white;
            background-color: var(--warning-color);
        }
        .optional {
            color: var(--primary-color);
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
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
    <script>
        function confirmSubmit() {
            // 检查是否有任何字段被修改
            let inputs = document.querySelectorAll('.modified-field');
            let modified = false;

            for (let input of inputs) {
                if (input.value.trim() !== '') {
                    modified = true;
                    break;
                }
            }

            if (!modified) {
                alert('请至少修改一个字段后再提交');
                return false;
            }

            return confirm('是否确认提交修改申请？提交后需要管理员审核才能生效。');
        }
    </script>
</head>
<body>
    <div class="header">
        <div class="logo_1">
            <img src="${pageContext.request.contextPath}/IMG/logo_jw_d.png" alt="学校Logo">
            <span id="xtmc">浙江工业大学研究生学籍管理系统</span>
        </div>
        <a href="login.jsp">退出登录</a>
    </div>
    <div class="container">
        <div class="form-section">
            <h2>修改学生信息</h2>
            <!-- 第一步：学号查询 -->
            <c:if test="${empty student}">
                <form class="query-form" action="StudentQuery2Servlet" method="get">
                    <label for="studentID">学号:</label>
                    <input type="text" id="studentID" name="studentID" placeholder="请输入学号" required>
                    <c:if test="${not empty error}">
                        <div style="color: var(--danger-color); margin-bottom: 15px;">${error}</div>
                    </c:if>
                    <button type="submit" class="btn-query">查询学生</button>
                </form>
            </c:if>

            <!-- 第二步：修改表单 -->
            <c:if test="${not empty student}">
                <form class="query-form" action="SubmitStudentServlet" method="post" onsubmit="return confirmSubmit()">
                    <input type="hidden" name="operationType" value="UPDATE">
                    <input type="hidden" name="studentID" value="${student.studentID}">

                    <h3>学生基本信息</h3>
                    <table class="info-table">
                        <tr>
                            <th>学号</th>
                            <td>${student.studentID}</td>
                        </tr>
                        <tr>
                            <th>姓名</th>
                            <td>${student.name}</td>
                        </tr>
                        <tr>
                            <th>性别</th>
                            <td>${student.gender}</td>
                        </tr>
                        <tr>
                            <th>学院</th>
                            <td>${student.college}</td>
                        </tr>
                        <tr>
                            <th>专业</th>
                            <td>${student.major}</td>
                        </tr>
                    </table>

                    <h3>请修改需要变更的信息</h3>
                    <p class="optional">（只填写需要修改的字段，不需要修改的留空）</p>
                    <div class="form-group">
                        <label for="newName">新姓名：</label><span class="current-value">（当前值：${student.name}）</span>
                        <input type="text" id="newName" name="newName" class="modified-field">
                    </div>
                    <div class="form-group">
                        <label for="newGender">新性别：</label><span class="current-value">（当前值：${student.gender}）</span>
                        <input type="text" id="newGender" name="newGender" class="modified-field">
                    </div>
                    <div class="form-group">
                        <label for="newCollege">新学院：</label><span class="current-value">（当前值：${student.college}）</span>
                        <input type="text" id="newCollege" name="newCollege" class="modified-field">
                    </div>
                    <div class="form-group">
                        <label for="newMajor">新专业：</label><span class="current-value">（当前值：${student.major}）</span>
                        <input type="text" id="newMajor" name="newMajor" class="modified-field">
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn-change">提交修改申请</button>
                        <button type="button" class="btn-query" onclick="location.href='updateInformation.jsp'">重新查询</button>
                    </div>
                </form>
            </c:if>
        </div>
    </div>
</body>
</html>