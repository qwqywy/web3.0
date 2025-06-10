<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>  <!-- 确保启用EL表达式 -->

<html>
<head>
    <title>待审核学生列表</title>
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
            transition: var(--transition);
        }
        .container h1 {
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
            text-align: center;
            padding: 10px;
        }
        .btn-agree,
        .btn-refuse {
            width: 130px;
            margin: 0 10px;
            text-align: center;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 15px;
        }
        .btn-agree {
            background-color: var(--success-color);
        }
        .btn-agree:hover {
            background-color: #249c56;
        }
        .btn-refuse {
            background-color: var(--danger-color);
        }
        .btn-refuse:hover {
            background-color: #cf4537;
        }
        .btn-back {
            display: block;
            width: 150px;
            margin: 80px auto;
            text-align: center;
            background-color: var(--primary-color);
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
        }
        .btn-back:hover {
            background-color: var(--secondary-color);
        }
    </style>
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
    <h1>待审核学生列表</h1>
    <table>
        <tr>
            <th>ID</th>
            <th>学生ID</th>
            <th>姓名</th>
            <th>性别</th>
            <th>学院</th>
            <th>专业</th>
            <th>申请操作</th>
            <th>申请状态</th>
            <th>申请时间</th>
            <th>操作</th>
        </tr>
        <c:forEach var="pendingStudent" items="${pendingStudents}">
            <tr>
                <td>${pendingStudent.id}</td>
                <td>${pendingStudent.studentID}</td>
                <td>${pendingStudent.name}</td>
                <td>${pendingStudent.gender}</td>
                <td>${pendingStudent.college}</td>
                <td>${pendingStudent.major}</td>
                <td>${pendingStudent.operationType}</td>
                <td>${pendingStudent.status}</td>
                <td>${pendingStudent.submitTime}</td>
                <td style="width: 400px">
                    <form action="ReviewServlet" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="${pendingStudent.id}">
                        <input type="hidden" name="action" value="APPROVE">
                        <button type="submit" class="btn-agree">批准</button>
                    </form>
                    <form action="ReviewServlet" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="${pendingStudent.id}">
                        <input type="hidden" name="action" value="REJECT">
                        <button type="submit" class="btn-refuse">拒绝</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
    <a href="<c:url value="/ReviewViewServlet"/>" class="btn-back">返回首页</a>
</div>
</body>
</html>