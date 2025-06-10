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
      transition: var(--transition);
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

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(10px); }
      to { opacity: 1; transform: translateY(0); }
    }
  </style>
  <script>
    function queryStudentInfo() {
      window.location.href = 'studentQuery.jsp';
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
