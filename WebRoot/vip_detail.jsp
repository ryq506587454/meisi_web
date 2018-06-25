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
								<form action="User_UpdateUser" method="post" class="am-form">
								  <fieldset>
								    <legend>查看/修改用户信息</legend>								   
								    <div class="form-group col-md-offset-4">
									    <div class="am-btn-group">						  
										  <div class="am-dropdown" data-am-dropdown>										
										  	<button id="SerchBtn" class="am-btn am-btn-secondary am-dropdown-toggle"  data-am-dropdown-toggle >查询</button>						  										    
										  </div>
										</div>
									    <div class="col-md-5">									    
									      <input id="SerchInput" type="text" class="form-control" id="serch" placeholder="请输入会员号" />
									    </div>
									</div>
									<div class="am-form-group am-u-sm-10 am-u-sm-offset-1">
								      <label >用户会员号： </label>
								      <input name="userId" type="number"  id="userId"  disabled />								      
								     </div>
								    <div class="am-form-group am-u-sm-10 am-u-sm-offset-1">
								      <label >用户姓名：</label>
								      <input name="name" type="text" id="name" required oninvalid="setCustomValidity('不能为空');"/>
								    </div>
								    <div class="am-form-group am-u-sm-10 am-u-sm-offset-1">
								      <label >用户手机号： </label>
								      <input name="tel" type="number"   id="tel" minlength="11"  required oninvalid="setCustomValidity('不能为空');"/>
								     <h4 id="msg"></h4>
								    </div>																    							
								    <div class="am-form-group am-u-sm-10 am-u-sm-offset-1">
								      <label >用户登陆密码：</label>
								      <input name="password" type="number"  id="password" required oninvalid="setCustomValidity('不能为空');"/>
								    </div>	
								     <div class="am-form-group am-u-sm-10 am-u-sm-offset-1">
								      <label >用户身份证号：</label>
								      <input name="identity" type="number"  id="identity" minlength="18" required oninvalid="setCustomValidity('不能为空');" />
								    </div>								
								    																   																  																   
								    <div class="am-form-group am-u-sm-7">
								    	<button id="sub" class="am-btn am-btn-secondary  am-u-sm-3" type="submit">修改</button>
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
　　				$('#page-title').text('查看修改用户信息');
				if("${!empty sessionScope.userId}"){
					$.ajax({
				 	 type:"post",					 
					 url:"User_FindById",
					 data:{
					 userId:"${sessionScope.userId}"
					 },
					 success:function(result){
					 $('#SerchInput').val("");						
					 	$('#userId').val(result.userId);
					 	$('#tel').val(result.tel);
					 	$('#password').val(result.password);	
					 	$('#identity').val(result.identity);	
					 	$('#name').val(result.name);													 							  				 					 			        			   	        			 		        			    		        			         			    
    				}
   				});
				}
　　			}); 
			$('#SerchBtn').click(function(){
			if($('#SerchInput').val()==""){
				alert("请输入教练编号");
				}else{		
				 $.ajax({
				 	 type:"post",					 
					 url:"User_FindById",
					 data:{
					 userId:$('#SerchInput').val()
					 },
					 success:function(result){
					 $('#SerchInput').val("");	
					 if(result==null){
					 alert('用户不存在，请查证');
					 }else{
					 	$('#userId').val(result.userId);
					 	$('#tel').val(result.tel);
					 	$('#password').val(result.password);	
					 	$('#identity').val(result.identity);	
					 	$('#name').val(result.name);
					 }					
					 							  				 					 			        			   	        			 		        			    		        			         			    
    				}
   				});	
   				}								
			});
		</script>
</html>
