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
						  <div class="am-dropdown" data-am-dropdown>
						  <button  class="am-btn am-btn-secondary am-dropdown-toggle"  data-am-dropdown-toggle >选择搜索条件&nbsp;<span class="am-icon-caret-down" /></button>						  
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
							      <th class="col-md-1 text-center am-hide-sm-only" >已报人数</th>
							      <th class="col-md-1 text-center am-hide-sm-only" >每节课人数</th>								     
								  <th class="col-md-2 text-center am-hide-sm-only" >操作</th>
							    </tr>
							  </thead>
							  	<tbody id="tbody">							 	 						    
								</tbody>
							</table>
							<ul class="am-pagination" style="margin-top: 50px;">
							  <li id="prevLi" class="am-pagination-prev"><a href="javascript:;" id="prev">&laquo; Prev</a></li>
							  <li id="nextLi" class="am-pagination-next"><a href="javascript:;" id="next">Next &raquo;</a></li>
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
			var page = 1;
			$("#prev").click(function(){				
				page = page-1;	
				findAllCourse();	
			})
			$("#next").click(function(){				
				page = page+1;
				findAllCourse();						
			})
			$(function(){ 
　　				$('#page-title').text('课程列表');
				findAllCourse();									 	
　　			}); 
			$(function(){			
				$('#select a').click(function(){					
					var flag  = $(this).data("flag");
					if(flag=="All"){
						findAllCourse();	
					}else{
						$.ajax({
					 	 type:"post",					 
						 url:"Course_FindByFlag",
						 data:{
						 flag:flag,
						 data:$('#SerchInput').val()						
						 },
						 success:function(result){						  				 
						 	if(result.code==100){						 		
						 		alert('没有查询到相关信息');						 		
		    				}else{
		    					$("#prevLi").addClass("am-disabled");
		    					$("#nextLi").addClass("am-disabled");	
		    					$("#tbody").empty();		
						 		$.each(result.list,function (index,course){		                       		                        		                        
			                        $("#tbody").append(
			                        '<tr><td >'+course.courseId+'</td>'+
								      '<td><a href="Course_Jump?courseId='+course.courseId+'">'+course.courseName+'</a></td>'+
								      '<td class="am-hide-sm-only">'+course.courseType+'</td>'+
								      '<td>'+course.courseDuration/60+'分钟</td>'+
								      '<td class="am-hide-sm-only">'+course.totalNumber+'</td>'+
								      '<td class="am-hide-sm-only">'+course.classNumber+'人/节课</td>'+								      		     							    						    
								      '<td class="am-hide-sm-only"><button type="button" id="btn'+course.courseId+'" data-courseid='+course.courseId+' class="am-btn am-btn-default"><span class="am-icon-trash-o"></span> 删除</button></td>'+					     
								    '</tr>'		                            
			                        );
			                         $('#btn'+course.courseId).click(function(){			                    						    							    	
							    	if(confirm("确定删除该课程?")){		
										$.ajax({
										 	 type:"post",					 
											 url:"Course_DeleteCourse",
											 data:{	
											 courseId:$(this).data("courseid")					 
											 },
											 success:function(result){							 					 
						        			     if(result=="1"){
						        			     alert('删除成功');
						        			     $('#SerchInput').empty();	
						        			     findAllCourse();
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
				})			 
			});
		    function findAllCourse() {
		    	if(page == "1"){
					 $("#prevLi").addClass("am-disabled");
					
				}else {					 			 	
				 	 $("#prevLi").removeClass("am-disabled");
				}
		        $.ajax({
					 	 type:"post",					 
						 url:"Course_FindAllCourse",
						 data:{	
						  page:page					 
						 },
						 success:function(result){						 
	        			    $("#tbody").empty();
	        			    console.log(result)
	        			    if(page==result.msg){
									$("#nextLi").addClass("am-disabled");
								}else{
									 $("#nextLi").removeClass("am-disabled");
								}	        			      
	        			    $.each(result.list,function (index,course){	        			    		        			   	        			    	                  		                        		                        
		                        $("#tbody").append(
		                        '<tr><td >'+course.courseId+'</td>'+
							      '<td><a href="Course_Jump?courseId='+course.courseId+'">'+course.courseName+'</a></td>'+
							      '<td class="am-hide-sm-only">'+course.courseType+'</td>'+
							      '<td>'+course.courseDuration/60+' 分钟</td>'+
							      '<td class="am-hide-sm-only">'+course.totalNumber+'</td>'+
							      '<td class="am-hide-sm-only">'+course.classNumber+'人/节课</td>'+							      		     							    						    
							      '<td class="am-hide-sm-only"><button type="button" id="btn'+course.courseId+'" data-courseid='+course.courseId+' class="am-btn am-btn-default"><span class="am-icon-trash-o"></span> 删除</button></td>'+						     
							    '</tr>'		                            
		                        );
		                        $('#btn'+course.courseId).click(function(){			                       							    							    	
							    	if(confirm("确定删除该课程?")){		
										$.ajax({
										 	 type:"post",					 
											 url:"Course_DeleteCourse",
											 data:{	
											 courseId:$(this).data("courseid")					 
											 },
											 success:function(result){							 					 
						        			     if(result=="1"){
						        			     alert('删除成功');
						        			     $('#SerchInput').empty();	
						        			     findAllCourse();
						        			     }   			    
						    				 }
					    				});				    		
							    	}else{						    		
							    	}
							   	})		                        		                        
		                    });      			    
	    				}
    				});
		    	}		   
		</script>		
	</body>	
</html>
