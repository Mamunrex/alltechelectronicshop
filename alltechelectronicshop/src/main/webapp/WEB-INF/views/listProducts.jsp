<div class="container mycss">
	<div class="row">
		<!-- Would be to display sidebar -->
		<div class="col-md-3 custome-list-product">

			<%@include file="./shared/sidebare.jsp"%>

		</div>
		<!-- to display the actual product -->
		<div class="col-md-9">
			<!-- Added breadcrumd component -->
			<div class="row">
				<div class="col-lg-12 custome-list-product1 ">

					<c:if test="${userClickAllProducts == true }">
						<script>
							window.categoryId = '';
						</script>
						<ol class="breadcrumb">
							<li><a href="${contextRoot}/home">Home/</a></li>
							<li class="active">All Products</li>
						</ol>
					</c:if>

					<c:if test="${userClickCategoryProducts == true }">
						<script>
							window.categoryId = '${category.id}';
						</script>
						<ol class="breadcrumb">
							<li><a href="${contextRoot}/home">Home/</a></li>
							<li class="active">Category/</li>
							<li class="active">${category.name}</li>
						</ol>
					</c:if>

				</div>
			</div>

			<div class="row">

				<div class="col-lg-12">


					<table id="productListTable"
						class="table table-striped table-borderd">


						<thead>

							<tr>

                                <th></th>	
								<th>Name</th>
								<th>Brand</th>
								<th>Price</th>
								<th>Available</th>
								<th></th>

							</tr>

						</thead>


						<tfoot>

							<tr>
							
							    <th></th>
								<th>Name</th>
								<th>Brand</th>
								<th>Price</th>
								<th>Available</th>
								<th></th>

							</tr>

						</tfoot>
					</table>

				</div>

			</div>

		</div>
	</div>
</div>