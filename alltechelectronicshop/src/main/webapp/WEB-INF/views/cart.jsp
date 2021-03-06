<!------ Include the above in your HEAD tag ---------->
<div class="container nnPadding">


	<c:if test="${not empty message}">
		
		<div class="alert alert-info">
			<h3 class="text-center">${message}</h3>
		</div>		
	
	</c:if>

	<c:choose>
		<c:when test="${not empty cartLines}">

			<table id="cart" class="table table-hover table-condensed">
				<thead>
					<tr>
						<th style="width: 50%">Product</th>
						<th style="width: 10%">Price</th>
						<th style="width: 8%">Quantity</th>
						<th style="width: 22%" class="text-center">Subtotal</th>
						<th style="width: 10%"></th>
					</tr>
				</thead>

				<tbody>

					<c:forEach items="${cartLines}" var="cartLine">
						<tr>
							<td data-th="Product">
								<div class="row">
									<div class="col-sm-2 hidden-xs">
										<img src="${images}/${cartLine.product.code}.jpg"
											alt="${cartLine.product.name}" class="img-responsive cartImg" />
									</div>
									<div class="col-sm-10">
										<h4 class="nomargin-mang">${cartLine.product.name}
											<c:if test="${cartLine.available == false}">
												<strong style="color: red">(Not Available)</strong>
											</c:if>
										</h4>
										<p class="nomargin-mang">Brand : ${cartLine.product.brand}</p>
									</div>
								</div>
							</td>
							<td data-th="Price">&#2547; ${cartLine.buyingPrice}</td>
							<td data-th="Quantity">
							     <input type="number" id="count_${cartLine.id}" min="1" max="3" class="form-control text-center" value="${cartLine.productCount}">
							</td>
							<td data-th="Subtotal" class="text-center">&#2547; ${cartLine.total}</td>
							<td class="actions" data-th="">
								<button type="button" name="refreshCart" value="${cartLine.id}" class="btn btn-info btn-sm"><i class="fa fa-refresh"></i>
								</button>
								<a href="${contextRoot}/cart/${cartLine.id}/delete" class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i></a>	
							</td>
						</tr>

					</c:forEach>

				</tbody>
				<tfoot>
					<tr>
						<td><a href="${contextRoot}/show/all/products" class="btn btn-warning"><i
								class="fa fa-angle-left"></i> Continue Shopping</a></td>
						<td colspan="2" class="hidden-xs"></td>
						<td class="hidden-xs text-center"><strong>Total &#2547; ${userModel.cart.grandTotal}</strong></td>
						<td><a href="#" class="btn btn-success btn-block">Checkout
								<i class="fa fa-angle-right"></i>
						</a></td>
					</tr>
				</tfoot>
			</table>

		</c:when>
		<c:otherwise>
			<div class="jumbotron">
				<div class="test-center">
					<h3>Your cart is empty!</h3>
				</div>
			</div>
		</c:otherwise>

	</c:choose>
</div>