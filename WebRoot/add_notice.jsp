<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML >
<html>
 <head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>美思健身管理系统</title>
		<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
		<link rel="stylesheet" href="assets/css/amazeui.css" />				
		<link rel="stylesheet" href="assets/css/core.css" />
		<link rel="stylesheet" href="assets/css/menu.css" />				
		<link rel="stylesheet" href="assets/css/admin.css" />	
		<link rel="stylesheet" href="assets/css/component.css" />
		<!-- 消除number类型数据的小三角 -->
		<style>
    		input::-webkit-outer-spin-button,
    		input::-webkit-inner-spin-button {
       			-webkit-appearance: none;
    		}
    		input[type="number"]{
    	    -moz-appearance: textfield;
   		 }
		</style>		
	</head>
	<body >		
		<!-- 顶部 开始-->
		<%@ include file="header.jsp" %>
		<!-- 顶部 结束 -->		
		<!-- 主体 开始 -->
		<%@ include file="navbar.jsp" %>	  
  		<!-- 左侧导航结束 -->			
		<!-- ============================================================== -->
		<!-- 主体开始 -->
			<div class="content-page">
			<!-- Start content -->
			<div class="content">
				<div class="am-container" >
					<!-- Row start -->
						<div class="am-u-sm-12">
							<div class="card-box">								
								<form action="Notice_AddNotice" method="post" class="am-form">
								  <fieldset>
								    <legend>发布公告</legend>
								    <div class="am-form-group am-u-sm-10 am-u-sm-offset-1">
								      <label >公告标题:</label>
								      <input name="title" id="title" type="text"  placeholder="输入公告标题" required oninvalid="setCustomValidity('请输入公告标题);"/>
								      <h4 id="msg"></h4>
								    </div>								    									    
								    <div class="am-form-group am-u-sm-10 am-u-sm-offset-1">
								      <label >公告内容：</label>
								      <textarea name="noticeDetail" rows="10" placeholder="输入公告内容" required oninvalid="setCustomValidity('请输入公告内容);"></textarea>
								    </div>								    															    															   																			    																	   																    															    									    
								    <div class="am-form-group am-u-sm-7">
								    	<button id="sub" class="am-btn am-btn-secondary  am-u-sm-3" type="submit">提交</button>
								    </div>													    															    								    
								  </fieldset>
								</form>																
							</div>
						</div>
					<!-- Row end -->
				</div>												
			</div>
		</div>
		<a href="admin-offcanvas" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"><!--<i class="fa fa-bars" aria-hidden="true"></i>--></a>    	
  </body>
  		<script type="text/javascript" src="assets/js/jquery-2.1.0.js" ></script>
		<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="assets/js/amazeui.min.js"></script>
		<script>
			$(function(){ 
　　				$('#page-title').text('发布公告');		
　　			}); 
		</script>	
</html>
