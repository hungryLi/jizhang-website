<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
	<!-- 登录弹出框 -->
	<button type="button" class="clickLogin" data-toggle="modal" data-target="#loginModel" style="display: none;"></button>
    <div class="modal fade" id="loginModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered" style="top: 200px;width: 355px;">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
	                    &times;
	                </button>
	                <h4 class="modal-title" id="myModalLabel">
	                                 	Sign iN
	                </h4>
	            </div>
	            <div class="modal-body">
	                	
						<div class="login-wrap">
				            <div class="form-group">
					            <input type="text" class="form-control" placeholder="User Name" autofocus id="userName">
				            </div>
				            <div class="form-group">
				            	<input type="password" class="form-control" placeholder="Password" id="passwd">
				            </div>
				            <label class="checkbox">
				            	<span class="pull-left" id="errorTip" style="color:#a94442;">
				            		 
				                </span>
				                <span class="pull-right">
				                    <a data-toggle="modal" href="login.html#myModal"> 忘记密码?</a>
				                </span>
				            </label>
				            <!-- <button class="btn btn-theme btn-block" id="toLogin" ><i class="fa fa-lock"></i> 登录</button> -->
				            <input type="button" class="btn btn-theme btn-block" id="toLogin" value="登陆" style="height:34px;"/>
				            <hr>
				            
				            <div class="registration">
				                	没有账户? &nbsp;
				                <a class="" href="javascript:void(0);" onclick="doRegist();">
				                    	创建账户
				                </a>
				            </div>
				
				        </div>
	                	
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default closeLogin" data-dismiss="modal">取消
	                </button>
	            </div>
	        </div><!-- /.modal-content -->
	    </div>
	</div>
	
	<!-- 注册弹出框 -->
	<button type="button" class="clickRegist" data-toggle="modal" data-target="#registerModel" style="display: none;"></button>
    <div class="modal fade" id="registerModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered" style="top: 200px;width: 355px;">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
	                    &times;
	                </button>
	                <h4 class="modal-title" id="myModalLabel">
	                                 	Regist
	                </h4>
	            </div>
	            <div class="modal-body">
	                	
						<div class="login-wrap">
				            <div class="form-group">
					            <input type="text" class="form-control" placeholder="User Name" autofocus id="userName">
				            </div>
				            <div class="form-group">
				            	<input type="password" class="form-control" placeholder="Password" id="passwd">
				            </div>
				            <label class="checkbox">
				            	<span class="pull-left" id="errorTip" style="color:#a94442;">
				            		 
				                </span>
				                <span class="pull-right">
				                    <a data-toggle="modal" href="login.html#myModal"> 忘记密码?</a>
				                </span>
				            </label>
				            <!-- <button class="btn btn-theme btn-block" id="toLogin" ><i class="fa fa-lock"></i> 登录</button> -->
				            <input type="button" class="btn btn-theme btn-block" id="toLogin" value="登陆" style="height:34px;"/>
				            <hr>
				            
				            <div class="registration">
				                	没有账户? &nbsp;
				                <a class="" href="#">
				                    	创建账户
				                </a>
				            </div>
				
				        </div>
	                	
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default closeLogin" data-dismiss="modal">取消
	                </button>
	            </div>
	        </div><!-- /.modal-content -->
	    </div>
	</div>
	<!-- 提示信息弹出框 -->

<script src="styles/js/jquery-1.12.3.min.js"></script>
<script src="${pageContext.request.contextPath}/pages/comm/js/comm.js"></script>
<script type="text/javascript">
	function popLogin(){
		$('#loginModel').modal('show');
	}
	function doRegist(){
		$('#loginModel').modal('hide');
		$('#registerModel').modal('show');
	}
	$(function(){
		$('#loginModel').on('hidden.bs.modal', function (e) {
			$('#loginModel input').val('');
		});
		
		$('#toLogin').on('click',function(){
			console.log('aaa');
			var userName = $.trim($('#userName').val());
			var passwd = $.trim($('#passwd').val());
			if(isBlank(userName)){
				$('#userName').focus().parent().addClass('has-error');
				$('#errorTip').text('请输入用户名');
				return ;
			}
			if(isBlank(passwd)){
				$('#passwd').focus().parent().addClass('has-error');
				$('#errorTip').text('请输入密码');
				return ;
			}
			doLogin(userName,passwd);
		});
		
		
		$('#userName').blur(function(){
			var name = $.trim($(this).val());
			if(!isBlank(name)){
				$(this).parent().removeClass('has-error');
				$('#errorTip').show().text('');
			}
		});
		$('#passwd').blur(function(){
			var pass = $.trim($(this).val());
			if(!isBlank(pass)){
				$(this).parent().removeClass('has-error');
				$('#errorTip').show().text('');
			}
		});
		
	});
	
	function doLogin(userName,passwd){
		$.ajax({
	        type: "POST",
	        url: "/doLogin",
	        dataType:'json',
	        data: {username:userName,password:passwd},
	        async: false,
	        beforeSend:function(){
	        	$('#toLogin').attr("disabled",true);
	        },
	        success:function(res){
	        	console.log(res);
	        	if(res.code){
	        		if(res.code != '10000'){
	        			$('#toLogin').attr("disabled",false);
	        			$('#errorTip').show().text('登录失败');
	        		}else{
	        			var html = '欢迎：<a href="#" style="color: white;">'+res.res_data+'</a> / <a class="logout" style="color: white;" href="/logout">Logout</a>';
	        			$('#userInfo').empty().append(html);
	        			$('#loginModel').modal('hide');
	        			initIndexLike();
	        		}
	        	}
	        }
	     });
		
	}

</script>	  