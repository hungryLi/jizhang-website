$(function(){
	
	// $('#roleModel').modal('show');  
	// $('#roleModel').modal('hide');
	
	$('#roleModel').on('show.bs.modal', function (event) {
		console.log('show .......');
	  	var button = $(event.relatedTarget) // Button that triggered the modal
	  	console.log($(button).attr("class"));
	    
	    
//	    var modal = $(this)
//		modal.find('.modal-title').text('New message to ' + recipient);
//		modal.find('.modal-body input').val(recipient)
		$('#role_name').val('admin');
		$('#role_code').val('jizahng.website.admin');
		$('#role_desc').val('this is admin desc');

	});
	
	
//	提交表单后隐藏
	$('#role-submit').on('click',function(){
		console.log('success ....');
		
		$('#roleModel').modal('hide');
	
	});
	
	
	
	
	
});
