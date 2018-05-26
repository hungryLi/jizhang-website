var PAGE_NUM = 1;
$(function(){
	
	$(document).ready(function(){
		initList();
	});
	
});

function initList(){
	$.ajax({
        url: "/time/list_time",
        type: "POST",
        dataType:'json',
        data: {'page_num':PAGE_NUM,'page_size':4},
        success:function(res){
        	console.log(res);
        	if(res.code && res.count){
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
					        			'<div class="rateit1" style="margin:0.18em 0 0 1em;">';
					        			if(val.like_status == 0){
					        				lis += '<span class="fa fa-heart-o set_like heat-hover" style="margin-right:5px;cursor:pointer;" likeid="'+val.like_id+'" rid="'+val.id+'" title="添加喜欢" like="1"></span>';
					        			}else if(val.like_status == 1){
					        				lis += '<span class="fa fa-heart-o set_like like-color" style="margin-right:5px;cursor:pointer;" likeid="'+val.like_id+'" rid="'+val.id+'" title="取消喜欢" like="0"></span>';
					        			}
					        			
					    lis +=   				'<span>' +timestampToTime(val.consmue_time.time)+' </span>'+
					        			'</div>'+
//					        			'<div class="post-share">'+
//					        				'<span> '+timestampToTime(val.consmue_time.time)+'</span>'+
//					        			'</div>'+
					        			'<div class="clear"> </div>'+
					        		'</div>'+
					        	'</div>'+
					       ' </li>';
        			});
        			$('#tiles').imagesLoaded(function(){
        				$('#tiles').append(lis);
        				var wookmark1 = new Wookmark('#tiles', {
        					outerOffset: 40, // Optional, the distance to the containers border
        					itemWidth: 280, // Optional, the width of a grid item
        					offset:20
        				});
        				//解除重复绑定
        				$('.set_like').unbind('click').on('click',function(){
        					//var like_id = $(this).attr('likeid');
        					var r_id = $(this).attr('rid');
        					var like = $(this).attr('like');
        					isLike(r_id,like,this);
        				});
        				PAGE_NUM += 1;//页码加1
        			});
        		}
        	}
        }
     });

	function isLike(r_id,like,obj){
		$.post('/cancel_like',{'r_id':r_id,'like_status':like},function(res){
			console.log(res);
			if(res.code && res.code == '1000'){
				console.log(1);
				if(like == 0){
//					$(obj).css('color','red');
					$(obj).attr('title','添加喜欢');
					$(obj).attr('like','1');
					$(obj).addClass('heat-hover');
					$(obj).removeClass('like-color');
				}
				if(like == 1){
//					$(obj).css('color','red');
					$(obj).addClass('like-color');
					$(obj).attr('title','取消喜欢');
					$(obj).attr('like','0');
				}
			}
		},"json");
	}
}
