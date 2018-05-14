<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加课程成功提示</title>
     
    <script>
   		alert("${sessionScope.msg}");
    	window.location.href ='<%=basePath%>course_table.jsp';  	
     </script>    
  </head>
  
  <body>
  
  </body>
</html>
