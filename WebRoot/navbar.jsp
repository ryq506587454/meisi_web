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
			 <ul class="am-list admin-sidebar-list" >
			    <li><a href="index.jsp"><span class="am-icon-home"></span> 首页</a></li>
			    <li>
			      <a class="am-cf" data-am-collapse="{target: '#collapse-nav1'}"><span class="am-icon-bell" />&nbsp;&nbsp;通知管理<span class="am-icon-angle-right am-fr am-margin-right" /></a>
			      <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav1" >
			        <li><a href="add_notice.jsp">发布公告</a></li>			       
			        <li><a href="notice_table.jsp">公告列表</a></li>			       			       
			      </ul>
			    </li>
			    <li>
			      <a class="am-cf" data-am-collapse="{target: '#collapse-nav2'}"><span class="am-icon-group" />&nbsp;&nbsp;会员管理<span class="am-icon-angle-right am-fr am-margin-right" /></a>
			      <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav2" >
			        <li><a href="vip_table.jsp">会员列表</a></li>			       
			        <li><a href="add_vip.jsp">添加会员</a></li>
			        <li><a href="vip_detail.jsp">查看/修改会员详情</a></li>					       
			      </ul>
			    </li>
			    <li>
			      <a class="am-cf" data-am-collapse="{target: '#collapse-nav3'}"><span class="am-icon-trophy" />&nbsp;&nbsp;教练管理 <span class="am-icon-angle-right am-fr am-margin-right" /></a>
			      <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav3" >
			      	<li><a href="coach_table.jsp">教练列表</a></li>		      
			     	<li><a href="add_Coach.jsp">添加教练</a></li>	
			     	<li><a href="coach_detail.jsp">查看/修改教练详情</a></li>		      						       
			      </ul>
			    </li>
			    <li>
			      <a class="am-cf" data-am-collapse="{target: '#collapse-nav4'}"><span class="am-icon-pencil" />&nbsp;&nbsp;课程管理 <span class="am-icon-angle-right am-fr am-margin-right" /></a>
			      <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav4">
			         <li><a href="course_table.jsp">课程列表</a></li>
			         <li><a href="add_course.jsp">增加课程</a></li>			       
			         <li><a href="plan_course.jsp">安排课程</a></li>
			         <li><a href="">查看课程开课时间</a></li>	
			         <li><a href="course_detail.jsp">查看/修改课程详情</a></li>					         	       				        		        		        						       
			      </ul>
			      <a class="am-cf" data-am-collapse="{target: '#collapse-nav5'}"><span class="am-icon-table" />&nbsp;&nbsp;预约管理 <span class="am-icon-angle-right am-fr am-margin-right" /></a>
			      <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav5">
			      	 <li><a href="appt_table.jsp">预约统计</a></li>
			      	 <li><a href="appt_detail.jsp">查看/修改预约详情</a></li>					
			      </ul>
			    </li>			  
			  </ul>
			</div>
		  </div>
	<!-- 左侧导航结束  -->	
	
   	
  </body>
</html>
