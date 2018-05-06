<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
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
		<!-- 表格开始 -->
		<div class="content-page">
			<div class="content">
				<div class="card-box">
					<div class="form-group row">
					    <div class="am-btn-group">
						  <button  class="am-btn am-btn-secondary" disable="true">选择搜索条件</button>
						  <div class="am-dropdown" data-am-dropdown>
						    <button class="am-btn am-btn-secondary am-dropdown-toggle" data-am-dropdown-toggle > <span class="am-icon-caret-down"></span></button>
						    <ul class="am-dropdown-content" id="select">
						      <li class="am-dropdown-header">条件</li>
						      <li><a href="javascript:;" data-flag="All">全部课程</a></li>
						      <li><a href="javascript:;" data-flag="courseId">根据课程编号查询</a></li>
						      <li><a href="javascript:;" data-flag="courseName">根据课程名称查询</a></li>
						      <li><a href="javascript:;" data-flag="courseType">根据课程类型查询</a></li>	
						      <li><a href="javascript:;" data-flag="courseDuration">根据课程时长查询</a></li>							      
						    </ul>
						  </div>
						</div>
					    <div class="col-md-5">
					      <input id="SerchInput" type="text" class="form-control" id="serch" placeholder="请输入搜索内容。。">
					    </div>
					 </div>
					<div class="am-g">
				        <div class="row" style="padding:0 10px ;">
				        	<table class="table table-condensed text-center">
							  <caption><h2>课程列表</h2></caption>
							  <thead>
							    <tr>
							      <th class="col-md-2 text-center" >课程编号</th>
							      <th class="col-md-2 text-center" >课程名称</th>							    
							      <th class="col-md-2 text-center am-hide-sm-only" >课程类型</th>
							      <th class="col-md-2 text-center" >课程时长</th>
							      <th class="col-md-2 text-center am-hide-sm-only" >已报人数</th>							     
								  <th class="col-md-2 text-center am-hide-sm-only" >操作</th>
							    </tr>
							  </thead>
							  	<tbody id="tbody">							 	 						    
								</tbody>
							</table>				          
				        </div>
      					</div>					  			  
					</div>																
				</div>			
			</div>
		</div>
		<!-- 表格结束 -->		
		</div>
		</div>		
		<a href="admin-offcanvas" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>		
		<script type="text/javascript" src="assets/js/jquery-2.1.0.js" ></script>
		<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="assets/js/amazeui.min.js"></script>
		<script>
			$(function(){ 
			console.log("111")
　　				$('#page-title').text('课程列表');
					$.ajax({
					 	 type:"post",					 
						 url:"Course_FindAllCourse",
						 data:{						 
						 },
						 success:function(result){						 
	        			    $("#tbody").empty();
	        			    $.each(result,function (index,course){		                       		                        		                        
		                        $("#tbody").append(
		                        '<tr><td >'+course.courseId+'</td>'+
							      '<td>'+course.courseName+'</td>'+
							      '<td class="am-hide-sm-only">'+course.courseType+'</td>'+
							      '<td>'+course.courseDuration/60/60+'小时</td>'+
							      '<td class="am-hide-sm-only">'+course.totalNumber+'</td>'+							      		     							    						    
							      '<td class="am-hide-sm-only"><button type="button" class="am-btn am-btn-default"><span class="am-icon-trash-o"></span> 删除</button></td>'+						     
							    '</tr>'		                            
		                        );		                        
		                    });      			    
	    				}
    				});　　　　		 	
　　				}); 
		</script>
		<script>
			$(function(){
				$('#select a').click(function(){					
					var flag  = $(this).data("flag");
						console.log($('#SerchInput').val());  
					 $.ajax({
					 	 type:"post",					 
						 url:"Course_meidaFindByFlag",
						 data:{
						 flag:flag,
						 data:$('#SerchInput').val()
						 },
						 success:function(result){
						  $("#tbody").empty();
						  console.log(result)
						 	if(result=="未查询到结果,请检查"){
						 		 $("#tbody").append(
						 		  '<div class="page-header">'+
  									'<h1>为查询到相关结果</h1>'+
									'</div>');
						 	}else{
						 		$.each(result,function (index,course){		                       		                        		                        
			                        $("#tbody").append(
			                        '<tr><td >'+course.courseId+'</td>'+
								      '<td>'+course.courseName+'</td>'+
								      '<td class="am-hide-sm-only">'+course.courseType+'</td>'+
								      '<td>'+course.courseDuration/60/60+'小时</td>'+
								      '<td class="am-hide-sm-only">'+course.totalNumber+'</td>'+							      		     							    						    
								      '<td class="am-hide-sm-only"><button type="button" class="am-btn am-btn-default"><span class="am-icon-trash-o"></span> 删除</button></td>'+						     
								    '</tr>'		                            
			                        );		                        
		                    });
						 }		        			   	        			 		        			    		        			         			    
	    				}
    				});							
				})			 
			});
		</script>
	</body>
	
</html>
