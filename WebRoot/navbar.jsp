<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    	<meta charset="utf-8" />    
    <title>e</title>
  </head>
  
  <body>
  	<!-- 左侧导航开始 -->	
	<div class="admin-sidebar am-offcanvas am-padding-0" id="admin-offcanvas" style="margin-top: 15px;">
	    <div class="am-offcanvas-bar admin-offcanvas-bar p-b-30" style="width: 251px; border-right: 1px solid gainsboro;">	
	    	<div class="user-box am-hide-sm-only">
	                     <div class="user-img">
	                         <img src="assets/img/logo.png" alt="user-img" title="Mat Helme" class="img-circle img-thumbnail img-responsive">	                           
	                     </div>
	                     <h3><a href="index.jsp">美思健身房</a></h3>	                        
	                 </div>
			 <ul class="am-list admin-sidebar-list" >
			    <li><a href="index.jsp"><span class="am-icon-home"></span> 首页</a></li>
			    <li>
			      <a class="am-cf" data-am-collapse="{target: '#collapse-nav1'}"><span class="am-icon-table" />&nbsp;&nbsp;会员管理 <span class="am-icon-angle-right am-fr am-margin-right" /></span></a>
			      <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav1" >
			        <li><a href="vip_table.jsp">会员列表</a></li>
			        <li><a href="add_vip.jsp">添加会员</a></li>
			        <li><a href="">添加教练</a></li>
			        <li><a href="">会员充值</a></li>						       
			      </ul>
			    </li>
			    <li>
			      <a class="am-cf" data-am-collapse="{target: '#collapse-nav2'}"><span class="am-icon-pencil" />&nbsp;&nbsp;课程管理 <span class="am-icon-angle-right am-fr am-margin-right" /></a>
			      <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav2">
			        <li><a href="course_table.jsp">课程列表</a></li>
			        <li><a href="appt_detail.jsp">预约详情</a></li>	
			        <li><a href="add_course.jsp">增加课程</a></li>	
			        <li><a href="">安排课程</a></li>				        		        		        						       
			      </ul>
			    </li>			  
			  </ul>
			</div>
		  </div>
	<!-- 左侧导航结束  -->	
	
   	
  </body>
</html>
