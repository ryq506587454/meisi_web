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
					<div class="am-input-group am-datepicker-date col-md-6 col-md-offset-3" data-am-datepicker="{format: 'yyyy-mm-dd'}">
  							<input id="SerchInput" type="text" class="am-form-field " placeholder="请选择日期"  readonly>
  							<span class="am-input-group-btn am-datepicker-add-on">
    						<button class="am-btn am-btn-default"  type="button" style="margin-top: -6px;" ><span class="am-icon-calendar"></span></button>    							
  						</span>
  						<button id="SerchBtn" class="am-btn am-btn-secondary" style="margin-top: -30px;">查询</button>	
					</div>
					<div class="am-g">
				        <div class="row" style="padding:0 10px ;">
				        	<table class="table table-condensed text-center">
							  <caption><h2>预约列表</h2></caption>
							  <thead>
							    <tr>
							      <th class="col-md-2 text-center" >预约编号</th>
							      <th class="col-md-2 text-center" >课程名称</th>								    				    							      
							      <th class="col-md-2 text-center" >开课时间</th>
							      <th class="col-md-2 text-center" >课程时长</th>		
							      <th class="col-md-2 text-center" >用户编号</th>					     
								  <th class="col-md-2 text-center am-hide-sm-only" >操作</th>
							    </tr>
							  </thead>
							  	<tbody id="tbody">							 	 						    
								</tbody>
							</table>
							<ul class="am-pagination" style="margin-top: 50px;">
							  <li id="prevLi" class="am-pagination-prev am-disabled"><a id="prev" href="javascript:;">&laquo; Prev</a></li>
							  <li id="nextLi" class="am-pagination-next am-disabled"><a id="next" href="javascript:;">Next &raquo;</a></li>
							</ul>					          
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
			var page = 1;
			var lastPage=1;
			$("#prev").click(function(){				
				page = page-1;	
				apptList();	
			})
			$("#next").click(function(){				
				page = page+1;
				apptList();							
			})
			$(function(){ 
　　				$('#page-title').text('预约列表');					 	
　　			}); 
			$('#SerchBtn').click(function(){														
				apptList();					
			});	
			function apptList(){
				if(page == "1"){
					 $("#prevLi").addClass("am-disabled");
					
				}else {					 			 	
				 	 $("#prevLi").removeClass("am-disabled");
				}
			 	$.ajax({
				 	 type:"post",					 
					 url:"Course_FindAppt",
					 data:{
					 courseDate:$('#SerchInput').val(),
					 page:page
					 },
					 success:function(result){				 	
					 	if(page==result.msg){
							$("#nextLi").addClass("am-disabled");
						}else{
						    $("#nextLi").removeClass("am-disabled");
						}
						if(result.code==100){						 		
						   alert('没有查询到相关信息');						 		
		    			}else{
				 		    $("#tbody").empty();		
					 		$.each(result.list,function (index,appt){		                       		                        		                        
		                    $("#tbody").append(
		                    '<tr><td >'+appt.apptId+'</td>'+
						      	'<td >'+appt.courseName+'</a></td>'+
						      	'<td >'+appt.courseTime.replace("T"," ")+'</td>'+
						      	'<td >'+appt.courseDuration/60+'</td>'+
						      	'<td >'+appt.user.userId+'</td>'+							      		     							    						    
						        '<td ><button type="button" id="btn'+appt.apptId+'" data-userid='+appt.user.userId+' data-coursename='+appt.courseName+'	 data-apptid='+appt.apptId+' class="am-btn am-btn-default"><span class="am-icon-trash-o"></span> 删除</button></td>'+						     
						    '</tr>'		                            
	                        );
	                         $('#btn'+appt.apptId).click(function(){	
	                        console.log($(this).data("apptid"))							    							    	
							    	if(confirm("确定删除该预约?")){		
										$.ajax({
										 	 type:"post",					 
											 url:"User_mediaQuiteAppt",
											 data:{	
											  appId:$(this).data("apptid"),
											  userId:$(this).data("userid"),
											  courseName:$(this).data("coursename")					 
											 },
											 success:function(result){
											 console.log(result)							 					 
						        			     if(result=="OK"){
						        			     alert('删除成功');
						        			     apptList();					        			    						        			    
						        			    }   			    
						    				 }
					    				});				    		
							    	}else{						    		
							    	}
							   	})		                        	                        
	                      });
					 	}						  				 					 			        			   	        			 		        			    		        			         			    
    				}
   				});	
			}	 
		</script>
	</body>
</html>
