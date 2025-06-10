<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>更改用户角色</title>
<%--    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">--%>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
        .form-section label {
            display: block;
            margin: 15px 0 5px;
            font-weight: 500;
            color: var(--dark-color);
        }

        .form-section input,
        .form-section select {
            width: 100%;
            transition: var(--transition);
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 14px;
        }

        .form-section input:focus,
        .form-section select:focus {
            border-color: var(--primary-color);
            box-shadow: var(--box-shadow);
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
                padding: 15px;
            }
        }
        @media (max-width: 576px) {
            .header #xtmc {
                font-size: 1.2rem;
            }
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
    <script type="text/javascript">
        window.onload = function() {
            var changeRoleSuccess = <%= request.getAttribute("changeRoleSuccess") %>;
            if (changeRoleSuccess != null) {
                if (changeRoleSuccess) {
                    alert("角色修改成功！");
                } else {
                    alert("角色修改失败！");
                }
            }
        };
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
            <h2>更改用户角色</h2>
            <form class="change-form" action="ChangeRoleServlet" method="post">
                <label for="userid">账号：</label>
                <input type="text" class="form-control" id="userid" name="userid" required>

                <label for="newRole">新角色：</label>
                <select class="form-control" id="newRole" name="newRole" required>
                    <option value="研究生">研究生</option>
                    <option value="外校讲师">外校讲师</option>
                    <option value="研究生院领导">研究生院领导</option>
                    <option value="学校领导">学校领导</option>
                    <option value="学院研究生秘书">学院研究生秘书</option>
                    <option value="学院领导">学院领导</option>
                    <option value="研究生院管理员">研究生院管理员</option>
                    <option value="系统管理员">系统管理员</option>
                    <option value="审计管理员">审计管理员</option>
                </select>

                <button type="submit">提交更改</button>
            </form>
        </div>
    </div>
</body>
</html>