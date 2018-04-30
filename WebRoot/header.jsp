<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">    
    <title>My JSP 'header.jsp' starting page</title>    
  </head>  
  <body>
    <!-- 顶部 开始-->
		<header class="am-topbar am-topbar-fixed-top">		
			<div class="am-topbar-left am-hide-sm-only">
                <a href="index.jsp" class="logo"><span>MeiSi健身<span></span></span><i class="zmdi zmdi-layers"></i></a>
           </div>	
			<div class="contain">
				<ul class="am-nav am-navbar-nav am-navbar-left">
					<li><h4 class="page-title" id="page-title">首&nbsp;&nbsp;页</h4></li>
				</ul>				
				<ul class="am-nav am-navbar-nav am-navbar-right">						
					<li class="inform user-img"><img src="assets/img/logo.png" alt="user-img" class="img-circle img-thumbnail img-responsive" /></li>
					<li ><a>欢迎你,${sessionScope.user.name}</a></li>
					<li class="hidden-xs am-hide-sm-only">
                        <form role="search" class="app-search">
                            <input type="text" placeholder="Search..." class="form-control">                            
                            <a href=""><span  class="am-icon-search m-t-0" /></a>                            
                        </form>
                    </li>
				</ul>
			</div>
		</header>
	<!-- 顶部 结束 -->
  </body>
</html>
