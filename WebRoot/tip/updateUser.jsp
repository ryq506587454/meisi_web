<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'quite.jsp' starting page</title>
     
    <script>
    	alert('更新成功');
    	window.location.href ='<%=basePath%>vip_detail.jsp';
     </script>    
  </head>
  
  <body>
  
  </body>
</html>
