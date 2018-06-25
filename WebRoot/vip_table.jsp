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
						      <li><a href="javascript:;" data-flag="All">全部会员信息</a></li>
						      <li><a href="javascript:;" data-flag="userId">根据会员号查询</a></li>
						      <li><a href="javascript:;" data-flag="name">根据会员名称查询</a></li>
						      <li><a href="javascript:;" data-flag="tel">根据会员电话查询</a></li>						      
						    </ul>
						  </div>
						</div>
					    <div class="col-sm-5">
					      <input type="text" id="SerchInput" class="form-control" id="serch" placeholder="请输入搜索内容。。">
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
							      <th class="col-md-1 text-center am-hide-sm-only">电话</th>
							      <th class="col-md-1 text-center am-hide-sm-only" >卡型</th>
							      <th class="col-md-2 text-center am-hide-sm-only" >办卡日期</th>
							      <th class="col-md-2 text-center am-hide-sm-only" >到期日期</th>
							      <th class="col-md-1 text-center " >剩余次数</th>
								  <th class="col-md-2 text-center am-hide-sm-only" >操作</th>
							    </tr>
							  </thead>
							  <tbody id="tbody">							  					    						    
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
		<!-- 表格结束 -->			
		<a href="admin-offcanvas" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>		
		<script type="text/javascript" src="assets/js/jquery-2.1.0.js" ></script>
		<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="assets/js/amazeui.min.js"></script>
		<script>
			var page = 1;
			$("#prev").click(function(){				
				page = page-1;	
				findAllVip();	
			})
			$("#next").click(function(){				
				page = page+1;
				findAllVip();						
			})
			$(function(){ 
			console.log("111")
　　				$('#page-title').text('会员列表');
				findAllVip();
　　			}); 
			$(function(){
				$('#select a').click(function(){					
					var flag  = $(this).data("flag");
					 if(flag=="All"){
					 	findAllVip();	
					 }else{
					 	 $.ajax({
					 	 type:"post",					 
						 url:"User_FindByFlag",
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
						 		  $.each(result.list,function (index,vip){
						 		  if(vip.card==null){
						 		  $("#tbody").append(					                     	                      
			                        '<tr>'+
								      '<td>'+vip.userId+'</td>'+
								      '<td><a href="User_Jump?userId='+vip.userId+'">'+vip.name+'</a></td>'+
								      '<td class="am-hide-sm-only">'+vip.tel+'</td>'+
								      '<td class="am-hide-sm-only">无会员卡信息</td>'+
								      '<td class="am-hide-sm-only">无会员卡信息</td>'+
								      '<td class="am-hide-sm-only">无会员卡信息</td>'+							     
								      '<td >无会员卡信息</td>'+							    
								      '<td class="am-hide-sm-only"><a type="button" id="btn'+vip.userId+'" data-userid='+vip.userId+' class="am-btn am-btn-default"><span class="am-icon-trash-o" /> 删除</a></td>'+							     
							    	'</tr>'                           
			                        );
						 		  }else{
						 		  $("#tbody").append(					                     	                      
			                        '<tr>'+
								      '<td>'+vip.userId+'</td>'+
								      '<td><a href="User_Jump?userId='+vip.userId+'">'+vip.name+'</a></td>'+
								      '<td class="am-hide-sm-only">'+vip.tel+'</td>'+
								      '<td class="am-hide-sm-only">'+vip.card.type+'</td>'+
								      '<td class="am-hide-sm-only">'+vip.card.startTime.slice(0,10)+'</td>'+
								      '<td class="am-hide-sm-only">'+vip.card.endTime.slice(0,10)+'</td>'+							     
								      '<td >剩余'+vip.card.restTimes+'次</td>'+							    
								      '<td class="am-hide-sm-only"><a type="button" id="btn'+vip.userId+'" data-userid='+vip.userId+' class="am-btn am-btn-default"><span class="am-icon-trash-o" /> 删除</a></td>'+							     
							    	'</tr>'                           
			                        );
						 		  }						 		 		        			    	                  		                        		                        			                        
			                      $('#btn'+vip.userId).click(function(){								    							    	
							    	if(confirm("确定删除该用户?")){		
										$.ajax({
										 	 type:"post",					 
											 url:"User_DeletUser",
											 data:{	
											 userId:$(this).data("userid")					 
											 },
											 success:function(result){							 					 
						        			     if(result=="1"){
						        			     alert('删除成功');
						        			     $('#SerchInput').empty();	
						        			     findAllVip();
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
		    function findAllVip() {
		    	if(page == "1"){
					 $("#prevLi").addClass("am-disabled");
					
				}else {					 			 	
				 	 $("#prevLi").removeClass("am-disabled");
				}
		        $.ajax({
					 	 type:"post",					 
						 url:"User_findAllVip",
						 data:{	
						 	page:page					 
						 },
						 success:function(result){							 					 
	        			    $("#tbody").empty();
	        			    if(page==result.msg){
								$("#nextLi").addClass("am-disabled");
							}else{
								$("#nextLi").removeClass("am-disabled");
							}	        			      
	        			    $.each(result.list,function (index,vip){		        			 	        			    	                  		                        		                        
		                        if(vip.card==null){
						 		  $("#tbody").append(					                     	                      
			                        '<tr>'+
								      '<td>'+vip.userId+'</td>'+
								      '<td><a href="User_Jump?userId='+vip.userId+'">'+vip.name+'</a></td>'+
								      '<td class="am-hide-sm-only">'+vip.tel+'</td>'+
								      '<td class="am-hide-sm-only">无会员卡信息</td>'+
								      '<td class="am-hide-sm-only">无会员卡信息</td>'+
								      '<td class="am-hide-sm-only">无会员卡信息</td>'+							     
								      '<td >无会员卡信息</td>'+							    
								      '<td class="am-hide-sm-only"><a type="button" id="btn'+vip.userId+'" data-userid='+vip.userId+' class="am-btn am-btn-default"><span class="am-icon-trash-o" /> 删除</a></td>'+							     
							    	'</tr>'                           
			                        );
						 		  }else{
						 		  $("#tbody").append(					                     	                      
			                        '<tr>'+
								      '<td>'+vip.userId+'</td>'+
								      '<td><a href="User_Jump?userId='+vip.userId+'">'+vip.name+'</a></td>'+
								      '<td class="am-hide-sm-only">'+vip.tel+'</td>'+
								      '<td class="am-hide-sm-only">'+vip.card.type+'</td>'+
								      '<td class="am-hide-sm-only">'+vip.card.startTime.slice(0,10)+'</td>'+
								      '<td class="am-hide-sm-only">'+vip.card.endTime.slice(0,10)+'</td>'+							     
								      '<td >剩余'+vip.card.restTimes+'次</td>'+							    
								      '<td class="am-hide-sm-only"><a type="button" id="btn'+vip.userId+'" data-userid='+vip.userId+' class="am-btn am-btn-default"><span class="am-icon-trash-o" /> 删除</a></td>'+							     
							    	'</tr>'                           
			                        );
						 		  }	
							    $('#btn'+vip.userId).click(function(){						    							    							    	
							    	if(confirm("确定删除该用户?")){								    			
									$.ajax({
									 	 type:"post",					 
										 url:"User_DeletUser",
										 data:{	
										 userId:$(this).data("userid")					 
										 },
										 success:function(result){																 					 
					        			     if(result=="1"){
					        			     alert('删除成功');
					        			     findAllVip();
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
