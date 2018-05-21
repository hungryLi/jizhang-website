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
	
		<title>记录消费信息</title>
	
		<!--external css-->
	    <link href="/assets/css/bootstrap.css" rel="stylesheet">
		<link href="/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
		<link href="/assets/css/style.css" rel="stylesheet">
	    <link href="/assets/css/style-responsive.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="/assets/lineicons/style.css">
	    
	    <link rel="stylesheet" type="text/css" href="/assets/css/zabuto_calendar.css">
	    <link rel="stylesheet" type="text/css" href="/assets/js/gritter/css/jquery.gritter.css" />
	    <script src="/assets/js/chart-master/Chart.js"></script>
	    <style type="text/css">
	    	.form-horizontal.style-form .form-group{
	    		border-bottom : 0px;
	    	}
	    	.form-horizontal .control-label{
	    		text-align: right;
	    	}
	    	.upload_images img{
	    		cursor: pointer;
	    	}
	    </style>
	</head>
<body>
	

		<section id="container">

			<jsp:include page="../header.jsp" flush="true" />

			<section id="main-content">
				<section class="wrapper">
					<h4>
						<i class="fa fa-angle-right"></i>
						消费信息
					</h4>
					
					<div class="row mt form-panel" style="margin-top: 20px;">
						<div class="col-lg-10">
							
							<div class="form-panel1" style="margin-top: 70px;">
								<h5>
								</h5>
								<div class="form-horizontal style-form role_ad_form" onsubmit="return false;">
		                          	<div class="form-group">
		                              <label class="col-sm-2 col-sm-2 control-label">消费了啥</label>
		                              <div class="col-sm-10">
		                                  <input type="text" class="form-control" id="consume_title">
		                              </div>
		                          	</div>
		                          	<div class="form-group">
		                              <label class="col-sm-2 col-sm-2 control-label">消费描述</label>
		                              <div class="col-sm-10">
		                                 <textarea class="form-control" rows="3" id="consume_desc"></textarea>
		                              </div>
		                          	</div>
		                          	<div class="form-group">
		                              <label class="col-sm-2 col-sm-2 control-label"></label>
		                              <div class="col-sm-10 upload_images">
		                              	  <form action="/consume/upload_img" method="POST" id="form_file1">
			                              	  <input type="file" name="pic_address" id="input_file1" class="file1" style="display: none;">
		                              	  </form>
		                              	  <form action="/consume/upload_img" method="POST" id="form_file2">
			                              	  <input type="file" name="pic_address" id="input_file2" class="file2" style="display: none;">
		                              	  </form>
		                                  <image alt="" src="/assets/img/image_add.jpg" class="fa fa-picture-o fa-4x" id="file1"  style="height: 150px;width: 150px;"/>
		                                  <image alt="" src="/assets/img/image_add.jpg" class="fa fa-picture-o fa-4x" id="file2" style="height: 150px;width: 150px;"/>
		                                  <input type="hidden" id="pic_address_file1">
		                                  <input type="hidden" id="pic_address_file2">
		                              </div>
		                          	</div>
		                          	<div class="form-group">
		                              <label class="col-sm-2 col-sm-2 control-label">总额</label>
		                              <div class="col-sm-10">
		                                  <input type="text" class="form-control is-required" id="price">
		                              </div>
		                          	</div>
		                          	<div class="form-group">
		                              <label class="col-sm-2 col-sm-2 control-label">地点</label>
		                              <div class="col-sm-10">
		                                  <input type="text" class="form-control is-required" id="consume_address">
		                              </div>
		                          	</div>
		                          	<div class="form-group">
		                              <label class="col-sm-2 col-sm-2 control-label">消费类型</label>
		                              <div class="col-sm-10">
		                                  <select class="form-control consume_type" >
		                                  	
		                                  </select>
		                              </div>
		                          	</div>
		                          	<div class="form-group">
		                              <label class="col-sm-2 col-sm-2 control-label">结算类型</label>
		                              <div class="col-sm-10">
		                                  <input type="radio" class="handler_type" name="handler_type" value="0" checked="checked">个人结算 &nbsp;&nbsp;
		                                  <input type="radio" class="handler_type" name="handler_type" value="1">账户圈结算
		                              </div>
		                          	</div>
		                          	<div class="form-group select_group" style="display: none;">
		                              <label class="col-sm-2 col-sm-2 control-label">选择账户圈</label>
		                              <div class="col-sm-10">
		                                  <select class="form-control acount_groups" >
		                                  	<!-- <option>602基佬圈</option>
		                                  	<option>地球村</option> -->
		                                  </select>
		                              </div>
		                          	</div>
		                          	<div class="form-group select_member" style="display: none;">
		                              <label class="col-sm-2 col-sm-2 control-label">参与人(自己除外)</label>
		                              <div class="col-sm-10 group_members">
		                                  <!-- <input type="checkbox" name="join_one" value="1">保健哥
		                                  <input type="checkbox" name="join_one" value="1">保健哥
		                                  <input type="checkbox" name="join_one" value="1">保健哥 -->
		                              </div>
		                          	</div>
		                          	<div class="form-group">
									    <div class="col-sm-offset-2 col-sm-10">
									      <button type="button" class="btn btn-default consume_add">添加</button>&nbsp;&nbsp;
									      <button type="button" class="btn btn-default consume_reset">重置</button>
									    </div>
								  	</div>
		                      	</div>	
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
				<button type="button" class="tipButton" data-toggle="modal" data-target="#tipModel" style="display: none;"></button>
				<div class="modal fade" id="tipModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				    <div class="modal-dialog modal-dialog-centered" style="top: 200px;">
				        <div class="modal-content">
				            <div class="modal-header">
				                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
				                    &times;
				                </button>
				                <h5 class="modal-title" id="myModalLabel">
				                            	提示
				                </h5>
				            </div>
				            <div class="modal-body">
				                <h5>请选择参与人</h5>	
				            </div>
				            <div class="modal-footer">
				                <button type="button" class="btn btn-default" data-dismiss="modal">CLOSE
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
		<script src="/assets/js/jquery.form.js"></script>
   		<script src="${pageContext.request.contextPath}/pages/comm/js/comm.js"></script>
		<script src="${pageContext.request.contextPath}/pages/consume/add_consume.js"></script>


</body>
</html>