<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@include file="../shared/flows-header.jsp"%>

<div class="mMainContent">
	<div class="mMainheader">
		<h4>Sign Up - Address</h4>
	</div>
	<div class="mBody">
		<!-- Form design start -->
		<sf:form method="POST" modelAttribute="billing" class="form-horizontal" id="billingForm">

			<div class="row">
				<div class="col">
					<sf:input type="text" path="addressLineOne" class="form-control"
						placeholder="Enter Address Line One" />
						<div class="colorRed">
						<sf:errors path="addressLineOne" cssClass="help-block" element="em" />
					</div>
				</div>
				<div class="col">
					<sf:input type="text" path="addressLineTwo" class="form-control"
						placeholder="Enter Address Line Two" />
						<div class="colorRed">
						<sf:errors path="addressLineTwo" cssClass="help-block" element="em" />
					</div>
				</div>
			</div>

			<div class="row mCustomeDesign">
				<div class="col">
					<sf:input type="text" path="city" class="form-control"
						placeholder="Enter City Name" />
						<div class="colorRed">
						<sf:errors path="city" cssClass="help-block" element="em" />
					</div>
				</div>
				<div class="col">
					<sf:input type="text" path="postalCode" class="form-control"
						placeholder="XXXXXX" />
						<div class="colorRed">
						<sf:errors path="postalCode" cssClass="help-block" element="em" />
					</div>
				</div>
			</div>


			<div class="row mCustomeDesign">
				<div class="col">
					<sf:input type="text" path="state" class="form-control"
						placeholder="Enter State Name" />
						<div class="colorRed">
						<sf:errors path="state" cssClass="help-block" element="em" />
					</div>
				</div>
				<div class="col">
					<sf:input type="text" path="country" class="form-control"
						placeholder="Enter Country Name" />
						<div class="colorRed">
						<sf:errors path="country" cssClass="help-block" element="em" />
					</div>
				</div>
			</div>

			<div class="form-group mCustomeDesign">
				<div class="col-md-offset-4 col-md-8">
					<button type="submit" name="_eventId_personal"
						class="btn btn-primary">
						<span class="glyphicon glyphicon-chevron-left"></span> Back -
						Personal
					</button>
					<button type="submit" name="_eventId_confirm"
						class="btn btn-primary">
						Next - Confirm<span class="glyphicon glyphicon-chevron-right"></span>
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