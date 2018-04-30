<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="assets/css/login.css"/>
</head>
	<body>
	    <div id="login">
	        <h1>美思健身管理系统</h1>
	        <form action="User_login" method="post" >
	            <input type="text" required oninvalid="setCustomValidity('请输入账号');" placeholder="用户名" name="userId"></input>
	            <input type="password" required oninvalid="setCustomValidity('请输入密码');" placeholder="密码" name="Password"></input>
	            <button class="butt" type="submit">登录</button>
	        </form>
	    </div>
	</body>
</html>