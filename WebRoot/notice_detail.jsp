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
								<form action="Notice_UpdateNotice" method="post" class="am-form">
								  <fieldset>
								    <legend>公告</legend>								   
								    <div class="form-group col-md-offset-4">
									    <div class="am-btn-group">						  
										  <div class="am-dropdown" data-am-dropdown>										
										  	<button id="SerchBtn" class="am-btn am-btn-secondary am-dropdown-toggle"  data-am-dropdown-toggle >查询</button>						  										    
										  </div>
										</div>
									    <div class="col-md-5">									    
									      <input id="SerchInput" type="text" class="form-control" id="serch" placeholder="请输入公告编号" />
									    </div>
									</div>
									<div class="am-form-group am-u-sm-10 am-u-sm-offset-1">
								      <label >公告编号： </label>
								      <input name="noticeId" type="number"  id="noticeId"  disabled />								      
								    </div>								    
								    <div class="am-form-group am-u-sm-10 am-u-sm-offset-1">
								      <label >公告标题:</label>
								      <input name="title" id="title" type="text"  placeholder="输入公告标题" required oninvalid="setCustomValidity('请输入公告标题);"/>
								      <h4 id="msg"></h4>
								    </div>								    									    
								    <div class="am-form-group am-u-sm-10 am-u-sm-offset-1">
								      <label >公告内容：</label>
								      <textarea name="noticeDetail" id="noticeDetail"  rows="10" placeholder="输入公告内容" required oninvalid="setCustomValidity('请输入公告内容);"></textarea>
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
　　				$('#page-title').text('公告');
				if("${!empty sessionScope.noticeId}"){				
					 $.ajax({
					 	 type:"post",					 
						 url:"Notice_FindByID",
						 data:{	
						 noticeId:"${sessionScope.noticeId}"					 
						 },
						 success:function(result){	
						 console.log(result.noticeDetail);						
						  	$('#SerchInput').val("");	
						 	$('#noticeId').val(result.noticeId);
						 	$('#title').val(result.title);
						 	$('#noticeDetail').val(result.noticeDetail);					 		 	        			                           			    
	    				}
    				});
				}
　　			}); 
			$('#SerchBtn').click(function(){
			if($('#SerchInput').val()==""){
				alert("请输入公告编号");
				}else{	
				 $.ajax({
				 	 type:"post",					 
					 url:"Notice_FindByID",
					 data:{	
					 noticeId:$('#SerchInput').val()					 
					 },
					 success:function(result){
					 $('#SerchInput').val("");	
					 if(result==null){
					 	alert('公告不存在，请查证');
					 }else{
					 	$('#noticeId').val(result.noticeId);
					 	$('#title').val(result.title);
					 	$('#noticeDetail').val(result.noticeDetail);
					 }									 							  				 					 			        			   	        			 		        			    		        			         			    
    				}
   				});
   				}									
			});
		</script>		
</html>
