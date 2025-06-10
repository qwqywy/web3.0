<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>教务领导查询学生信息</title>
    <%--    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">--%>
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
            /*display: none;*/
            /*background-color: white;*/
            /*padding: 30px;*/
            /*border-radius: var(--border-radius);*/
            /*box-shadow: var(--box-shadow);*/
            /*max-width: 800px;*/
            /*margin: 0 auto;*/

            width: 400px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            padding: 40px;
            margin: 10px;
        }
        .form-section h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
        .query-form input,
        .btn{
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
        .alert {
            margin-top: 20px;
            color: var(--danger-color);
        }
        .btn {
            color: white;
        }
        .btn-query {
            background-color: var(--primary-color);
        }
        .btn-change {
            background-color: var(--warning-color);
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
    <div class="form-section">
        <h2>查询学生信息</h2>
        <form class="query-form" action="searchStudent" method="get" id="searchForm">
            <label for="studentID">学号</label>
            <input type="text" id="studentID" name="studentID" required>
            <label for="name">姓名</label>
            <input type="text" id="name" name="name" required>
            <button type="submit" class="btn btn-query">查询</button>
        </form>

        <!-- 修改按钮 -->
        <button onclick="submitForm()" class="btn btn-change">修改</button>

        <c:if test="${errorMessage}">
            <div class="alert">
                    ${errorMessage}
            </div>
        </c:if>

        <script>
            function submitForm() {
                var studentID = document.getElementById("studentID").value;
                var name = document.getElementById("name").value;
                window.location.href = "QueryChangeServlet?studentID=" + studentID + "&name=" + name;
            }
        </script>
    </div>
</div>
</body>
</html>
