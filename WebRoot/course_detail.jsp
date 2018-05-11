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
								<form action="Course_UpdateCourse" method="post" class="am-form">
								  <fieldset>
								    <legend>添加新课程</legend>
								     <div class="form-group col-md-offset-4">
									    <div class="am-btn-group">						  
										  <div class="am-dropdown" data-am-dropdown>										
										  	<button id="SerchBtn" class="am-btn am-btn-secondary am-dropdown-toggle"  data-am-dropdown-toggle >查询</button>						  										    
										  </div>
										</div>
									    <div class="col-md-5">									    
									      <input id="SerchInput" type="text" class="form-control" id="serch" placeholder="请输入课程编号" />
									    </div>
									</div>
								    <div class="am-form-group am-u-sm-10 am-u-sm-offset-1">
								      <label >课程编号:</label>
								      <input name="courseId" id="courseId" type="number"  disabled />								      
								    </div>
								     <div class="am-form-group am-u-sm-10 am-u-sm-offset-1">
								      <label >课程名称:</label>
								      <input name="courseName" id="courseName" type="text"  placeholder="输入课程名称" required oninvalid="setCustomValidity('请输入课程名称);"/>
								    </div>																    															   												
								    <div class="am-form-group am-u-sm-10 am-u-sm-offset-1">
								      <label >课程介绍:</label>
								      <input name="courseIntro" type="text" id="courseIntro" placeholder="输入课程介绍" required oninvalid="setCustomValidity('请输入课程介绍');" />
								    </div>
								    <div class="am-form-group am-u-sm-10 am-u-sm-offset-1">
								     <label >课程时长(分钟):</label>
								      <input name="courseDuration" id="courseDuration" type="number"   placeholder="输入课程时长" required oninvalid="setCustomValidity('请输入课程介绍');" />
								    </div>	
								    <div class="am-form-group am-u-sm-10 am-u-sm-offset-1">
								      <label >课程类型:</label>
								      <input name="courseType" id="courseType" type="text"  disabled />								      
								    </div>	
								    <div class="am-form-group am-u-sm-10 am-u-sm-offset-1">
								      <label >授课教练:</label>
								      <input name="coachName" id="coachName" type="text"  disabled />								      
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
　　				$('#page-title').text('课程详情');
				
　　			}); 
		</script>
		<script>
			$('#SerchBtn').click(function(){
				if($('#SerchInput').val()==""){
				alert("请输入课程编号");
				}else{
					$.ajax({
				 	 type:"post",					 
					 url:"Course_meidaFindByID",
					 data:{
					 courseId:$('#SerchInput').val()
					 },
					 success:function(result){	
					 $('#SerchInput').val("");
					 if(result==null){
					 	alert('课程不存在，请查证');
					 }else{
					 	$('#courseId').val(result.courseId);
					 	$('#courseName').val(result.courseName.split("●")[0]);
					 	$('#courseIntro').val(result.courseIntro);
					 	$('#courseDuration').val(result.courseDuration/60);	
					 	$('#courseType').val(result.courseType);	
					 	$('#coachName').val(result.coach.coachName);	                      	
					 }										 							  				 					 			        			   	        			 		        			    		        			         			    
    				}
   				});
				}					 									
			});
		</script>	
		
		
</html>
