<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<div class="mHeader">
	<h3>Admin Panel</h3>
</div>

<div class="mHeader2">
	<div class="centerRow">
		<div class="row">
			<c:if test="${not empty message}">
				<div class="col-xs-8">
					<div class="alert alert-success alert-dismissible">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						${message}
					</div>
				</div>
			</c:if>
		</div>
	</div>
</div>

<div class="mMainContent">
	<div class="mMainheader">
		<h4>Product Managment</h4>
	</div>
	<div class="mBody">
		<!-- Form design start -->
		<sf:form modelAttribute="product"
			action="${contextRoot}/manage/products" method="POST"
			enctype="multipart/form-data">
			<div class="row">
				<div class="col">
					<sf:input type="text" path="name" id="name" class="form-control"
						placeholder="Product Name" />
					<div class="colorRed">
						<sf:errors path="name" cssClass="help-block" element="em" />
					</div>
				</div>
				<div class="col">
					<sf:input type="text" path="brand" id="brand" class="form-control"
						placeholder="Brand Name" />
					<div class="colorRed">
						<sf:errors path="brand" cssClass="help-block" element="em" />
					</div>
				</div>
			</div>
			<div class="mCustomeDesign">
				<sf:textarea path="description" id="description"
					class="form-control"
					placeholder="Write a Description for the product" />
				<div class="colorRed">
					<sf:errors path="description" cssClass="help-block" element="em" />
				</div>
			</div>

			<div class="row mCustomeDesign">
				<div class="col">
					<sf:input type="number" path="unitPrice" id="unitPrice"
						class="form-control" placeholder="Enter Unit Price" />
					<div class="colorRed">
						<sf:errors path="unitPrice" cssClass="help-block" element="em" />
					</div>
				</div>
				<div class="col">
					<sf:input type="number" path="quantity" id="quantity"
						class="form-control" placeholder="Quantity Available" />
				</div>
			</div>

			<div class="mCustomeDesign fileUpload">
				<label class="control-label col-md-4" for="file">Upload a
					file</label>
				<sf:input type="file" path="file" id="file" />
			</div>
			<div class="colorRed">
				<sf:errors path="file" cssClass="help-block" element="em" />
			</div>

			<div class="mCustomeDesign">
				<sf:select class="form-control" id="categoryId" path="categoryId"
					items="${categories}" itemLabel="name" itemValue="id" />
					
					<c:if test="${product.id == 0}">
					<div class="text-right">
					   <br/>
					  <!-- Button to Open the Modal -->
						<button type="button" class="btn btn-warning btn-xs" data-toggle="modal" data-target="#myCategoryModal">Add Category</button>
					</div>
					</c:if>
			</div>


			<div class="form-group">

				<input type="submit" name="submit" value="Add Products"
					class="btn btn-primary btn-ls" />

				<sf:hidden path="id" />
				<sf:hidden path="code" />
				<sf:hidden path="supplierId" />
				<sf:hidden path="active" />
				<sf:hidden path="purchases" />
				<sf:hidden path="views" />

			</div>


		</sf:form>

		<!-- Form design end-->

	</div>
</div>


<!-- The Modal -->
<div class="modal" id="myCategoryModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Category</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         <sf:form class="form-horizontal" modelAttribute="category" action="${contextRoot}/manage/category" method="POST">
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Name</label>
            <sf:input type="text" class="form-control" path="name" id="category_name" placeholder="Category Name"/>
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label">Description</label>
            <sf:textarea cols="" rows="5" class="form-control" path="description" id="category_description" placeholder="Enter category description here!"/>
          </div>
          
           <div class="modal-footer">
              <input type="submit" class="btn btn-primary" value="Add Category">
           </div>
           
          </sf:form>
      </div>    
    </div>
  </div>
</div>











<hr />
<hr />

<div class="adminProductLidtview">
	<div class="col-xs-12">
		<h3>Available Products</h3>
		<hr />
	</div>
	
	<div class="container">
		<div class='col-xs-12'>
			<div style="overflow: auto">

				<table id="adminProductTable"
					class="table table-striped table-bordered">
					<thead>
						<tr>
							<th>Id</th>
							<th>&#160;</th>
							<th>Name</th>
							<th>Brand</th>
							<th>Quantity</th>
							<th>Unit Price</th>
							<th>Activate</th>
							<th>Edit</th>
						</tr>
					</thead>

					<tfoot>
						<tr>
							<th>Id</th>
							<th>&#160;</th>
							<th>Name</th>
							<th>Brand</th>
							<th>Quantity</th>
							<th>Unit Price</th>
							<th>Activate</th>
							<th>Edit</th>
						</tr>
					</tfoot>
				</table>

			</div>
		</div>
	</div>


	<!-- Start Modal -->
	
	<!-- End Model -->

</div>




























