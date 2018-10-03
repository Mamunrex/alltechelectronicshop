<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<div class="mHeader">
		<h3>Admin Panel</h3>
	</div>
	
	
     <div class="mMainContent">
       <div class="mMainheader">
		  <h4>Product Managment</h4>
	   </div>
	   <div class="mBody">
	   <!-- Form design start -->
	   <sf:form modelAttribute="product" action="${contextRoot}/manage/products" method="POST">
		  <div class="row">
		    <div class="col">
		      <sf:input type="text" path="name" id="name" class="form-control" placeholder="Product Name"/>
		      <sf:errors path="name" cssClass="help-block" element="em"/> 
		    </div>
		    <div class="col">
		      <sf:input type="text" path="brand" id="brand" class="form-control" placeholder="Brand Name"/>
		      <sf:errors path="brand" cssClass="help-block" element="em"/> 
		    </div>
		  </div>
		  <div class="mCustomeDesign">
		  <sf:textarea path="description" id="description" class="form-control" placeholder="Write a Description for the product" />
		  <sf:errors path="description" cssClass="help-block" element="em"/> 
		  </div>
		  <div class="row mCustomeDesign">
		    <div class="col">
		      <sf:input type="number" path="unitPrice" id="unitPrice" class="form-control" placeholder="Enter Unit Price"/>
		      <sf:errors path="unitPrice" cssClass="help-block" element="em"/> 
		    </div>
		    <div class="col">
		      <sf:input type="number" path="quantity" id="quantity" class="form-control" placeholder="Quantity Available"/>
		      <sf:errors path="quantity" cssClass="help-block" element="em"/> 
		    </div>
		  </div>
		  <div class="mCustomeDesign">
		  <sf:select class="form-control" id="categoryId" path="categoryId"
		    items="${categories}" itemLabel="name" itemValue="id"
		  />
		  </div>
		  
		  
		  <div class="form-group mCustomeDesign">
							
					<input type="submit" name="submit" value="Submit" class="btn btn-primary"/>
					
					
					<sf:hidden path="id"/>
					<sf:hidden path="code"/>
					<sf:hidden path="supplierId"/>
					<sf:hidden path="active"/>
					<sf:hidden path="purchases"/>
					<sf:hidden path="views"/>
		
			</div>
		   
		  
		</sf:form>
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
	   
	   <!-- Form design end-->
	   
	  </div> 	
	</div>








