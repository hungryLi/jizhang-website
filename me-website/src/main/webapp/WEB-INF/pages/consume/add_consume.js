 
$(function(){
	var userId = $('#user_id').val();
	$(document).ready(function(){
		listConsumeType();
	});
	
	$('.consume_add').on('click',function(){
		addConsume();
	});
	
	$('.is-required').blur(function(){
		var val = $.trim($(this).val());
		if(!isBlank(val)){
			$(this).parent().removeClass('has-error');
		}
	});
	
	$('.upload_images img').on('click',function(){
		var id = $(this).attr('id');
		$('#input_'+id).click();
	});
	$('input[type="file"]').change(function(){
		console.log($(this).val());
		var cls = $(this).attr('class');
		if(isImage($(this))){
			$(this).parent().ajaxSubmit({
				success:function(res){
					console.log(res);
					if(res.code == '1000'){
						$('#'+cls).attr('src',res.res_data);
						$('#pic_address_'+cls).val(res.res_data);
					}else{
						$('#'+cls).attr('src','');
						$('#pic_address_'+cls).val('');
					}
				}
			});
		}
	});
	
	//文件格式，大小控制
	function isImage(obj){
		var filePath = $(obj).val();
		console.log(filePath);
	    var startIndex = filePath.lastIndexOf(".");  
	    if(startIndex != -1) {
	    	var suffix = filePath.substring(startIndex+1, filePath.length).toLowerCase();
	    	if("jpg"!=suffix && "jpeg"!=suffix && "bmp"!=suffix && "png"!=suffix && "gif"!=suffix){  
	            $(obj).val("");  
	            alert("请上传JPG,JPEG,BMP,PNG,GIF格式的图片"); 
	            return false;
	        }
	    	var fileSize = $(obj)[0].size / 1024;  
	        if(fileSize > 2048){  
	            alert("图片大小不能超过2MB");
	            return false;
	        }  
	    	return true;
	    }
	    else false;  
	} 
	
	//结算类型切换
	$('.handler_type').change(function(){
		var val = $(this).val();
		if(val == 1){
			$('.select_group').fadeIn();
			// 圈结算
			$('.select_group').show();
			$.ajax({ url:"/consume/query_groups",type:"POST", dataType:"json", async:false,data:{},
				success:function(res){
					console.log(res);
					if(res.code == '1000'){
						var options = '<option value="">--请选择--</option>';
						$.each(res.res_data,function(index,val){
							options += '<option value="'+val.group_id+'">'+val.group_name+'</option>';
						});
						$('.acount_groups').empty().append(options);
					}
				},
				error:function(){
					console.log('ajax error');
				}
			});
		}
		if(val == 0){
			// 个人结算
			$('.select_group').fadeOut();
			$('.select_member').fadeOut();
			$('.select_group select').empty();
			$('.group_members').empty();
		}
	});
	
	//账户圈切换
	$('.acount_groups').change(function(){
		var groupId = $(this).val();
		if(isBlank(groupId)) {
			$('.group_members').empty();
			return ;
		}
		$('.acount_groups').parent().removeClass('has-error'); // 去掉红色警告边框
		$('.select_member').fadeIn();
		$.post("/consume/query_groups_members",{'group_id':groupId},function(res){
			console.log(res);
			if(res.code == '1000'){
				var boxs = '';
				$.each(res.res_data,function(index,val){
					if(val.id != userId){
						boxs += '<input type="checkbox" name="member_box" value="'+val.id+'">'+val.user_name+' &nbsp;&nbsp;';
					}
				});
				if(isBlank(boxs)){
					$('.group_members').empty().append('<span>该圈没有其他成员了</span> <input type="hidden" name="member_box" value="">');
				}else{
					$('.group_members').empty().append(boxs);
				}
			}
		},"json");
	});
	
	// 添加消费记录
	function addConsume(){
		var flag = true;
		$.each($('.role_ad_form .is-required'),function(idx,obj){
			if(isBlank($(obj).val())){
				$(obj).parent().addClass('has-error');
				flag = false;
			}
		});
		console.log(flag);
		if(!flag) return ;
		var handlerType = $("input[name='handler_type']:checked").val();
		var groupId = $('.acount_groups').val();
		var memberArr = new Array();
		if(handlerType == 1){
			//账户圈结算 校验圈信息
			if(isBlank(groupId)){
				$('.acount_groups').parent().addClass('has-error');
				return ;
			}
			//圈用户校验
			$.each($('input[name="member_box"]'),function(idx,val){
				if(!isBlank($(this).val()) && $(this).is(':checked')){
					memberArr.push($(this).val());
				}
			});
			console.log(memberArr.length);
			if(memberArr.length == 0){
				$('.tipButton').click();
				return ;
			}
		}
		$.ajax({
			url:"/consume/add",
			type:"POST",
			dataType:"json",
			async:false,
			data:{
				  'consume_title':$('#consume_title').val(),
				  'consume_desc':$('#consume_desc').val(),
				  'pic_address1':$('#pic_address_file1').val(),
				  'pic_address2':$('#pic_address_file2').val(),
				  'price':$.trim($('#price').val()),
				  'consume_type':$('.consume_type').val(),
				  'consume_address':$('#consume_address').val(),
				  'handler_type':handlerType,
				  'group_id':groupId,
				  'user_ids':'['+memberArr.toString()+']'   //圈成员ids
				},
			success:function(res){
				console.log(res);
				if(res.code == '1000'){
					$('.role_ad_form input').val('');
				}
			},
			error:function(){
				console.log('ajax error');
			}
		});
	}
	
	function listConsumeType(){
		$.post("/consume/query_consume_types",{},function(res){
			if(res.code && res.code == '1000'){
				var opts = '';
				$.each(res.res_data,function(index,val){
					opts += '<option value="'+val.id+'">'+val.name+'</options>';
				})
				$('.consume_type').empty().append(opts);
			}
		},"json");
	}
	
});
