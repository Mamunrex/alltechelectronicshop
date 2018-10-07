<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
	
	<script>
		window.userRole = '${userModel.role}';
	</script>
	
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
	<div class="container">
		<a class="navbar-brand mColoreSSsS" href="${contextRoot}/home">Alltech
			Electronics Shop</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class=" nav navbar-nav">
				<li class="nav-item active" id="home"><a
					class="nav-link manu-border mColoreSSs" href="${contextRoot}/home">Home
						<span class="sr-only">()</span>
				</a></li>
				<li class="nav-item" id="about"><a
					class="nav-link manu-border mColoreSSs" href="${contextRoot}/about">About</a></li>
				<li class="nav-item" id="contact"><a
					class="nav-link manu-border mColoreSSs"
					href="${contextRoot}/contact">Contact</a></li>
				<li class="nav-item" id="listProduct"><a
					class="nav-link manu-border mColoreSSs"
					href="${contextRoot}/show/all/products">View Product</a></li>
				<security:authorize access="hasAuthority('ADMIN')">
					<li class="nav-item" id="listProduct"><a
						class="nav-link manu-border mColoreSSs"
						href="${contextRoot}/manage/products">Manage Product</a></li>
				</security:authorize>
			</ul>

		</div>
		<ul class="nav navbar-nav navbar-left">
			<security:authorize access="isAnonymous()">
				<li class="nav-item" id="register"><a
					class="nav-link manu-border mColoreSSs"
					href="${contextRoot}/register">Sign Up</a></li>
				<li class="nav-item" id="login"><a
					class="nav-link manu-border mColoreSSs" href="${contextRoot}/login">Login</a>
				</li>
			</security:authorize>
			<security:authorize access="isAuthenticated()">
				<li class="dropdown myCiS" id="userModel">
					<button type="button" class="btn btn-primary dropdown-toggle"
						data-toggle="dropdown">${userModel.fullName}</button>
					<div class="dropdown-menu">
						<security:authorize access="hasAuthority('USER')">
							<a class="dropdown-item" href="${contextRoot}/cart/shows"><i
								class="fa fa-cart-plus" aria-hidden="true"></i>&#160;<span
								class="badge">${userModel.cart.cartLines}</span> - &#8377;
								${userModel.cart.grandTotal}</a>
						</security:authorize>
						<a class="dropdown-item" href="${contextRoot}/perform-logout">Logout</a>
					</div>
				</li>
			</security:authorize>
		</ul>
	</div>
</nav>