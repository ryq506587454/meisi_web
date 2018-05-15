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
						  <div class="am-dropdown" data-am-dropdown>
						  <button  class="am-btn am-btn-secondary am-dropdown-toggle"  data-am-dropdown-toggle >选择搜索条件&nbsp;<span class="am-icon-caret-down" /></button>						  
						    <ul class="am-dropdown-content" id="select">
						      <li class="am-dropdown-header">条件</li>
						      <li><a href="javascript:;" data-flag="All">全部教练</a></li>
						      <li><a href="javascript:;" data-flag="coachId">根据教练编号查询</a></li>
						      <li><a href="javascript:;" data-flag="coachName">根据教练名称查询</a></li>
						      <li><a href="javascript:;" data-flag="courseType">根据授课类型查询</a></li>	
						      <li><a href="javascript:;" data-flag="sex">根据教练性别查询</a></li>							      
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
							  <caption><h2>教练列表</h2></caption>
							  <thead>
							    <tr>
							      <th class="col-md-2 text-center" >教练编号</th>
							      <th class="col-md-2 text-center" >教练名称</th>								  						    							      
							      <th class="col-md-1 text-center am-hide-sm-only" >教练性别</th>						      
							      <th class="col-md-3 text-center am-hide-sm-only" >教练简介</th>	
							      <th class="col-md-1 text-center am-hide-sm-only" >主授课程类型</th>						     
								  <th class="col-md-2 text-center am-hide-sm-only" >操作</th>
							    </tr>
							  </thead>
							  	<tbody id="tbody" >							 	 						    
								</tbody>
							</table>
							<ul class="am-pagination" style="margin-top: 50px;">
							  <li id="prevLi" class="am-pagination-prev"><a id="prev" href="javascript:;">&laquo; Prev</a></li>
							  <li id="nextLi" class="am-pagination-next"><a id="next" href="javascript:;">Next &raquo;</a></li>
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
			var lastPage=1;
			$("#prev").click(function(){				
				page = page-1;	
				findAllCoach();	
			})
			$("#next").click(function(){				
				page = page+1;
				findAllCoach();						
			})
			$(function(){ 
				console.log("111");
　　				$('#page-title').text('教练列表');
					findAllCoach();		 	
　　			}); 
			$(function(){
				$('#select a').click(function(){					
					var flag  = $(this).data("flag");						
					 $.ajax({
					 	 type:"post",					 
						 url:"Coach_FindByFlag",
						 data:{
						 flag:flag,
						 data:$('#SerchInput').val()
						 },
						 success:function(result){
						 	console.log(result);						  				 
						 	if(result.code==100){						 		
						 		alert('没有查询到相关信息');						 		
		    				}else{
		    					$("#tbody").empty();		
						 		$.each(result.list,function (index,coach){		                       		                        		                        
			                    $("#tbody").append(
			                    '<tr><td >'+coach.coachId+'</td>'+
							      	'<td>'+coach.coachName+'</td>'+
							      	'<td class="am-hide-sm-only">'+coach.sex+'</td>'+
							      	'<td>'+coach.coachInfo+'</td>'+
							      	'<td class="am-hide-sm-only">'+coach.courseType+'课程</td>'+							      		     							    						    
							        '<td class="am-hide-sm-only"><button type="button" id="btn'+coach.coachId+'" data-coachid='+coach.coachId+' class="am-btn am-btn-default"><span class="am-icon-trash-o"></span> 删除</button></td>'+						     
							    '</tr>'		                            
		                        );
		                         $('#btn'+coach.coachId).click(function(){								    							    	
							    	if(confirm("删除该教练会同时删除该教练所授课程，是否继续?")){		
										$.ajax({
										 	 type:"post",					 
											 url:"Coach_DeleteCoach",
											 data:{	
												coachId:$(this).data("coachid")					 
											 },
											 success:function(result){							 					 
						        			     if(result=="1"){
						        			     alert('删除成功');
						        			     $('#SerchInput').empty();	
						        			     findAllCoach();
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
				})			 
			});
		    function findAllCoach() {
		    	if(page == "1"){
					$("#prevLi").addClass("am-disabled");
					
				}else {					 			 	
				 	$("#prevLi").removeClass("am-disabled");
				}
		        $.ajax({
					 	 type:"post",					 
						 url:"Coach_FindAllCoach",
						 data:{	
						 	page:page					 
						 },
						 success:function(result){	
						 console.log(result);					 
	        			    $("#tbody").empty();	        			      
	        			    $.each(result.list,function (index,coach){
	        			    	if(page==result.msg){
									$("#nextLi").addClass("am-disabled");
								}else{
									 $("#nextLi").removeClass("am-disabled");
								}	        			    	                  		                        		                        
		                        $("#tbody").append(
		                        '<tr><td >'+coach.coachId+'</td>'+
							      '<td>'+coach.coachName+'</td>'+
							      '<td class="am-hide-sm-only">'+coach.sex+'</td>'+
							      '<td>'+coach.coachInfo+'</td>'+
							      '<td class="am-hide-sm-only">'+coach.courseType+'课程</td>'+							      		     							    						    
							       '<td class="am-hide-sm-only"><button type="button" id="btn'+coach.coachId+'" data-coachid='+coach.coachId+' class="am-btn am-btn-default"><span class="am-icon-trash-o"></span> 删除</button> </td>'+						     
							    '</tr>'		                            
		                        );
		                        $('#btn'+coach.coachId).click(function(){								    							    	
							    	if(confirm("删除该教练会同时删除该教练所授课程，是否继续?")){		
										$.ajax({
										 	 type:"post",					 
											 url:"Coach_DeleteCoach",
											 data:{	
												coachId:$(this).data("coachid")					 
											 },
											 success:function(result){							 					 
						        			     if(result=="1"){
						        			     alert('删除成功');
						        			     $('#SerchInput').empty();	
						        			     findAllCoach();
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
