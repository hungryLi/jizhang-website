
var pageSize = 5; 
$(function(){
	$(document).ready(function(){
		permisionList(1);
	});
	
	$('.query_permision').on('click',function(){
		permisionList(1);
	});
	
	$('#myModal').on('show.bs.modal', function (event) {
		console.log('show .......');
	  	var button = $(event.relatedTarget) // Button that triggered the modal
	  	console.log($(button).attr("class"));
	    
	    
//	    var modal = $(this)
//		modal.find('.modal-title').text('New message to ' + recipient);
//		modal.find('.modal-body input').val(recipient)

	});
	
	
//	提交表单后隐藏
	$('#permisoin-submit').on('click',function(){
		console.log('success ....');
		
		$('#myModal').modal('hide');
	
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
				trs += '<td><button class="btn btn-primary btn-xs" data-toggle="modal" data-target="#roleModel" rid="'+val.id+'" title="编辑"><i class="fa fa-pencil"></i></button>&nbsp;'+
					   '<button class="btn btn-primary btn-xs" data-toggle="modal" rid="'+val.id+'" title="已有权限"><i class="glyphicon glyphicon-check"></i></button>&nbsp;'+
					   '<button class="btn btn-primary btn-xs" data-toggle="modal" rid="'+val.id+'" title="关联权限"><i class="glyphicon glyphicon-link"></i></button>&nbsp;</td></tr>';
			});
			$('#permision_body').html('').append(trs);
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


