$(function() {
	// solving the active menu problem
	switch (menu) {
	case 'About Us':
		$('#about').addClass('active');
		break;
	case 'Contact Us':
		$('#contact').addClass('active');
		break;
	case 'All Products':
		$('#listProduct').addClass('active');
		break;
	case 'Manage Product':
		$('#manageProduct').addClass('active');
		break;
	default:
		// $('#listProduct').addClass('active');
		$('a_' + menu).addClass('active');
		break;
	}

	// code for jaqurey dataTable

	var $table = $('#productListTable');

	if ($table.length) {

		var jsonUrl = '';
		if (window.categoryId == '') {
			jsonUrl = window.contextRoot + '/json/data/all/products';
		} else {
			jsonUrl = window.contextRoot + '/json/data/category/'
					+ window.categoryId + '/products';
		}

		$table
				.DataTable({
					lengthMenu : [ [ 5, 10, -1 ],
							[ '5 Recordes', '10 Recordes', 'All' ] ],

					ajax : {
						url : jsonUrl,
						dataSrc : ''
					},
					columns : [
							{
								data : 'code',
								bSortable : false,
								mRender : function(data, type, row) {

									return '<img src="' + window.contextRoot
											+ '/resources/images/' + data
											+ '.jpg" class="dataTableImg"/>';

								}
							},
							{
								data : 'name',
								bSortable : false

							},
							{
								data : 'brand',
								bSortable : false

							},
							{
								data : 'unitPrice',
								bSortable : false,
								mRender : function(data, type, row) {
									return '&#8377; ' + data
								}

							},
							{

								data : 'quantity',
								bSortable : false,
								mRender : function(data, type, row) {

									if (data < 1) {
										return '<span style="color:red">Out of Stock!</span>';
									}

									return data;

								}

							},
							{
								data : 'id',
								bSortable : false,
								mRender : function(data, type, row) {

									var str = '';
									str += '<a href="'
											+ window.contextRoot
											+ '/show/'
											+ data
											+ '/product" class="btn btn-primary"><i class="fa fa-eye" aria-hidden="true"></i></a>&#160;&#160;';
									

									if (row.quantity < 1) {
										str += '<a href="javascript:void(0)" class="btn btn-success disabled"><i class="fa fa-cart-plus" aria-hidden="true"></i></a>';
									} else {

										str += '<a href="'
											+ window.contextRoot
											+ '/cart/add/'
											+ data
											+ '/product" class="btn btn-success"><i class="fa fa-cart-plus" aria-hidden="true"></i></a>';
									}

									return str;

								}

							} ]
				});
	}
	

	/*------*/
	/* for fading out the alert message after 3 seconds */
	var $alert = $('.alert');
	if($alert.length) {
		setTimeout(function() {
	    	$alert.fadeOut('slow');
		   }, 3000
		);		
	}
	
	
	//========================================
//			$('.switch input[type="checkbox"]').on('change' , function() {
//				
//				var checkbox = $(this);
//				var checked = checkbox.prop('checked');
//				var dMsg = (checked)? 'You want to activate the product':'You want to deactivate the product?';
//				var value = checkbox.prop('value');
//				bootbox.confirm({
//					size: 'medium',
//					title: 'Product Activation & Deactivaton',
//					message: dMsg,
//					callback: function(confirmed){
//						if(confirmed){
//							
//							console.log(value);
//							bootbox.alert({
//								size: 'medium',
//								title: 'Informaton',
//								message: 'You are going to perform operation on product' + value
//								
//							});
//							
//						}else{
//							checkbox.prop('checked', !checked);
//						}
//					}
//					
//				});
//				
//			});
//			
	
	// =============== Data table for admin =============

	var $adminProductTable= $('#adminProductTable');

	if ($adminProductTable.length) {

		var jsonUrl = window.contextRoot +'/json/data/admin/all/products';

		$adminProductTable.DataTable({
					lengthMenu : [ [ 5, 10, -1 ],
							[ '10 Recordes', '30 Recordes', 'All' ] ],

					ajax : {
						url : jsonUrl,
						dataSrc : ''
					},
					columns : [
						    {
							    data: 'id'
						    },
							{
								data : 'code',
								bSortable : false,
								mRender : function(data, type, row) {

									return '<img src="' + window.contextRoot
											+ '/resources/images/' + data
											+ '.jpg" class="adminDataTableImage"/>';

								}
							},
							{
								data : 'name',
								bSortable : false

							},
							{
								data : 'brand',
								bSortable : false

							},
							{

								data : 'quantity',
								bSortable : false,
								mRender : function(data, type, row) {

									if (data < 1) {
										return '<span style="color:red">Out of Stock!</span>';
									}

									return data;

								}

							},
							{
								data : 'unitPrice',
								bSortable : false,
								mRender : function(data, type, row) {
									return '&#8377; ' + data
								}

							},
							{
								data : 'active',
								bSortable : false,
								mRender : function(data, type, row) {
                                     var str = '';
                                     
                                     str +=  '<label class="switch">' 
                                    	 
                                     if(data){
                                    	 str +=  '<input type="checkbox" checked="checked" value="'+row.id+'"/>';
                                     }else{
                                    	 str +=  '<input type="checkbox" value="'+row.id+'"/>';
                                     }
                                    
                                     str +=	'<div class="slider"></div> </label>';
     							     
                                     return str;

								}

							},
							 {
								data: 'id',
								bSortable : false,
								mRender : function(data, type, row) {
									var str = '';
									str += '<a href="'+window.contextRoot+'/manage/'+data+'/product" class="btn btn-primary">';
									str += '<i class="fa fa-edit aria-hidden="true"></i></a>';
									
									return str;
								}
									
							}
							]
					//,
							// ================= switch ===========
							
//							initComplete: function () {
//								var api = this.api();
//								api.$('.switch input[type="checkbox"]').on('change' , function() {			
									
//									var dText = (this.checked)? 'You want to activate the Product?': 'You want to de-activate the Product?';
//									var checked = this.checked;
//									var checkbox = $(this);
//									debugger;
//								    bootbox.confirm({
//								    	size: 'medium',
//								    	title: 'Product Activation/Deactivation',
//								    	message: dText,
//								    	callback: function (confirmed) {
//									        if (confirmed) {
//									            $.ajax({							            	
//									            	type: 'GET',
//									            	url: window.contextRoot + '/manage/product/'+checkbox.prop('value')+'/activation',
//									        		timeout : 100000,
//									        		success : function(data) {
//									        			bootbox.alert(data);							        										        			
//									        		},
//									        		error : function(e) {
//									        			bootbox.alert('ERROR: '+ e);
//									        			//display(e);
//									        		}						            	
//									            });
//									        }
//									        else {							        	
//									        	checkbox.prop('checked', !checked);
//									        }
//								    	}
//								    });																											
//								});
//									
//							}
							
							// =================== End Switch ========
				});
	}
	
	//================= end data table for adimin =============
	
	
	//=======validation code for category========
	
	


});