<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加会员成功提示</title>
     
    <script>
    	alert('添加成功');
    	window.location.href ='<%=basePath%>vip_table.jsp';
     </script>    
  </head>
  
  <body>
  
  </body>
</html>
