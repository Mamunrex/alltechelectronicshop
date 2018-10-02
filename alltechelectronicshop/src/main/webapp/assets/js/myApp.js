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
								bSortable : false

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
									str += '<a href="'
											+ window.contextRoot
											+ '/cart/add/'
											+ data
											+ '/product" class="btn btn-success"><i class="fa fa-cart-plus" aria-hidden="true"></i></a>';

									return str;

								}

							} ]
				});
	}

});