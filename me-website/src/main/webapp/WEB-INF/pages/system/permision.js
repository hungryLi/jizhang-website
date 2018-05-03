
$(function(){
	
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
	
	
})


