<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>更新课程信息成功提示</title>
     
    <script>
    	alert('更新成功');
    	window.location.href ='<%=basePath%>course_detail.jsp';
     </script>    
  </head>
  
  <body>
  
  </body>
</html>
