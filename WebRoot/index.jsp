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
		<div class="admin">		
		<!-- 左侧导航开始 -->		                  
		<%@ include file="navbar.jsp" %>			 		
		<!-- 左侧导航结束 -->								
		<!-- ============================================================== -->
		<!-- 右侧主体开始 -->
		<div class="content-page">
			<!-- Start content -->
			<div class="content">	
				<!-- Row start -->		
				<div class="am-container">														
					<h4 class="m-b-15 m-l-15">今日值班经理：</h4>
					<!-- col start -->
					<div class="am-u-lg-4  am-u-md-uncentered">							
						<div class="card-box widget-user">								
                            <div class="text-align">
                                <img src="assets/img/avatar-10.jpg" class="m-l-10 img-responsive img-circle" alt="user">
                                <div class="wid-u-info">
                                    <h4 class="m-t-0 m-b-5 font-600">杨XX</h4>    
                                     <p class="text-muted m-b-5 font-13">电话:13010001000</p>
                                    <small class="text-info"><b>运营部总经理</b></small>                                       
                                </div>
                            </div>
                        </div>                            
					</div>
					<div class="am-u-lg-4  am-u-md-uncentered" >							
						<div class="card-box widget-user">								
                            <div class="text-align">
                                <img src="assets/img/avatar-10.jpg" class="img-responsive img-circle" alt="user">
                                <div class="wid-u-info">
                                    <h4 class="m-t-0 m-b-5 font-600">杨XX</h4>    
                                     <p class="text-muted m-b-5 font-13">电话:13010001000</p>
                                    <small class="text-info"><b>运营部总经理</b></small>                                       
                                </div>
                            </div>
                        </div>                            
					</div>
					<!-- col end -->				
				</div>	
				<!-- Row end -->
					<!-- Row start -->
					<div class="am-container">
						<!-- col start -->
						<div class=" am-u-md-4">
							<div class="card-box">
								<h4 class="header-title m-t-0">部分教练：</h4>
								<div id="coach" class="inbox-widget nicescroll" style="height: 315px; overflow: hidden; outline: none;" tabindex="5000">                                                               
                                </div>
							</div>
						</div>
						<!-- col end -->						
						<!-- col start -->
						<div class="am-u-md-8">
							<div class="card-box">
								<h4 class="header-title m-t-0 m-b-30">最新公告</h4>
								<div class="am-scrollable-horizontal am-text-ms" style="font-family: '微软雅黑';">
                                        <table class="am-table  am-text-nowrap">
                                            <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>公告</th>
                                                <th>时间</th>                                                
                                            </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>1</td>
                                                    <td><a href="#">五一放假通知</a></td>
                                                    <td>2018/4/20</td>                                                
                                                </tr>                                                
                                            </tbody>
                                        </table>
                                    </div>
							</div>
						</div>
						<!-- col end -->
					</div>																			
			</div>
		</div>
		<!-- 右侧主体结束 -->
		</div>
		<!-- 主体 结束-->
		</div>		
		<!-- 移动端导航栏开始 -->
		<a href="admin-offcanvas" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>
		<!-- 移动端导航栏结束 -->	
		<!--  引用必要JS/Jquery  -->
		  		<script type="text/javascript" src="assets/js/jquery-2.1.0.js" ></script>
		<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="assets/js/amazeui.min.js"></script>
		<script>
		$(function(){ 
			console.log("111");
			 $.ajax({
				 	 type:"post",					 
					 url:"Coach_FindAllCoach",
					 data:{						 
					 },
					 success:function(result){						 
        			    $("#coach").empty();	        			      
        			    $.each(result.list,function (index,coach){		        			    	                  		                        		                        
	                        $("#coach").append(
	                        '<a href="#">'+
                                       '<div class="inbox-item">'+
                                           '<div class="inbox-item-img"><img src="assets/img/avatar-1.jpg" class="img-circle" alt="" /></div>'+
                                           '<p class="inbox-item-author">'+coach.coachName+'</p>'+
                                           '<p class="inbox-item-text">'+coach.coachInfo+'</p>'+                                           
                                       '</div>'+
                                 '</a>'	                                                           
	                        );
                         	if(index==3){
                               return flase;
                            }	 		                        
	                    });      			    
    				}
   				});		 	
　　			}); 
		</script>
	</body>
	
</html>

