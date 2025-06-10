<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>修改密码</title>
    <style>
        .message {
            text-align: center;
            color: red;
        }
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
        .changePsw-form input {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 14px;
        }
        .changePsw-form input[type="text"]:focus {
            border-color: var(--primary-color);
            box-shadow: var(--box-shadow);
        }
        .changePsw-form input[type="submit"] {
            background-color: var(--primary-color);
            border: none;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .changePsw-form input[type="submit"]:hover {
            background-color: var(--secondary-color);
        }
    </style>
    <script>
        function validateForm() {
            var newPassword = document.getElementById("newPassword").value;
            var confirmPassword = document.getElementById("confirmPassword").value;
            var message = "";

            var passwordPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=!*()_.,?/\\-]).{8,}$/;

            if (!passwordPattern.test(newPassword)) {
                message = "新密码必须长度 8 位以上，包含数字、大小写字母和特殊字符";
            } else if (newPassword !== confirmPassword) {
                message = "新密码和确认密码不匹配！";
            }

            if (message !== "") {
                document.getElementById("error-message").innerText = message;
                return false;
            }
            return true;
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
        <h2>修改密码</h2>
        <form action="ChangePasswordServlet" method="post" class="changePsw-form" onsubmit="return validateForm()">
            <label for="currentPassword">当前密码:</label>
            <input type="password" id="currentPassword" name="currentPassword" required>
            <label for="newPassword">新密码:</label>
            <input type="password" id="newPassword" name="newPassword" placeholder="新密码必须长度 8 位以上，包含数字、大小写字母和特殊字符" required>
            <%--                <div class="hint">新密码必须长度 8 位以上，包含数字、大小写字母和特殊字符</div>--%>
            <label for="confirmPassword">确认新密码:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required>
            <input type="submit" name="submit" value="提交"/>
        </form>
        <div class="message" id="error-message">
            <%
                String message = (String) request.getAttribute("message");
                if (message != null) {
                    out.print(message);
                }
            %>
        </div>
    </div>
</div>
</body>
</html>
