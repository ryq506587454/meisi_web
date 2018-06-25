<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
						  <div class="am-input-group am-datepicker-date col-md-6 col-md-offset-3" data-am-datepicker="{format: 'yyyy-mm-dd'}">
  							  <input id="SerchInput" type="text" class="am-form-field " placeholder="请选择日期"  readonly>
  							<span class="am-input-group-btn am-datepicker-add-on">
    						  <button class="am-btn am-btn-default"  type="button" style="margin-top: -4px;" ><span class="am-icon-calendar"></span></button>    							
	  						</span>
	  						<button id="SerchBtn" class="am-btn am-btn-secondary" style="margin-top: -30px;">查询</button>	
						  </div>
						</div>					   
					 </div>
					<div class="am-g">
				        <div class="row" style="padding:0 10px ;">
				        	<table class="table table-condensed text-center">
							  <caption><h2>课程列表</h2></caption>
							  <thead>
							    <tr>
							      <th class="col-md-1 text-center" >课程编号</th>
							      <th class="col-md-2 text-center" >课程名称</th>							    
							      <th class="col-md-2 text-center am-hide-sm-only" >课程类型</th>
							      <th class="col-md-2 text-center" >课程时长</th>							 
							      <th class="col-md-2 text-center am-hide-sm-only" >已报人数</th>
							      <th class="col-md-1 text-center am-hide-sm-only" >每节课人数</th>								     								  
							    </tr>
							  </thead>
							  	<tbody id="tbody">							 	 						    
								</tbody>
							</table>
							<ul class="am-pagination" style="margin-top: 50px;">
							  <li id="prevLi" class="am-pagination-prev am-disabled"><a href="javascript:;" id="prev">&laquo; Prev</a></li>
							  <li id="nextLi" class="am-pagination-next am-disabled"><a href="javascript:;" id="next">Next &raquo;</a></li>
							</ul>				          
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
　　				$('#page-title').text('查看课程');											 	
　　			}); 
			$('#SerchBtn').click(function(){														
				$.ajax({
				 	 type:"post",					 
					 url:"Course_meidaFindByDate",
					 data:{
					 courseDate:$('#SerchInput').val(),
					 courseType:"All"
					 },
					 success:function(result){	
					 $("#tbody").empty();
					 console.log(result)
					  $.each(result,function (index,course){		                       		                        		                        
	                       $("#tbody").append(
	                        '<tr><td >'+course.courseId+'</td>'+
						      '<td><a href="Course_Jump?courseId='+course.courseId+'">'+course.courseName+'</a></td>'+
						      '<td class="am-hide-sm-only">'+course.courseType+'</td>'+
						      '<td>'+course.courseDuration/60+'分钟</td>'+
						      '<td class="am-hide-sm-only">'+course.totalNumber+'</td>'+
						      '<td class="am-hide-sm-only">'+course.classNumber+'人/节课</td>'+								      		     							    						    								      
						    '</tr>'		                            
	                        );			                        		                        
                    	});			 						 							  				 					 			        			   	        			 		        			    		        			         			    
    				 }
   				});				
			}); 
					   
		</script>		
	</body>	
</html>
