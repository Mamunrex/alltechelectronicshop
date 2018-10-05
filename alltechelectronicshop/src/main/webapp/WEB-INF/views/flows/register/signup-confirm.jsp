<%@include file="../shared/flows-header.jsp"%>

<div class="mConfirm">
	<div class="container">

		<div class="row">

			<div class="col-sm-5 mBorderP mMArfin">

				<div class="panel panel-primary">

					<div class="panel-heading ">
						<h4>Personal Details</h4>
					</div>
					<hr />
					<div class="panel-body">
						<div class="text-center">
							<h6>Name : ${registerModel.user.firstName}
								${registerModel.user.lastName}</h6>
							<h6>Email : ${registerModel.user.email}</h6>
							<h6>Contact : ${registerModel.user.contactNumber}</h6>
							<h6>Role : ${registerModel.user.role}</h6>
						</div>
					</div>
					<hr />
					<p class="text-right">
								<a href="${flowExecutionUrl}&_eventId_personal"
									class="btn btn-warning btn-xs">Edit</a>
							</p>

				</div>


			</div>

			<div class="col-sm-5 mBorderP mMArfin">

				<div class="panel panel-primary">

					<div class="panel-heading">
						<h4>Billing Address</h4>
					</div>
					<hr/>
					<div class="panel-body">
						<div class="text-center">
							<h6>Address One : ${registerModel.billing.addressLineOne},</h6>
							<h6>Address Two : ${registerModel.billing.addressLineTwo},</h6>
							<h6>City & Postcode: ${registerModel.billing.city}-
								${registerModel.billing.postalCode},</h6>
							<h6>State & Country : ${registerModel.billing.state} - ${registerModel.billing.country}</h6>
						</div>
					</div>
					<hr/>
					<p class="text-right">
						<a href="${flowExecutionUrl}&_eventId_billing"
							class="btn btn-warning btn-xs">Edit</a>
					</p>

				</div>

			</div>

		</div>

		<div class="row">

			<div class="col-sm-4 col-sm-offset-4">

				<div class="text-center">

					<a href="${flowExecutionUrl}&_eventId_submit" class="btn btn-lg btn-primary">Confirm</a>

				</div>

			</div>

		</div>

	</div>
</div>