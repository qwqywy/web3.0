<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>日志查看器</title>
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

        .no-permission {
            color: red;
            font-size: 18px; /* 调整字体大小 */
            font-weight: bold;
        }
        pre {
            background-color: #fff;
            border: 1px solid #ccc;
            padding: 15px;
            border-radius: 5px;
            overflow: auto;
            white-space: pre-wrap; /* 支持自动换行 */
            word-wrap: break-word; /* 支持长单词换行 */
            max-height: 500px; /* 设置最大高度，并允许滚动 */
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
            for(let i=1; i<=2; i++) {
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
    <a href="login.jsp">退出登录</a>
</div>
<div class="container">
    <div class="side_bar">
        <div class="side_bar_button" onclick="showContent('logViewer')">日志查看器</div>
    </div>
    <div id="logViewer" class="center_bar active">
        <h1>日志查看器</h1>
        <pre>
    <%
        try {
            // 指定日志文件路径
            String logFilePath = "E:\\IDEA_code\\web2.0\\log.txt";
            java.io.BufferedReader reader = new java.io.BufferedReader(new java.io.FileReader(logFilePath));
            String line;
            out.println("<br>");
            while ((line = reader.readLine()) != null) {
                out.println(line + "<br>");
            }
            reader.close();
        } catch (Exception e) {
            out.println("<span class='error'>读取日志文件时出错: " + e.getMessage() + "</span>");
        }
    %>
</pre>
    </div>
    <div id="studentInfo" class="center_bar">
        <h1>学籍信息</h1>
        <!-- 这里可以添加学籍信息相关的内容 -->
        <div class="tabs">
            <a href="#" class="active" id="tab1" onclick="showSection('basicInfo', 'tab1')">基本信息</a>
            <a href="#" id="tab2" onclick="showSection('academicRecords', 'tab2')">学术记录</a>
        </div>
        <div id="basicInfo" class="content-section active">
            <h2>基本信息</h2>
            <p class="no-permission">无权限查看</p>
        </div>
        <div id="academicRecords" class="content-section">
            <h2>学术记录</h2>
            <p class="no-permission">无权限查看</p>
        </div>
    </div>
</div>
</body>
</html>
