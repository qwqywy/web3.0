<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <title>操作结果</title>
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

    .section {
      display: block;
      background-color: white;
      padding: 30px;
      border-radius: var(--border-radius);
      box-shadow: var(--box-shadow);
      max-width: 600px;
      margin: 80px auto;
      animation: fadeIn 0.5s ease;
    }
    .section h1 {
      text-align: center;
      margin-bottom: 30px;
      color: var(--primary-color);
    }
    .section p {
      text-align: center;
      font-size: 18px;
      margin-bottom: 30px;
    }

    .btn-back {
        display: block;
        width: 150px;
        margin: auto;
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
    <div class="section">
        <h1>操作结果</h1>
        <p>学号: ${studentID} 的申请已提交，等待研究生院管理员审核。</p>
        <p style="color: var(--success-color);">${message}</p>
        <p style="color: var(--danger-color);">${error}</p>
        <a href="adminManage.jsp" class="btn-back">返回首页</a>
    </div>
</div>
</body>
</html>
