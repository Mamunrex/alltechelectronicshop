 var $loginForm = $('#loginForm');
	
	if($loginForm.length) {
		
		$loginForm.validate({			
				rules: {
					username: {
						required: true,
						email: true
						
					},
					password: {
						required: true
					}				
				},
				messages: {					
					username: {
						required: 'Please enter your email!',
						email: 'Please enter a valid email address!'
					},
					password: {
						required: 'Please enter your password!'
					}					
				},
				errorElement : "em",
				errorPlacement : function(error, element) {
					// Add the 'help-block' class to the error element
					error.addClass("help-block");
					
					// add the error label after the input element
					error.insertAfter(element);
				}				
			}
		
		);
		
	}
	
	
	
//	 $('button[name="refreshCart"]').click(function(){
//		
//		var cartLineId = $(this).attr('value');
//		var countField = $('#count_' + cartLineId);
//		var originalCount = countElement.attr('value');
//		var currentCount = countElement.val('value');
//		
//		// do the checking only the count has changed
//		if(currentCount !== originalCount) {	
//			
//			if(currentCount < 1 || currentCount > 3) {
//				// set the field back to the original field
//				countElement.val(originalCount);
//				bootbox.alert({
//					size: 'medium',
//			    	title: 'Error',
//			    	message: 'Product Count should be minimum 1 and maximum 3!'
//				});
//			}
//			else {
//				// use the window.location.href property to send the request to the server
//				var updateUrl = window.contextRoot + '/cart/' + cartLineId + '/update?count=' + currentCount;
//				window.location.href = updateUrl;
//			}
//		}
//	});	
	
	

	
	
	