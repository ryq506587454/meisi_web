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
					<!-- Row start -->
					<div class="am-g">
						<div class="am-u-sm-12 am-u-md-6">
				          <div class="am-btn-toolbar">
				            <div class="am-btn-group am-btn-group-xs">
				              <button type="button" class="am-btn am-btn-default"><span class="am-icon-plus"></span> 新增</button>
				              <button type="button" class="am-btn am-btn-default"><span class="am-icon-save"></span> 保存</button>
				              <button type="button" class="am-btn am-btn-default"><span class="am-icon-trash-o"></span> 删除</button>
				            </div>
				          </div>
				       </div>					        
						<div class="am-u-sm-12 am-u-md-3">
				          <div class="am-input-group am-input-group-sm">
				            <input type="text" class="am-form-field">
				          <span class="am-input-group-btn">
				            <button class="am-btn am-btn-default" type="button">搜索</button>
				          </span>
				          </div>
				        </div>
				      </div>
					  <!-- Row end -->
					  
					  <!-- Row start -->
					<div class="am-g">
				        <div class="row" style="padding:0 10px ;">
				        	<table class="table table-condensed">
							  <caption><h3>会员列表</h3></caption>
							  <thead>
							    <tr>
							      <th class="col-md-2">会员号</th>
							      <th class="col-md-1">名称</th>							    
							      <th class="col-md-2">电话</th>
							      <th class="col-md-1 am-hide-sm-only" >卡型</th>
							      <th class="col-md-1 am-hide-sm-only" style="text-align: center;">办卡日期</th>
							      <th class="col-md-1 am-hide-sm-only" style="text-align: center;">到期日期</th>
							      <th class="col-md-2 am-hide-sm-only">剩余次数</th>
								  <th class="col-md-2">操作</th>
							    </tr>
							  </thead>
							  <tbody>
							  <c:forEach items="${sessionScope.VipList}" var="VL">
							    <tr>
							      <td>${VL.userId}</td>
							      <td>${VL.name}</td>
							      <td class="am-hide-sm-only">${VL.tel}</td>
							      <td>${VL.card.type}</td>
							      <td class="am-hide-sm-only">${VL.card.startTime}</td>
							      <td class="am-hide-sm-only">${VL.card.endTime}</td>
							      <c:choose>
   									<c:when test="${VL.card.restTimes eq '-2'}"> 
							      	<td class="am-hide-sm-only">有效期内无次数限制</td>
							      	</c:when>
							      	<c:otherwise>  
							      	<td class="am-hide-sm-only">剩余${VL.card.restTimes}次</td>
							      	 </c:otherwise>
								 </c:choose>
							      <td><button type="button" class="am-btn am-btn-default"><span class="am-icon-trash-o"></span> 删除</button></td>							     
							    </tr>
							   </c:forEach>							    						    
							</tbody>
							</table>				          
				        </div>
      					</div>
					  <!-- Row end -->					  
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
　　				$('#page-title').text('会员列表');　　　　		 	
　　			}); 
		</script>
	</body>
	
</html>
