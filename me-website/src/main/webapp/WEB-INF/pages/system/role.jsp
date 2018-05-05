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
	
		<link href="/assets/css/bootstrap.css" rel="stylesheet">
		<!--external css-->
		<link href="/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="/assets/js/gritter/css/jquery.gritter.css" />
		<link rel="stylesheet" type="text/css" href="/assets/lineicons/style.css">
	
		<!-- Custom styles for this template -->
		<link href="/assets/css/style.css" rel="stylesheet">
		<link href="/assets/css/style-responsive.css" rel="stylesheet">
	</head>
<body>
	

		<section id="container">

			<header class="header black-bg">
				<div class="sidebar-toggle-box">
					<div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
				</div>
				<!--logo start-->
				<a href="index.html" class="logo"><b>JIZHANG SYSTEM</b></a>
				<!--logo end-->
				<div class="nav notify-row" id="top_menu">
					<!--  notification start -->
					<ul class="nav top-menu">
						<!-- settings start -->
						<li class="dropdown">
							<a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
								<i class="fa fa-tasks"></i>
								<span class="badge bg-theme">4</span>
							</a>
							<ul class="dropdown-menu extended tasks-bar">
								<div class="notify-arrow notify-arrow-green"></div>
								<li>
									<p class="green">You have 4 pending tasks</p>
								</li>
								<li>
									<a href="index.html#">
										<div class="task-info">
											<div class="desc">Database Update</div>
											<div class="percent">60%</div>
										</div>
										<div class="progress progress-striped">
											<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
												<span class="sr-only">60% Complete (warning)</span>
											</div>
										</div>
									</a>
								</li>
								<li>
									<a href="index.html#">
										<div class="task-info">
											<div class="desc">Payments Sent</div>
											<div class="percent">70%</div>
										</div>
										<div class="progress progress-striped">
											<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width: 70%">
												<span class="sr-only">70% Complete (Important)</span>
											</div>
										</div>
									</a>
								</li>
								<li class="external">
									<a href="#">See All Tasks</a>
								</li>
							</ul>
						</li>
						<!-- settings end -->
						<!-- inbox dropdown start-->
						<li id="header_inbox_bar" class="dropdown">
							<a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
								<i class="fa fa-envelope-o"></i>
								<span class="badge bg-theme">5</span>
							</a>
							<ul class="dropdown-menu extended inbox">
								<div class="notify-arrow notify-arrow-green"></div>
								<li>
									<p class="green">You have 5 new messages</p>
								</li>
								<li>
									<a href="index.html#">
										<span class="photo"><img alt="avatar" src="assets/img/ui-danro.jpg"></span>
										<span class="subject">
                                    <span class="from">Dan Rogers</span>
										<span class="time">2 hrs.</span>
										</span>
										<span class="message">
                                        Love your new Dashboard.
                                    </span>
									</a>
								</li>
								<li>
									<a href="index.html#">
										<span class="photo"><img alt="avatar" src="assets/img/ui-sherman.jpg"></span>
										<span class="subject">
                                    <span class="from">Dj Sherman</span>
										<span class="time">4 hrs.</span>
										</span>
										<span class="message">
                                        Please, answer asap.
                                    </span>
									</a>
								</li>
								<li>
									<a href="index.html#">See all messages</a>
								</li>
							</ul>
						</li>
						<!-- inbox dropdown end -->
					</ul>
					<!--  notification end -->
				</div>
				<div class="top-menu">
					<ul class="nav pull-right top-menu">
						<li>
							<a class="logout" href="login.html">Logout</a>
						</li>
					</ul>
				</div>
			</header>
			<!--header end-->

			<aside>
				<div id="sidebar" class="nav-collapse" style="z-index: 99;">
					<!-- sidebar menu start-->
					<ul class="sidebar-menu" id="nav-accordion">
						<!--用户头像 以及名称-->
						<p class="centered">
							<a href="profile.html"><img src="assets/img/ui-sam.jpg" class="img-circle" width="60"></a>
						</p>
						<h5 class="centered">Likang</h5>

						<li class="mt">
							<a class="active" href="index.html">
								<i class="fa fa-dashboard"></i>
								<span>单独菜单</span>
							</a>
						</li>
						<li class="sub-menu">
							<a href="javascript:;">
								<i class="fa fa-desktop"></i>
								<span>账户圈管理</span>
							</a>
							<ul class="sub">
								<li>
									<a href="calendar.html">账户圈信息</a>
								</li>
								<li>
									<a href="gallery.html">账户圈申请</a>
								</li>
								<!--<li><a  href="todo_list.html">Todo List</a></li>-->
							</ul>
						</li>
						<li class="sub-menu">
							<a href="javascript:;">
								<i class="fa fa-tasks"></i>
								<span>圈动态</span>
							</a>
							<ul class="sub">
								<li>
									<a href="form_component.html">发布动态</a>
								</li>
								<li>
									<a href="form_component.html">发布公告</a>
								</li>
							</ul>
						</li>
						<li class="sub-menu">
							<a href="javascript:;">
								<i class="fa fa-cogs"></i>
								<span>系统管理</span>
							</a>
							<ul class="sub">
								<li>
									<a href="permision.html">权限管理</a>
								</li>
								<li>
									<a href="panels.html">角色管理</a>
								</li>
								<li>
									<a href="panels.html">用户管理</a>
								</li>
							</ul>
						</li>
						<li class="sub-menu">
							<a href="javascript:;">
								<i class="fa fa-bar-chart-o"></i>
								<span>系统报表</span>
							</a>
							<ul class="sub">
								<li>
									<a href="blank.html">用户量概况</a>
								</li>
								<li>
									<a href="blank1.html">消费流水</a>
								</li>
								<li>
									<a href="login.html">账单报表</a>
								</li>
								<li>
									<a href="lock_screen.html">Lock Screen</a>
								</li>
							</ul>
						</li>

						<li class="sub-menu">
							<a href="javascript:;">
								<i class="fa fa-th"></i>
								<span>Data Tables</span>
							</a>
							<ul class="sub">
								<li>
									<a href="basic_table.html">Basic Table</a>
								</li>
								<li>
									<a href="responsive_table.html">Responsive Table</a>
								</li>
							</ul>
						</li>
						<li class="sub-menu">
							<a href="javascript:;">
								<i class=" fa fa-bar-chart-o"></i>
								<span>Charts</span>
							</a>
							<ul class="sub">
								<li>
									<a href="morris.html">Morris</a>
								</li>
								<li>
									<a href="chartjs.html">Chartjs</a>
								</li>
							</ul>
						</li>

					</ul>
					<!-- sidebar menu end-->
				</div>
			</aside>
			<!--sidebar end-->
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
				
				<!-- 模态框（Modal） -->
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
			                                  <input type="text" class="form-control is-required" id="role_code">
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
				
				
			</section>

			<!--footer start-->
			<footer class="site-footer" style="position: absolute;width: 100%;bottom: 0;">
				<div class="text-center">
					2018 - shenZhen -likang
					<a href="index.html#" class="go-top">
						<i class="fa fa-angle-up"></i>
					</a>
				</div>
			</footer>
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

		<!--script for this page-->
		<script src="/assets/js/sparkline-chart.js"></script>
		<script src="/assets/js/zabuto_calendar.js"></script>
   		<script src="${pageContext.request.contextPath}/pages/comm/js/comm.js"></script>
		<script src="${pageContext.request.contextPath}/pages/system/role.js"></script>

		<script type="text/javascript">
			
			$(document).ready(function() {
				var unique_id = $.gritter.add({
					// (string | mandatory) the heading of the notification
					title: 'Welcome to Dashgum!',
					// (string | mandatory) the text inside the notification
					text: 'Hover me to enable the Close Button. You can hide the left sidebar clicking on the button next to the logo. Free version for <a href="" target="_blank" style="color:#ffd777">BlackTie.co</a>.',
					// (string | optional) the image to display on the left
					image: 'assets/img/ui-sam.jpg',
					// (bool | optional) if you want it to fade out on its own or just sit there
					sticky: true,
					// (int | optional) the time you want it to be alive for before fading out
					time: '',
					// (string | optional) the class name you want to apply to that specific message
					class_name: 'my-sticky-class'
				});

				return false;
			});
		</script>

		<script type="application/javascript">
			$(document).ready(function() {
				$("#date-popover").popover({
					html: true,
					trigger: "manual"
				});
				$("#date-popover").hide();
				$("#date-popover").click(function(e) {
					$(this).hide();
				});

				$("#my-calendar").zabuto_calendar({
					action: function() {
						return myDateFunction(this.id, false);
					},
					action_nav: function() {
						return myNavFunction(this.id);
					},
					ajax: {
						url: "show_data.php?action=1",
						modal: true
					},
					legend: [{
							type: "text",
							label: "Special event",
							badge: "00"
						},
						{
							type: "block",
							label: "Regular event",
						}
					]
				});
			});

			function myNavFunction(id) {
				$("#date-popover").hide();
				var nav = $("#" + id).data("navigation");
				var to = $("#" + id).data("to");
				console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
			}
		</script>
</body>
</html>