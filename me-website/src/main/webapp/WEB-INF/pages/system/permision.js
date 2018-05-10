
var pageSize = 10; 
$(function(){
	$(document).ready(function(){
		permisionList(1);
	});
	
	$('.query_permision').on('click',function(){
		permisionList(1);
	});
	
	$('#menu_type').change(function(){
		var level = $(this).val();
		if(level == 1){
			$('.parent_level').fadeOut();
			$('#parent_menu').val('');
		}else if(level == 2){
			$('.parent_level').fadeIn();
			parentMenus(null);
		}
	});
	
	$('.is-required').blur(function(){
		var val = $.trim($(this).val());
		if(!isBlank(val)){
			$(this).parent().removeClass('has-error');
		}
	});
	
	$('#permissionEdit').on('show.bs.modal', function (event) {
		console.log('show .......');
	  	var button = $(event.relatedTarget) // Button that triggered the modal
	});
	
	$('#permissionEdit').on('hidden.bs.modal', function (e) {
		$('#permissionEdit input').val('');
		$('#permissionEdit select').val('');
		var type = $('#menu_type').val();
	  	if(type == 1){
	  		$('.parent_level').hide();
	  	}
	});
	$('#deleteTip').on('show.bs.modal', function (event) {});
	
	
	// 权限添加，提交表单后隐藏
	$('#permision-submit').on('click',function(){
		var flag = true;
		$.each($('.is-required'),function(idx,obj){
			if(isBlank($(obj).val())){
				$(obj).parent().addClass('has-error');
				flag = false;
			}
		});
		console.log(flag);
		if(!flag) return ;
		$.ajax({
			url:"/admin/permision_add",
			type:"POST",
			dataType:"json",
			data:{
				'p_name':$('#p_name1').val(),
				'p_code':$('#p_code').val(),
				'menu_name':$.trim($('#menu_name').val()),
				'menu_type': $('#menu_type').val(),
				'parent_menu':$('#menu_type').val() == 1 ? '' : $('#parent_menu').val(),
				'icon_type':2,
				'icon_address':$('#icon_address').val(),
				'menu_href':$('#menu_href').val(),
				'menu_index':$('#menu_index').val(),
				'p_desc':$('#p_desc').val()
			},
			success:function(res){
				console.log(res);
				if(res.code && res.code == '1000'){
					$('#permissionEdit').modal('hide');
					permisionList(1);
				}
			},
			error:function(){
				console.log('ajax error');
			}
		});
	
	});
	
	// 权限列表
	function permisionList(page_num){
		$.ajax({
			url:"/admin/permision_list",
			type:"POST",
			dataType:"json",
			data:{
				'page_num':page_num,
				'page_size':pageSize,
				'p_name':$.trim($('#p_name').val())
			},
			success:function(res){
				console.log(res);
				var total = 1;
				if(res.code && res.code == '1000'){
					showData(res,page_num);
					if(res.count && res.count > 0){
						total = res.count;
					}
				}
				pagenator(page_num,total);
			},
			error:function(){
				console.log('ajax error');
			}
		});
	}
	
	function parentMenus(p_id){
		$.ajax({
			url:"/admin/parent_permision_list",
			type:"POST",
			dataType:"json",
			data:{},
			success:function(res){
				console.log(res);
				if(res.code && res.code == '1000'){
					var options = '';
					$.each(res.res_data,function(index,val){
						options += '<option value="'+val.id+'">'+val.menu_name+'</option>';
					});
					$('#parent_menu').empty().append(options);
				}
				if(isBlank(p_id)){
					$('#parent_menu').val(p_id);
				}
			},
			error:function(){
				console.log('ajax error');
			}
		});
	}
	
	function showData(res,page_num){
		if(res.code == '1000'){
			var trs = '';
			$.each(res.res_data,function(index,val){
				trs += '<tr class="role_'+val.id+'"><td>'+(index + 1 + (page_num-1)*pageSize)+'</td>'+
					   '<td>'+val.p_name+'</td>'+
					   '<td>'+val.p_code+'</td>'+
					   '<td>'+val.menu_name+'</td>'+
					   '<td>'+val.menu_type+'级</td>'+
					   '<td>'+val.menu_href+'</td>';
				if(val.icon_type == 1){
					trs += '<td><img src="'+val.icon_address+'" style="width:25px;height:25px;"></td>';
				}else if(val.icon_type == 2){
					trs += '<td><i class="fa '+val.icon_address+'"></i></td>';
				}
				trs += '<td><button class="btn btn-primary btn-xs" data-toggle="modal" data-target="#roleModel" rid="'+val.id+'" title="编辑权限"><i class="fa fa-pencil"></i></button>&nbsp;'+
					   '<button class="btn btn-danger btn-xs delPermision" pid="'+val.id+'" title="删除权限"><i class="fa fa-trash-o"></i></button>&nbsp;</td></tr>';
			});
			$('#permision_body').html('').append(trs);
			$('.delPermision').on('click',function(){
				var p_id = $(this).attr('pid');
				$.ajax({
					url:"/admin/permision_dele",
					type:"POST",
					dataType:"json",
					data:{'p_id':p_id},
					success:function(res){
						console.log(res);
						if(res.code && res.code == '1000'){
							$('.delSuccess').click();
//							$('#deleteTip').modal('hide');
							permisionList(1);
						}
					}
				});
			});
		}
	}
	
	function pagenator(page_num,total){
		var totalPages = total%pageSize == 0 ? (total/pageSize) : (parseInt(total/pageSize) + 1);
		var option = {
			    currentPage: page_num,
			    totalPages: totalPages,
			    size:"normal",
			    bootstrapMajorVersion:3,
			    alignment:'right',
			    numberOfPages:5,
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
		                url:'/admin/permision_list',
		                type:'POST',
		                data:{
		    				'page_num':page,
		    				'page_size':pageSize,
		    				'p_name':$.trim($('#p_name').val())
		    			},
		                dataType:'JSON',
		                success:function (res) {
		                	console.log(res);
		                	showData(res,page);
		                }
		            })
		        }
		}
		$('#p_pagenator').bootstrapPaginator(option);
	}
	
})


