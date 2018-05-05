$(function(){
	
	// $('#roleModel').modal('show');  
	// $('#roleModel').modal('hide');
	$(document).ready(function(){
		list();
	});
	
	$('#roleModel').on('show.bs.modal', function (event) {
		console.log('show .......');
	  	var button = $(event.relatedTarget) // Button that triggered the modal
	  	var rid = $(button).attr("rid");
	  	var trObj = $('.role_'+rid);
	  	$('#role_name').val($(trObj).children('td').eq(1).text());
	  	$('#role_code').val($(trObj).children('td').eq(2).text());
	  	$('#role_desc').val($(trObj).children('td').eq(3).text());
	  	$('#role-submit').attr('r_id',rid);
//	    var modal = $(this)
//		modal.find('.modal-title').text('New message to ' + recipient);
//		modal.find('.modal-body input').val(recipient)
	});
	
	
//	编辑角色信息
	$('#role-submit').on('click',function(){
		var name = $.trim($('#role_name').val());
		var code = $.trim($('#role_code').val());
		var desc = $.trim($('#role_desc').val());
		var id = $(this).attr('r_id');
		if(isBlank(name)){
			$('#role_name').focus().parent().addClass('has-error');
			return ;
		}
		if(isBlank(code)){
			$('#role_code').focus().parent().addClass('has-error');
			return ;
		}
		if(isBlank(desc)){
			$('#role_desc').focus().parent().addClass('has-error');
			return ;
		}
		$.ajax({
			url:"/admin/role_update",
			type:"POST",
			dataType:"json",
			async:false,
			data:{'role_name':name,
				  'role_code':code,
				  'role_desc':desc,
				  'role_id':id
				},
			success:function(res){
				console.log(res);
				if(res.code == '1000'){
					$('#roleModel').modal('hide');
					list();
				}
			},
			error:function(){
				console.log('ajax error');
			}
		});
	
	});
	
	// 添加角色信息
	$('.role_add').on('click',function(){
		console.log('add ....');
		var name = $.trim($('#add_role_name').val());
		var code = $.trim($('#add_role_code').val());
		var desc = $.trim($('#add_role_desc').val());
		if(isBlank(name)){
			$('#add_role_name').focus().parent().addClass('has-error');
			return ;
		}
		if(isBlank(code)){
			$('#add_role_code').focus().parent().addClass('has-error');
			return ;
		}
		if(isBlank(desc)){
			$('#add_role_desc').focus().parent().addClass('has-error');
			return ;
		}
		$.ajax({
			url:"/admin/role_update",
			type:"POST",
			dataType:"json",
			async:false,
			data:{'role_name':name,
				  'role_code':code,
				  'role_desc':desc,
				  'role_id':''
				},
			success:function(res){
				console.log(res);
				if(res.code == '1000'){
					$('.role_ad_form input').val('');
					list();
				}
			},
			error:function(){
				console.log('ajax error');
			}
		});
	});
	
	$('.role_rest').on('click',function(){
		$('.role_ad_form input').val('');
	});
	
	$('.is-required').blur(function(){
		var val = $.trim($(this).val());
		if(!isBlank(val)){
			$(this).parent().removeClass('has-error');
		}
	});
	
	function list(){
		$.ajax({
			url:"/admin/role_list",
			type:"POST",
			dataType:"json",
			data:{'page_num':1,'page_size':50},
			success:function(res){
				console.log(res);
				if(res.code == '1000'){
					var trs = '';
					$.each(res.res_data,function(index,val){
						trs += '<tr class="role_'+val.id+'"><td>'+(index+1)+'</td>'+
							   '<td>'+val.role_name+'</td>'+
							   '<td>'+val.role_code+'</td>'+
							   '<td>'+val.role_desc+'</td>'+
							   '<td><button class="btn btn-primary btn-xs" data-toggle="modal" data-target="#roleModel" rid="'+val.id+'" title="编辑"><i class="fa fa-pencil"></i></button>&nbsp;'+
							   '<button class="btn btn-primary btn-xs" data-toggle="modal" rid="'+val.id+'" title="已有权限"><i class="glyphicon glyphicon-check"></i></button>&nbsp;'+
							   '<button class="btn btn-primary btn-xs" data-toggle="modal" rid="'+val.id+'" title="关联权限"><i class="glyphicon glyphicon-link"></i></button>&nbsp;</td></tr>';
					});
					$('#role_body').html('').append(trs);
				}
			},
			error:function(){
				console.log('ajax error');
			}
		});
	}
	
	
});
