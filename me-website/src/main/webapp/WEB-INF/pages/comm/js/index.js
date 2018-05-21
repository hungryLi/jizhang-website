$(function(){
	
	$(document).ready(function(){
		initIndexLike();
	});
	
});

// 初始化首页动态信息
function initIndexLike(){
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
	        		if(res.code == '1000' && res.count > 0){
	        			var lis = '';
	        			$.each(res.res_data,function(index,val){
	        				var left = (index % 3) * 300 + 145;
	        				var line = parseInt(index / 3) ;
	        				var top = 0;
	        				var height = 200;
	        				if(index % 3 == 1){
	        					height = 299;
	        				}
	        				if(index > 2){
		        				if(index % 3 == 0){
		        					top = line * 380;
		        				}
		        				if(index % 3 == 1){
		        					top = line * 480;
		        				}
		        				if(index % 3 == 2){
		        					top = line * 380;
		        				}
	        				}
	        				lis += '<li style="display: list-item; position: absolute; top: '+top+'px; left: '+left+'px;">'+
						        		'<img src="'+val.pic_address1+'" width="200" height="'+height+'">'+
						        		'<div class="post-info">'+
						        		'<div class="post-basic-info">'+
							        		'<h3><a href="#">'+val.consume_title+index+'</a></h3>'+
							        		'<span><label class="glyphicon glyphicon-map-marker" style="color:#ECC731;margin-right:5px;"></label>'+val.consume_address+'</span>'+
							        		'<p>'+val.consume_desc+'</p>'+
						        		'</div>'+
						        		'<div class="post-info-rate-share">'+
						        			'<div class="rateit1" style="margin:0.18em 0 0 1em;">'+
						        				'<span class="glyphicon glyphicon-heart-empty" style="color:red;margin-right:5px;"></span><span>' +timestampToTime(val.consmue_time.time)+' </span>'+
						        			'</div>'+
//						        			'<div class="post-share">'+
//						        				'<span> '+timestampToTime(val.consmue_time.time)+'</span>'+
//						        			'</div>'+
						        			'<div class="clear"> </div>'+
						        		'</div>'+
						        	'</div>'+
						       ' </li>';
	        			});
	        			$('#tiles').empty().append(lis);
	        		}
	        	}
	        }
	     });
	}
}