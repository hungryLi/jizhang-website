$(function(){
	
	$(document).ready(function(){
		initList();
	});
	
});

// 初始化首页动态信息
function initList(){
	var pageflag = $('#main').attr('page');
	if(!isBlank(pageflag) && pageflag == 'index'){
		$.ajax({
	        url: "/index_activity",
	        type: "POST",
	        dataType:'json',
	        data: {},
	        success:function(res){
	        	console.log(res);
	        	if(res.code && res.count){
	        		$('#tiles').empty();
	        		if(res.code == '1000' && res.count >= 0){
	        			var lis = '';
	        			$.each(res.res_data,function(index,val){
	        				var height = 200;
	        				if(index % 3 == 1){
	        					height = 299;
	        				}
	        				lis += '<li style="width:280px;">'+
						        		'<img src="'+val.pic_address1+'" width="200" height="'+height+'">'+
						        		'<div class="post-info">'+
						        		'<div class="post-basic-info">'+
							        		'<h3><a href="#" style="text-align:left;">'+val.consume_title+'</a></h3>'+
							        		'<span><label class="glyphicon glyphicon-map-marker" style="color:#ECC731;margin-right:5px;"></label>'+val.consume_address+'</span>'+
							        		'<p>'+val.consume_desc+'</p>'+
						        		'</div>'+
						        		'<div class="post-info-rate-share">'+
						        			'<div class="rateit1" style="margin:0.18em 0 0 1em;">'+
						        				'<span class="glyphicon glyphicon-heart-empty cancle_like" style="color:red;margin-right:5px;cursor:pointer;" likeid="'+val.like_id+'" rid="'+val.id+'" title="取消喜欢"></span><span>' +timestampToTime(val.consmue_time.time)+' </span>'+
						        			'</div>'+
//						        			'<div class="post-share">'+
//						        				'<span> '+timestampToTime(val.consmue_time.time)+'</span>'+
//						        			'</div>'+
						        			'<div class="clear"> </div>'+
						        		'</div>'+
						        	'</div>'+
						       ' </li>';
	        			});
	        			$('#tiles').imagesLoaded(function(){
	        				
	        				$('#tiles').empty().append(lis);
	        				var wookmark1 = new Wookmark('#tiles', {
	        					outerOffset: 40, // Optional, the distance to the containers border
	        					itemWidth: 280, // Optional, the width of a grid item
	        					offset:20
	        				});
	        				$('.cancle_like').on('click',function(){
	        					var like_id = $(this).attr('likeid');
	        					var r_id = $(this).attr('rid');
	        					cancelLike(like_id,r_id);
	        				});
	        			});
	        		}
	        	}
	        }
	     });
	}
}

//取消喜欢
function cancelLike(like_id,r_id){
	$.post('/cancel_like',{'like_id':like_id,'r_id':r_id,'like_status':0},function(res){
		console.log(res);
		if(res.code && res.code == '1000'){
			initList();
//			$('#tiles').trigger('refreshWookmark');
		}
	},"json");
}

