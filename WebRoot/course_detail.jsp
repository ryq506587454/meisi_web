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
								<form action="Course_AddCourse" method="post" class="am-form">
								  <fieldset>
								    <legend>添加新课程</legend>
								    <div class="am-form-group am-u-sm-10 am-u-sm-offset-1">
								      <label >课程编号:</label>
								      <input name="courseId" id="courseId" type="number"  placeholder="输入课程编号" required oninvalid="setCustomValidity('请输入课程编号);"/>
								      <h4 id="msg"></h4>
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
								      <input name="courseDuration" type="number"   placeholder="输入课程时长" required oninvalid="setCustomValidity('请输入课程介绍');" />
								    </div>																	   																    								
								    <div class="am-form-group am-u-sm-10 am-u-sm-offset-1" >
								      <label for="doc-select-1">课程类型</label>
								      <select name="courseType"  id="select" required />
								      	<option  >请选择</option>								        
								        <option  value="瘦身">瘦身</option>
								        <option  value="增肌">增肌</option>
								        <option  value="塑形">塑形</option>
								        <option  value="瑜伽">瑜伽</option>
								      </select>
								      <span class="am-form-caret"></span>
								    </div>	
								    <div class="am-form-group am-u-sm-10 am-u-sm-offset-1" >
								      <label for="doc-select-1">授课教练</label>
								      <select name="coachId" id="coach" required oninvalid="setCustomValidity('请选择课程类别后选择合适教练');"/>								        								        
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
　　				$('#page-title').text('添加课程');
				
　　			}); 
		</script>
		<script type="text/javascript">
		$('#select').change(function(){
			$.ajax({
				 	 type:"post",					 
					 url:"User_FindCoachByType",
					 data:{	
					 	courseType:	$(this).val()				 
					 },
					 success:function(result){						 
        			    $("#coach").empty();	        			      
        			    $.each(result.list,function (index,coach){		        			    	                  		                        		                        
	                        $("#coach").append(
	                       '<option  value="'+coach.coachId+'">'+coach.coachName+'</option>'	                                                           
	                        ); 		                        
	                    });      			    
    				}
   				});
			})			
		</script>
		<script>
			$('#courseId').blur(function(){	
				var value = $(this).val().length;				
				if(value==" "){				
				}else{
						$.ajax({
						 	 type:"post",					 
							 url:"Course_CheckCourseTwo",
							 data:{
								courseId:$('#courseId').val()
							 },
							 success:function(result){
							 if(result=="1"){
							 		$('#sub').attr("disabled", true);	
							 		$('#msg').text('该课程号已被注册');	
							 		$('#msg').css({color:"red"});	
							 	}else{
							 		$('#sub').attr("disabled", false);	
							 		$('#msg').text('该课程号可以注册');
							 		$('#msg').css({color:"green"});	
							 	}						 				 					 		        			   	        			 		        			    		        			         			    
		    				 }
	    				});	
					}																		  								
				});
		</script>
</html>
