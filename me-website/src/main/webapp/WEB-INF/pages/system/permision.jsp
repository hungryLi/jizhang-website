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
	
		<title>permision</title>
	
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
			
			<!-- <div class="copyrights">Collect from
				<a href="http://www.cssmoban.com/">网页模板</a>
			</div> -->

			<section id="main-content">
				<section class="wrapper">
					<h3>
						<i class="fa fa-angle-right"></i>
						权限管理
					</h3>
					
					<div class="row mt" style="margin-top: 20px;">
						<div class="col-lg-12">
							<div class="form-panel">
								<div class="input-group" style="width: 200px;">
									<input type="text" class="form-control" id="p_name" placeholder="权限名称">
									<div class="input-group-addon query_permision" style="cursor: pointer;">查询</div>
								</div>
								
								<div style="margin-top: 30px;position: relative;">
									<h5 style="display: inline;width: 300px;"><i class="fa fa-angle-right"></i> 权限列表</h5>
									<button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#permissionEdit" style="position: absolute;right: 0px;bottom: -5px;">
										<i class="glyphicon glyphicon-plus"></i>添加
									</button>
								</div>
								<hr />
								<table class="table table-hover">
	                              <thead>
		                              <tr>
		                                  <th>No.</th>
		                                  <th>权限名称</th>
		                                  <th>权限代码</th>
		                                  <th>菜单名称</th>
		                                  <th>菜单级别</th>
		                                  <th>跳转地址</th>
		                                  <th>图标</th>
		                                  <th>操作</th>
		                              </tr>
	                              </thead>
	                              <tbody id="permision_body">
		                              <tr>
		                                  <!-- <td>1</td>
		                                  <td>Mark</td>
		                                  <td>Otto</td>
		                                  <td>@mdo</td>
		                                  <td>@mdo</td>
		                                  <td>@mdo</td>
		                                  <td>@mdo</td>
		                                  <td>
		                                  	<button class="btn btn-primary btn-xs" data-toggle="modal" data-target="#roleModel"><i class="fa fa-pencil"></i></button>&nbsp;
		                                  	<button class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button>
		                                  </td> -->
		                              </tr>
	                              </tbody>
	                          </table>
	                          <div>
	                          	<ul id="p_pagenator" class="pagination pagination-sm">
	                          	</ul>
	                          </div>
							</div>
							
							<!-- <div class="form-panel" style="margin-top: 70px;">
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
							</div> -->
							
							
							
							
							
						</div>
					</div>
				</section>
				
				<!-- 模态框（Modal 权限添加） -->
				<div class="modal fade" id="permissionEdit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				    <div class="modal-dialog modal-dialog-centered" style="top: 150px;">
				        <div class="modal-content">
				            <div class="modal-header">
				                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
				                    &times;
				                </button>
				                <h4 class="modal-title" id="myModalLabel">
				                                 	权限添加
				                </h4>
				            </div>
				            <div class="modal-body">
				                	
									<form class="form-horizontal style-form" method="get">
			                          	<div class="form-group" style="padding-bottom: 0px;">
			                              <label class="col-sm-2 col-sm-2 control-label">权限名称</label>
			                              <div class="col-sm-10">
			                                  <input type="text" class="form-control is-required" id="p_name1">
			                              </div>
			                          	</div>
			                          	<div class="form-group" style="padding-bottom: 0px;">
			                              <label class="col-sm-2 col-sm-2 control-label">权限代码</label>
			                              <div class="col-sm-10">
			                                  <input type="text" class="form-control is-required" id="p_code">
			                              </div>
			                          	</div>
			                          	<div class="form-group" style="padding-bottom: 0px;">
			                              <label class="col-sm-2 col-sm-2 control-label">菜单名称</label>
			                              <div class="col-sm-10">
			                                  <input type="text" class="form-control is-required" id="menu_name">
			                              </div>
			                          	</div>
			                          	<div class="form-group" style="padding-bottom: 0px;">
			                              <label class="col-sm-2 col-sm-2 control-label">url地址</label>
			                              <div class="col-sm-10">
			                                  <input type="text" class="form-control is-required" id="menu_href" value="javascript:void(0);">
			                              </div>
			                          	</div>
			                          	<div class="form-group" style="padding-bottom: 0px;">
			                              <label class="col-sm-2 col-sm-2 control-label">菜单级别</label>
			                              <div class="col-sm-10">
			                                  <select class="form-control" id="menu_type">
			                                  	<option value="1">1级</option>
			                                  	<option value="2">2级</option>
			                                  </select>
			                              </div>
			                          	</div>
			                          	<div class="form-group parent_level" style="padding-bottom: 0px;display: none;">
			                              <label class="col-sm-2 col-sm-2 control-label">父级菜单</label>
			                              <div class="col-sm-10">
			                                  <select class="form-control" id="parent_menu">
			                                  </select>
			                              </div>
			                          	</div>
			                          	<div class="form-group" style="padding-bottom: 0px;">
			                              <label class="col-sm-2 col-sm-2 control-label">菜单权重</label>
			                              <div class="col-sm-10">
			                                  <input type="text" class="form-control is-required" onkeyup="value=value.replace(/[^\d]/g,'')" placeholder="输入数字" id="menu_index">
			                              </div>
			                          	</div>
			                          	<div class="form-group" style="padding-bottom: 0px;">
			                              <label class="col-sm-2 col-sm-2 control-label">图标</label>
			                              <div class="col-sm-10">
			                                  <input type="text" class="form-control" id="icon_address">
			                              </div>
			                          	</div>
			                          	<div class="form-group" style="padding-bottom: 0px;">
			                              <label class="col-sm-2 col-sm-2 control-label">权限说明</label>
			                              <div class="col-sm-10">
			                                  <input type="text" class="form-control is-required" id="p_desc">
			                              </div>
			                          	</div>
			                      	</form>	
				                	
				            </div>
				            <div class="modal-footer">
				                <button type="button" class="btn btn-default" data-dismiss="modal">取消
				                </button>
				                <button type="button" class="btn btn-primary" id="permision-submit">
				                    	添加
				                </button>
				            </div>
				        </div>
				    </div>
				</div>
				<!-- /.modal -->
				<button type="button" class="delSuccess" data-toggle="modal" data-target="#deleteTip" style="display: none;"></button>
				<div class="modal fade" id="deleteTip" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				    <div class="modal-dialog modal-dialog-centered" style="top: 150px;">
				        <div class="modal-content">
				            <div class="modal-header">
				                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
				                    &times;
				                </button>
				                <h4 class="modal-title" id="myModalLabel">
				                      	基佬提示
				                </h4>
				            </div>
				            <div class="modal-body">
								<h4> 删除OJBK了	</h4>				                	
				            </div>
				            <div class="modal-footer">
				                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				            </div>
				        </div>
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
		<script src="${pageContext.request.contextPath}/pages/system/permision.js"></script>

</body>
</html>