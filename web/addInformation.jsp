<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>学籍信息</title>
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
    .form-section select {
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
    .form-section select:focus {
      border-color: var(--primary-color);
      box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
      outline: none;
    }

    .form-section input[type="text"] {
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
  <div class="center_bar">
    <div class="form-section">
      <h2>添加学生信息</h2>
      <form class="change-form" action="SubmitStudentServlet" method="post">
        <input type="hidden" name="operationType" value="ADD">

        <label for="studentID">学号</label>
        <input type="text" id="studentID" name="studentID">

        <label for="name">姓名</label>
        <input type="text" id="name" name="name">

        <label for="gender">性别</label>
        <select id="gender" name="gender">
          <option value="男">男</option>
          <option value="女">女</option>
        </select>

        <label for="college">学院</label>
        <input type="text" id="college" name="college">

        <label for="major">专业</label>
        <input type="text" id="major" name="major">

        <button type="submit">提交添加申请</button>
      </form>
    </div>
  </div>
</div>
</body>
</html>
