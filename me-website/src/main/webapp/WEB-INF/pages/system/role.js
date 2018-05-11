var pageSize = 8; 
$(function(){
	
	$(document).ready(function(){
		list();
	});
	
	$('#roleModel').on('show.bs.modal', function (event) {
	  	var button = $(event.relatedTarget) // Button that triggered the modal
	  	var rid = $(button).attr("rid");
	  	var trObj = $('.role_'+rid);
	  	$('#role_name').val($(trObj).children('td').eq(1).text());
	  	$('#role_code').val($(trObj).children('td').eq(2).text());
	  	$('#role_desc').val($(trObj).children('td').eq(3).text());
	  	$('#role-submit').attr('r_id',rid);
	});
	
	$('.query_has_permision').on('click',function(){
		var pname = $(this).prev().val();
		queryHasPermisions(pname,1);
	})
	
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
							   '<button class="btn btn-primary btn-xs roleHas" data-toggle="modal" data-target="#role_has_permision" rid="'+val.id+'" title="已有权限"><i class="glyphicon glyphicon-check"></i></button>&nbsp;'+
							   '<button class="btn btn-primary btn-xs" data-toggle="modal" rid="'+val.id+'" title="关联权限"><i class="glyphicon glyphicon-link"></i></button>&nbsp;</td></tr>';
					});
					$('#role_body').html('').append(trs);
					$('.roleHas').on('click',function(){
						var rid = $(this).attr('rid');
						$('#has_p_id').val(rid);
						queryHasPermisions('',1);
					});
				}
			},
			error:function(){
				console.log('ajax error');
			}
		});
	}
	
	// 查询角色已有权限列表
	function queryHasPermisions(p_name,page_num){
		$.ajax({
			url:"/admin/role_has_permision_list",
			type:"POST",
			dataType:"json",
			data:{'page_num':page_num,'page_size':pageSize,'p_name':p_name,'r_id':$('#has_p_id').val()},
			success:function(res){
				console.log(res);
				var total = 1;
				if(res.code == '1000'){
					showHasPermisionData(res,page_num);
					if(res.count > 0){
						total = res.count;
					}
				}
				hasPagenator(page_num,total,p_name);
			},
			error:function(){ console.log('ajax error'); }
		});
	}
	function showHasPermisionData(res,page_num){
		var trs = '';
		$.each(res.res_data,function(idx,val){
			trs += '<tr><td>'+(idx + 1 + (page_num-1)*pageSize)+'</td>'+
				'<td>'+val.p_name+'</td>'+
				'<td>'+val.p_code+'</td>'+
				'<td>'+val.menu_name+'</td>';
		});
		$('#role_has_body').empty().append(trs);
	}
	function hasPagenator(page_num,total,p_name){
		var totalPages = total%pageSize == 0 ? (total/pageSize) : (parseInt(total/pageSize) + 1);
		var option = {
			    currentPage: page_num,
			    totalPages: totalPages,
			    size:"normal",
			    bootstrapMajorVersion:3,
			    alignment:'right',
			    numberOfPages:6,
			    itemTexts: function (type, page, current) {
			        switch (type) {
			        case "first": return "首页";
			        case "prev": return "上一页";
			        case "next": return "下一页";
			        case "last": return "末页";
			        case "page": return page;
			        }//默认显示的是第一页。
			    },
		        onPageClicked: function (event, originalEvent, type, page){//给每个页眉绑定一个事件，其实就是ajax请求，其中page变量为当前点击的页上的数字。
		            $.ajax({
		                url:'/admin/role_has_permision_list',
		                type:'POST',
		                data:{ 'page_num':page,'page_size':pageSize,'p_name':p_name,'r_id':$('#has_p_id').val() },
		                dataType:'JSON',
		                success:function (res) {
		                	console.log(res);
		                	showHasPermisionData(res,page);
		                }
		            })
		        }
		}
		$('#role_has_paginator').bootstrapPaginator(option);
	}
	
});
