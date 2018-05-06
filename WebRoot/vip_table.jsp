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
						  <button class="am-btn am-btn-secondary" disable="true">搜索条件</button>
						  <div class="am-dropdown" data-am-dropdown>
						    <button class="am-btn am-btn-secondary am-dropdown-toggle" data-am-dropdown-toggle> <span class="am-icon-caret-down"></span></button>
						    <ul class="am-dropdown-content">
						      <li class="am-dropdown-header">条件</li>
						      <li><a href="javascript:;" data-flag="userId">根绝会员号查询</a></li>
						      <li><a href="javascript:;" data-flag="name">根据会员名称查询</a></li>
						      <li><a href="javascript:;" data-flag="tel">根据会员电话查询</a></li>						      
						    </ul>
						  </div>
						</div>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="serch" placeholder="请输入搜索内容。。">
					    </div>
					  </div>								  
					<div class="am-g">
				        <div class="row" style="padding:0 10px ;">
				        	<table class="table table-condensed text-center" >
							  <caption><h2>会员列表</h2></caption>
							  <thead>
							    <tr>
							      <th class="col-md-2 text-center" >会员号</th>
							      <th class="col-md-1 text-center" >名称</th>							    
							      <th class="col-md-2 text-center am-hide-sm-only">电话</th>
							      <th class="col-md-1 text-center am-hide-sm-only" >卡型</th>
							      <th class="col-md-1 text-center am-hide-sm-only" >办卡日期</th>
							      <th class="col-md-1 text-center am-hide-sm-only" >到期日期</th>
							      <th class="col-md-1 text-center " >剩余次数</th>
								  <th class="col-md-3 text-center am-hide-sm-only" >操作</th>
							    </tr>
							  </thead>
							  <tbody>
							  <c:forEach items="${sessionScope.VipList}" var="VL">
							    <tr>
							      <td>${VL.userId}</td>
							      <td>${VL.name}</td>
							      <td class="am-hide-sm-only">${VL.tel}</td>
							      <td class="am-hide-sm-only">${VL.card.type}</td>
							      <td class="am-hide-sm-only">${VL.card.startTime}</td>
							      <td class="am-hide-sm-only">${VL.card.endTime}</td>							     
							      <td >剩余${VL.card.restTimes}次</td>							    
							      <td class="am-hide-sm-only"><button type="button" class="am-btn am-btn-default"><span class="am-icon-trash-o"></span> 删除</button></td>							     
							    </tr>
							   </c:forEach>							    						    
							</tbody>
							</table>				          
				        </div>
      				</div>				  
				</div>																
			</div>			
		</div>
		<!-- 表格结束 -->			
		<a href="admin-offcanvas" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>		
		<script type="text/javascript" src="assets/js/jquery-2.1.0.js" ></script>
		<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="assets/js/amazeui.min.js"></script>
		<script>
			$(function(){ 
			console.log("111")
　　				$('#page-title').text('会员列表');　　　　		 	
　　			}); 
		</script>
	</body>
	
</html>
