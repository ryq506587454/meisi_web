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
					<div class="form-group col-md-offset-4">
					    <div class="am-btn-group">						  
						  <div class="am-dropdown" data-am-dropdown>										
						  	<button id="SerchBtn" class="am-btn am-btn-secondary am-dropdown-toggle"  data-am-dropdown-toggle >查询</button>						  										    
						  </div>
						</div>
					    <div class="col-md-5">									    
					      <input id="SerchInput" type="text" class="form-control" id="serch" placeholder="请输入课程编号" />
					    </div>					   
					</div>
					<div class="am-g">
						<label class="col-md-3" style="text-align: right; margin-top: -8px;"><h2>课程名称:</h2></label>
					   <div class="col-md-6 ">					      
					      <input id="courseName" class="form-control" disabled />								      
					   </div>
					   
				        <div class="row" style="padding:0 10px ;">
				        	<table class="table table-condensed text-center">
							  <caption><h2>课程时间列表</h2></caption>
							  <thead>
							    <tr>
							      <th class="col-md-2 text-center" >开课时间</th>							  						    							      										     
								  <th class="col-md-2 text-center am-hide-sm-only" >操作</th>
							    </tr>
							  </thead>
							  	<tbody id="tbody" >							 	 						    
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
		</div>
		<!-- 表格结束 -->		
		</div>
		</div>		
		<a href="admin-offcanvas" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>		
		<script type="text/javascript" src="assets/js/jquery-2.1.0.js" ></script>
		<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="assets/js/amazeui.min.js"></script>
		<script>
			var courseId = "";
			$(function(){ 
　　				$('#page-title').text('课程时间列表');		 	
　　			}); 		    	
		   $('#SerchBtn').click(function(){				
				if($('#SerchInput').val()==""){
				alert("请输入课程编号");
				}else{									
					$.ajax({
				 	 type:"post",					 
					 url:"Course_meidaFindByID",
					 data:{
					 courseId:$('#SerchInput').val()
					 },
					 success:function(result){	
					 $('#SerchInput').val("");
					 if(result==null){
					 	alert('课程不存在，请查证');
					 }else{				 	  
					 	  courseId = $('#SerchInput').val()	
					 	  $('#courseName').val(result.courseName);	
					 	  $("#tbody").empty();		
                          $.each(result.startDate,function (index,date){	        			    		        			   	        			    	                  		                        		                        
	                      $("#tbody").append(
		                    '<tr>'+
						      '<td>'+date.replace("T"," ")+'</td>'+					     						      		     							    						    
						      '<td class="am-hide-sm-only"><button type="button" id="btn'+date+'" data-courseid='+courseId+' class="am-btn am-btn-default"><span class="am-icon-trash-o"></span> 删除</button></td>'+					 						     
						    '</tr>'		                            
		                    );		                        		                        
	                    });	                      	
					 }										 							  				 					 			        			   	        			 		        			    		        			         			    
    				}
   				});
				}					 									
			});		       				   
		</script>		
	</body>	
</html>
