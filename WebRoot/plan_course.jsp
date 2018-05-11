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
								<form  class="am-form">
								  <fieldset>
								    <legend>安排课程</legend>
								     <div class="am-form-group am-u-sm-10 am-u-sm-offset-1">
								      <label >课程编号:</label>
								      <input name="courseId" id="courseId" type="number"  placeholder="输入课程编号" required oninvalid="setCustomValidity('输入课程编号);"/>
								    </div>	
								    <div class="am-form-group am-u-sm-10 am-u-sm-offset-1">
								      <label >课程名称:</label>
								      <input name="courseName" id="courseName" type="text" disabled  />								     
								    </div>					   									  
								    <div class="am-form-group am-u-sm-10 am-u-sm-offset-1" >
								      <label >上课日期:</label>
								      <input name="courseDate" id="courseDate" type="date"  placeholder="输入上课日期" required oninvalid="setCustomValidity('请输入上课日期);"/>
								    </div>
								    
									<div class="am-form-group am-u-sm-10 am-u-sm-offset-1" >
								      <label >上课时间:</label>
								      <input name="courseTime" id="courseTime" type="time"  placeholder="输入上课时间" required oninvalid="setCustomValidity('请输入上课时间);"/>
								    </div>						   															    															   																			    																	   																    																								    
								    <div class="am-form-group am-u-sm-7" >
								    	<button id="sub" class="am-btn am-btn-secondary  am-u-sm-3">提交</button>
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
　　				$('#page-title').text('安排课程');						
　　			}); 
		</script>
		<script>
			$('#courseId').blur(function(){				
				$.ajax({
				 	 type:"post",					 
					 url:"Course_meidaFindByID",
					 data:{
					 	courseId:$('#courseId').val()
					 },
					 success:function(result){	
					 console.log(result);
					 if(result==null){
					 	alert('课程编号错误，请查证');	
					 	$('#courseId').empty();
					 	$('#sub').attr("disabled", true);	
					 }else{
					 	$('#courseName').val(result.courseName);
					 	$('#sub').attr("disabled", false);						 		
					 }					
					 							  				 					 			        			   	        			 		        			    		        			         			    
    				}
   				});			
			});
		</script>
		<script>
			$('#sub').click(function(){														
				 $.ajax({
				 	 type:"post",					 
					 url:"Course_PlanCourse",
					 data:{
					 	courseId:$('#courseId').val(),
					 	courseDate:$('#courseDate').val(),
					 	courseTime:	$('#courseTime').val()
					 },
					 success:function(result){
					 console.log(result);
					 	if(result=="1"){
					 		alert('添加成功');
					 	}else if(result=="3"){
					 		alert('添加失败,该时间段已有该课程');
					 	}						  				 					 			        			   	        			 		        			    		        			         			    
    				}
   				});							
			});		 
		</script>
		
			
</html>
