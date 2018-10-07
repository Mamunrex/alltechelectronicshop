<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@include file="../shared/flows-header.jsp"%>

<div class="mMainContent">
	<div class="mMainheader">
		<h4>Sign Up - Personal</h4>
	</div>
	<div class="mBody">
		<!-- Form design start -->
		<sf:form method="POST" modelAttribute="user" class="form-horizontal"
			id="registerForm">

			<div class="row">
				<div class="col">
					<sf:input type="text" path="firstName" class="form-control" placeholder="First Name" />
					<div class="colorRed">
						<sf:errors path="firstName" cssClass="help-block" element="em" />
					</div>
				</div>
				<div class="col">
					<sf:input type="text" path="lastName" class="form-control" placeholder="Last Name" />
					<div class="colorRed">
						<sf:errors path="lastName" cssClass="help-block" element="em" />
					</div>
				</div>
			</div>
			
			
			<div class="row mCustomeDesign">
				<div class="col">
					<sf:input type="text" path="email" class="form-control" placeholder="abc@zyx.com" />
				    <div class="colorRed">
						<sf:errors path="email" cssClass="help-block" element="em" />
					</div>
				</div>
				<div class="col">
				  <sf:input type="text" path="contactNumber" class="form-control" placeholder="XXXXXXXXXXX" maxlength="11" />
					<div class="colorRed">
						<sf:errors path="contactNumber" cssClass="help-block" element="em" />
					</div>
				</div>
			</div>

			<div class="row mCustomeDesign">
				<div class="col">
					<sf:input type="password" path="password" class="form-control" placeholder="Password" />
					<div class="colorRed">
						<sf:errors path="password" cssClass="help-block" element="em" />
					</div>
				</div>
				<div class="col">
					<sf:input type="password" path="confirmPassword" class="form-control" placeholder="Re-enter Password" />
					<div class="colorRed">
						<sf:errors path="confirmPassword" cssClass="help-block" element="em" />
					</div>					
				</div>
			</div>
			
			<div class="row mCustomeDesign">
				<div class="col">
					<label class="form-control"> <sf:radiobutton path="role" value="USER" checked="checked" /> User
					</label>
				</div>
				<div class="col">
					<label class="form-control"> <sf:radiobutton path="role" value="SUPPLIER" /> Supplier
					</label>
				</div>
			</div>

			<div class="form-group mCustomeDesign">
				<div class="col-md-offset-4 col-md-8">
					<button type="submit" name="_eventId_billing"
						class="btn btn-primary">
						Next - Billing <span class="glyphicon glyphicon-chevron-right"></span>
					</button>
				</div>

			</div>


		</sf:form>

		<!-- Form design end-->

	</div>
</div>

<div class="pRegistration">
    <%@include file="../shared/flows-footer.jsp"%>
</div>