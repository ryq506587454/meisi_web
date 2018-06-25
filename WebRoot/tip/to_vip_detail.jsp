<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加教练成功提示</title>
     
    <script>
    	window.location.href ='<%=basePath%>vip_detail.jsp';
     </script>    
  </head>
  
  <body>
  
  </body>
</html>
