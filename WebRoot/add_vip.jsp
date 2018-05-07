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
	</head>
	<body>		
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
								<form action="User_addUser" method="post" class="am-form">
								  <fieldset>
								    <legend>添加新用户</legend>
								    <div class="am-form-group am-u-sm-10 am-u-sm-offset-1">
								      <label >用户手机号： </label>
								      <input name="userId" type="tel" onkeypress="return event.keyCode>=48&&event.keyCode<=57" ng-pattern="/[^a-zA-Z]/"  id="userId" minlength="11" placeholder="输入用户手机号" required oninvalid="setCustomValidity('请用户输入正确手机号');"/>
								     <h4 id="msg"></h4>
								    </div>																    							
								    <div class="am-form-group am-u-sm-10 am-u-sm-offset-1">
								      <label >用户登陆密码：</label>
								      <input name="password" type="text" onkeypress="return event.keyCode>=48&&event.keyCode<=57" ng-pattern="/[^a-zA-Z]/"  id="password" placeholder="输入用户登录密码" required oninvalid="setCustomValidity('请输入用户登录密码');"/>
								    </div>	
								     <div class="am-form-group am-u-sm-10 am-u-sm-offset-1">
								      <label >用户身份证号：</label>
								      <input name="identity" type="text" onkeypress="return event.keyCode>=48&&event.keyCode<=57" ng-pattern="/[^a-zA-Z]/"  id="password" minlength="18" placeholder="输入用户身份证作为找回标识" required oninvalid="setCustomValidity('请用户输入正确的身份证号');"/>
								    </div>								
								    <div class="am-form-group am-u-sm-10 am-u-sm-offset-1">
								      <label >用户姓名：</label>
								      <input name="name" type="text" id="name" placeholder="用户输入用户名称" required oninvalid="setCustomValidity('请输入用户的姓名');" />
								    </div>																   								
								    <div class="am-form-group am-u-sm-10 am-u-sm-offset-1">
								      <label>性别： </label>
								      <label class="am-radio-inline">
								        <input type="radio"  name="sex" value="男" required> 男
								      </label>
								      <label class="am-radio-inline">
								        <input type="radio" name="sex" value="女" > 女
								      </label>								     
								    </div>								
								    <div class="am-form-group am-u-sm-10 am-u-sm-offset-1" >
								      <label for="doc-select-1">会员卡类型</label>
								      <select name="select"  id="doc-select-1" required oninvalid="setCustomValidity('请选择会员类型');"/>								        
								        <option  value="普通会员">普通会员</option>
								        <option  value="高级会员">高级会员</option>
								      </select>
								      <span class="am-form-caret"></span>
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
　　				$('#page-title').text('添加会员');
　　			}); 
		</script>
		<script>
			$('#userId').blur(function(){	
				var value = $(this).val().length;				
				if(value!=11){				
				}else{
						$.ajax({
						 	 type:"post",					 
							 url:"User_CheckUserTwo",
							 data:{
								userId:$('#userId').val()
							 },
							 success:function(result){
							 if(result=="1"){
							 		$('#sub').attr("disabled", true);	
							 		$('#msg').text('该手机号已被注册');	
							 		$('#msg').css({color:"red"});	
							 	}else{
							 		$('#sub').attr("disabled", false);	
							 		$('#msg').text('该手机号可以注册');
							 		$('#msg').css({color:"green"});	
							 	}						 				 					 		        			   	        			 		        			    		        			         			    
		    				 }
	    				});	
					}																		  								
				});
		</script>
</html>
