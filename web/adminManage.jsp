<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.example.pgms.bean.Student" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>  <!-- 确保启用EL表达式 -->
<%-- 在 JSP 顶部添加调试代码 --%>
<%
    // 脚本方式检查属性
    Object studentsAttr = request.getAttribute("students");
    if(studentsAttr == null) {
        System.out.println("JSP: students 属性为 NULL");
    } else {
        List<Student> list = (List<Student>)studentsAttr;
        System.out.println("JSP 接收到学生数: " + list.size());
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>学生信息</title>
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

        .side_bar {
            width: 160px;
            background-color: white;
            box-shadow: var(--box-shadow);
            border-radius: 0 var(--border-radius) var(--border-radius) 0;
            padding: 20px 10px;
            position: fixed;
            top: 80px;
            left: 0;
            height: calc(100vh - 80px);
            overflow-y: auto;
            transition: var(--transition);
            z-index: 90;
        }
        .side_bar_button {
            background-color: var(--primary-color);
            color: white;
            padding: 12px;
            margin: 8px 0;
            border-radius: var(--border-radius);
            text-align: center;
            cursor: pointer;
            transition: var(--transition);
            font-weight: 500;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .side_bar_button:hover {
            background-color: var(--secondary-color);
            transform: translateX(5px);
        }

        .center_bar {
            display: block;
            animation: fadeIn 0.5s ease;
        }

        .content-section {
            display: block;
            padding: 20px;
            background-color: white;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            margin-bottom: 30px;
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
            display: block;
            background-color: white;
            padding: 30px;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            max-width: 800px;
            margin: 0 auto;
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
                margin-left: 160px;
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

            .side_bar {
                width: 100%;
                height: auto;
                position: static;
                display: flex;
                justify-content: space-around;
                padding: 10px;
                border-radius: 0;
                top: auto;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            }

            .side_bar_button {
                margin: 5px;
                padding: 8px;
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
        function queryStudentInfo() {
            window.location.href = 'studentQuery.jsp';
        }
        function reviewInfo() {
            window.location.href = 'PendingListServlet';
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
    <div class="side_bar">
        <div class="side_bar_button" onclick="queryStudentInfo()">查询学生信息</div>
        <div class="side_bar_button" onclick="reviewInfo()">审核修改申请</div>
    </div>
    <div class="center_bar">
        <div id="basic-info" class="content-section">
            <h2>学生信息列表</h2>
            <table class="info-table">
                <tr>
                    <th>学号</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>学院</th>
                    <th>专业</th>
                </tr>
                <c:forEach items="${requestScope.students}" var="student">
                    <tr>
                        <td>${student.studentID}</td>
                        <td>${student.name}</td>
                        <td>${student.gender}</td>
                        <td>${student.college}</td>
                        <td>${student.major}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
</body>
</html>
