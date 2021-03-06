<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="Dashboard">
		<meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
	
		<title>role</title>
	
		<!--external css-->
	    <link href="/assets/css/bootstrap.css" rel="stylesheet">
		<link href="/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
		<link href="/assets/css/style.css" rel="stylesheet">
	    <link href="/assets/css/style-responsive.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="/assets/lineicons/style.css">
	    
	    <link rel="stylesheet" type="text/css" href="/assets/css/zabuto_calendar.css">
	    <link rel="stylesheet" type="text/css" href="/assets/js/gritter/css/jquery.gritter.css" />
	    <script src="/assets/js/chart-master/Chart.js"></script>
	</head>
<body>
	

		<section id="container">

			<!--header end-->

			<!--sidebar end-->
			<jsp:include page="../header.jsp" flush="true" />
			
			<div class="copyrights">Collect from
				<a href="http://www.cssmoban.com/">网页模板</a>
			</div>

			<section id="main-content">
				<section class="wrapper">
					<h3>
						<i class="fa fa-angle-right"></i>
						角色管理
					</h3>
					
					<div class="row mt" style="margin-top: 20px;">
						<div class="col-lg-12">
							<div class="form-panel">
								<h5>
									<i class="fa fa-angle-right"></i>
									角色列表
								</h5>
								<hr />
								<table class="table table-hover">
	                              <thead>
		                              <tr>
		                                  <th>No.</th>
		                                  <th>角色名称</th>
		                                  <th>角色代码</th>
		                                  <th>说明</th>
		                                  <th>操作</th>
		                              </tr>
	                              </thead>
	                              <tbody id="role_body">
		                             <!--  <tr>
		                                  <td>1</td>
		                                  <td>Mark</td>
		                                  <td>Otto</td>
		                                  <td>@mdo</td>
		                                  <td>
		                                  	<button class="btn btn-primary btn-xs" data-toggle="modal" data-target="#roleModel"><i class="fa fa-pencil"></i></button>&nbsp;
		                                  	<button class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button>
		                                  </td>
		                              </tr> -->
	                              </tbody>
	                          </table>
							</div>
							
							<div class="form-panel" style="margin-top: 70px;">
								<h5>
									<i class="fa fa-angle-right"></i>
									添加角色
								</h5>
								<hr />
								<form class="form-horizontal style-form role_ad_form">
		                          	<div class="form-group">
		                              <label class="col-sm-2 col-sm-2 control-label">角色名称</label>
		                              <div class="col-sm-10">
		                                  <input type="text" class="form-control is-required" id="add_role_name">
		                              </div>
		                          	</div>
		                          	<div class="form-group">
		                              <label class="col-sm-2 col-sm-2 control-label">角色代码</label>
		                              <div class="col-sm-10">
		                                  <input type="text" class="form-control is-required" id="add_role_code">
		                              </div>
		                          	</div>
		                          	<div class="form-group">
		                              <label class="col-sm-2 col-sm-2 control-label">说明</label>
		                              <div class="col-sm-10">
		                                  <input type="text" class="form-control is-required" id="add_role_desc">
		                              </div>
		                          	</div>
		                          	<div class="form-group">
									    <div class="col-sm-offset-2 col-sm-10">
									      <button type="button" class="btn btn-default role_add">添加</button>&nbsp;&nbsp;
									      <button type="button" class="btn btn-default role_rest">重置</button>
									    </div>
								  	</div>
		                      	</form>	
							</div>
							
							
							
							
							
						</div>
					</div>
				</section>
				
				<!-- 模态框（Modal）角色编辑 -->
				<div class="modal fade" id="roleModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				    <div class="modal-dialog modal-dialog-centered" style="top: 200px;">
				        <div class="modal-content">
				            <div class="modal-header">
				                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
				                    &times;
				                </button>
				                <h4 class="modal-title" id="myModalLabel">
				                                 	角色编辑
				                </h4>
				            </div>
				            <div class="modal-body">
				                	
									<form class="form-horizontal style-form" method="get">
			                          	<div class="form-group" style="padding-bottom: 0px;">
			                              <label class="col-sm-2 col-sm-2 control-label">角色名称</label>
			                              <div class="col-sm-10">
			                                  <input type="text" class="form-control is-required" id="role_name">
			                              </div>
			                          	</div>
			                          	<div class="form-group" style="padding-bottom: 0px;">
			                              <label class="col-sm-2 col-sm-2 control-label">角色代码</label>
			                              <div class="col-sm-10">
			                                  <input type="text" class="form-control is-required" id="role_code" disabled="disabled">
			                              </div>
			                          	</div>
			                          	<div class="form-group" style="padding-bottom: 0px;">
			                              <label class="col-sm-2 col-sm-2 control-label">角色说明</label>
			                              <div class="col-sm-10">
			                                  <input type="text" class="form-control is-required" id="role_desc">
			                              </div>
			                          	</div>
			                      	</form>	
				                	
				            </div>
				            <div class="modal-footer">
				                <button type="button" class="btn btn-default" data-dismiss="modal">取消
				                </button>
				                <button type="button" class="btn btn-primary" id="role-submit">
				                    	提交更改
				                </button>
				            </div>
				        </div><!-- /.modal-content -->
				    </div>
				</div>
				<!-- /.modal -->
				<!-- 模态框，角色已有权限列表 -->
				<div class="modal fade" id="role_has_permision" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				    <div class="modal-dialog modal-dialog-centered" style="top: 50px;">
				        <div class="modal-content">
				            <div class="modal-header">
				                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
				                    &times;
				                </button>
				                <h4 class="modal-title" id="myModalLabel">
				                         	已有权限
				                </h4>
				            </div>
				            <div class="modal-body">
								<div class="input-group" style="width: 200px;margin-top: 10px;">
									<input type="text" class="form-control input-sm" id="p_name" placeholder="权限名称">
									<div class="input-group-addon query_has_permision" style="cursor: pointer;">查询</div>
								</div>
								<h3></h3>
								<input type="hidden" id="has_p_id">
								<table class="table table-hover">
	                              <thead>
		                              <tr>
		                                  <th>No.</th>
		                                  <th>权限名称</th>
		                                  <th>权限代码</th>
		                                  <th>菜单名称</th>
		                                  <th>删除</th>
		                              </tr>
	                              </thead>
	                              <tbody id="role_has_body">
	                              	<!-- <tr>
	                              		<td>1</td>
	                              		<td>账单</td>
	                              		<td>abc.websote</td>
	                              		<td>账单</td>
	                              	</tr> -->
	                              </tbody>
	                          </table>
							  <div>
	                          	<ul id="role_has_paginator" class="pagination pagination-sm">
	                          	</ul>
	                          </div>
	                          
				            </div>
				            <div class="modal-footer">
				                <button type="button" class="btn btn-default" data-dismiss="modal">Close掉
				                </button>
				                <button type="button" class="btn btn-primary" id="role-permision-del">
				                     	删除
				                </button>
				            </div>
				        </div><!-- /.modal-content -->
				    </div>
				</div>
				<!-- 模态框，角色可分配权限列表 -->
				<div class="modal fade" id="role_no_permisions" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				    <div class="modal-dialog modal-dialog-centered" style="top: 50px;">
				        <div class="modal-content">
				            <div class="modal-header">
				                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
				                    &times;
				                </button>
				                <h4 class="modal-title" id="myModalLabel">
				                         	选择权限
				                </h4>
				            </div>
				            <div class="modal-body">
								<div class="input-group" style="width: 200px;margin-top: 8px;">
									<input type="text" class="form-control input-sm" id="p_name" placeholder="权限名称">
									<div class="input-group-addon query_nothas_permision" style="cursor: pointer;">查询</div>
								</div>
								<h4></h4>
								<input type="hidden" id="nothas_p_id">
								<table class="table table-hover">
	                              <thead>
		                              <tr>
		                                  <th>No.</th>
		                                  <th>权限名称</th>
		                                  <th>权限代码</th>
		                                  <th>菜单名称</th>
		                                  <th>选择</th>
		                              </tr>
	                              </thead>
	                              <tbody id="role_nothas_body">
	                              	<!-- <tr>
	                              		<td>1</td>
	                              		<td>账单</td>
	                              		<td>abc.websote</td>
	                              		<td>账单</td>
	                              	</tr> -->
	                              </tbody>
	                          </table>
							  <div>
	                          	<ul id="role_no_paginator" class="pagination pagination-sm">
	                          	</ul>
	                          </div>
	                          
				            </div>
				            <div class="modal-footer">
				                <button type="button" class="btn btn-default" data-dismiss="modal">Close
				                </button>
				                <button type="button" class="btn btn-primary" id="role-add-p">
				                    	提交
				                </button>
				            </div>
				        </div><!-- /.modal-content -->
				    </div>
				</div>
			</section>

			<!--footer start-->
			<jsp:include page="../footer.jsp" flush="true" />
		</section>
		<!-- js placed at the end of the document so the pages load faster -->
		<script src="/assets/js/jquery.js"></script>
		<script src="/assets/js/jquery-1.8.3.min.js"></script>
		<script src="/assets/js/bootstrap.min.js"></script>
		<script class="include" type="text/javascript" src="/assets/js/jquery.dcjqaccordion.2.7.js"></script>
		<script src="/assets/js/jquery.scrollTo.min.js"></script>
		<script src="/assets/js/jquery.nicescroll.js" type="text/javascript"></script>
		<script src="/assets/js/jquery.sparkline.js"></script>

		<!--common script for all pages-->
		<script src="/assets/js/common-scripts.js"></script>

		<script type="text/javascript" src="/assets/js/gritter/js/jquery.gritter.js"></script>
		<script type="text/javascript" src="/assets/js/gritter-conf.js"></script>
		<script type="text/javascript" src="/assets/js/paginator/bootstrap-paginator.js"></script>

		<!--script for this page-->
		<script src="/assets/js/sparkline-chart.js"></script>
		<script src="/assets/js/zabuto_calendar.js"></script>
   		<script src="${pageContext.request.contextPath}/pages/comm/js/comm.js"></script>
		<script src="${pageContext.request.contextPath}/pages/system/role.js"></script>


</body>
</html>