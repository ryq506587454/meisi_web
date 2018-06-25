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
					<div class="am-input-group am-datepicker-date col-md-6 col-md-offset-3" data-am-datepicker="{format: 'yyyy-mm-dd'}">
  							<input type="text" class="am-form-field " placeholder="请输入日期"  readonly>
  						<span class="am-input-group-btn am-datepicker-add-on">
    						<button class="am-btn am-btn-default"  type="button"><span class="am-icon-calendar"></span> </button>
  						</span>
					</div>
					<div class="am-g">
				        <div class="row" style="padding:0 10px ;">
				        	<table class="table table-condensed text-center">
							  <caption><h2>教练列表</h2></caption>
							  <thead>
							    <tr>
							      <th class="col-md-2 text-center" >公告编号</th>
							      <th class="col-md-2 text-center" >公告标题</th>	
							      <th class="col-md-2 text-center" >发布日期</th>							  						    							      										     
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
			$("#prev").click(function(){				
				page = page-1;	
				findAllNotice();	
			})
			$("#next").click(function(){				
				page = page+1;
				findAllNotice();						
			})
			$(function(){ 
				console.log("111");
　　				$('#page-title').text('公告列表');
					findAllNotice();		 	
　　			}); 
		    function findAllNotice() {
		    	if(page == "1"){
					 $("#prevLi").addClass("am-disabled");
					
				}else {					 			 	
				 	 $("#prevLi").removeClass("am-disabled");
				}
		        $.ajax({
					 	 type:"post",					 
						 url:"Notice_FindAllNotice",
						 data:{	
						 	page:page					 
						 },
						 success:function(result){	
						 console.log(result);					 
	        			    $("#tbody").empty();
	        			   	if(page==result.msg){
								$("#nextLi").addClass("am-disabled");
							}else{
								$("#nextLi").removeClass("am-disabled");
							}        			      
	        			    $.each(result.list,function (index,notice){		        			    	                  		                        		                        
		                        $("#tbody").append(
		                        '<tr><td >'+notice.noticeId+'</td>'+
							      '<td><a href="Notice_Jump?noticeId='+notice.noticeId+'">'+notice.title+'</a></td>'+							     
							      '<td>'+notice.publishTime.slice(0,10)+'</td>'+							     					      		     							    						    
							      '<td class="am-hide-sm-only"><button type="button" id="btn'+notice.noticeId+'" data-coachid='+notice.noticeId+' class="am-btn am-btn-default"><span class="am-icon-trash-o"></span> 删除</button> </td>'+						     
							    '</tr>'							  							    	                            
		                       );		                  		                       		                        		                       		                        		                        
		                    });	                          			    
	    				}
    				});
		    	}		   
		</script>		
	</body>	
</html>
