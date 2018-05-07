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
			<div class="content">
				<div class="card-box">
					<div class="form-group row">
					    <div class="am-btn-group">						  
						  <div class="am-dropdown" data-am-dropdown>
						  <button id="SerchBtn" class="am-btn am-btn-secondary" style="font-size: 18px;">查询</button>						  						   
						  </div>
						</div>
					    <div class="col-md-5">
					      <input id="SerchInput" type="date" class="form-control" id="serch" placeholder="请输入搜索内容。。">
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
			
		<!-- 主体结束 -->
   		<a href="admin-offcanvas" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"><!--<i class="fa fa-bars" aria-hidden="true"></i>--></a>    	 
  		<script type="text/javascript" src="assets/js/jquery-2.1.0.js" ></script>
		<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="assets/js/amazeui.min.js"></script>
		<script>
			$(function(){ 
				console.log("111");
　　				$('#page-title').text('预约列表');
					 	
　　			}); 
		</script>
		<script>
			$('#SerchBtn').click(function(){
														
				 $.ajax({
				 	 type:"post",					 
					 url:"Course_FindAppt",
					 data:{
					 courseDate:$('#SerchInput').val()
					 },
					 success:function(result){
					 	console.log(result);						  				 					 			        			   	        			 		        			    		        			         			    
    				}
   				});							
			});		 
		</script>
	</body>
</html>
