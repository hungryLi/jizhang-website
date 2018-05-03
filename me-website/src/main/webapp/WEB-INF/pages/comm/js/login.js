$(function(){
	
	
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
        	console.log(res.code);
        	if(res.code){
        		if(res.code != '10000'){
        			$('#toLogin').attr("disabled",false);
        		}else{
        			console.log('to index');
        			window.location.herf = '/index';
        		}
        	}
        },
        complete:function(){
        	
        }
     });
	
}



function log(v){
	console.log(v);
}



