<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url var="css" value="/resources/css" />
<spring:url var="images" value="/resources/images" />
<spring:url var="js" value="/resources/js" />
<spring:url var="jquery" value="/resources/jquery" />

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Alltech Electronics Shop ${title}</title>
<link rel="icon" href="${images}/logo.png" type="image/gif"
	sizes="16x16">

<script>
	window.menu = '${title}';
	window.contextRoot = '${contextRoot}'
</script>

<link href="${css}/bootstrap.min.css" rel="stylesheet">
<link href="${css}/bootstrap-readable.css" rel="stylesheet">
<link href="${css}/dataTables.bootstrap.css" rel="stylesheet">
<link href="${css}/homepage.css" rel="stylesheet">
<link href="${css}/font-awesome.css" rel="stylesheet">
<link href="${css}/custome.css" rel="stylesheet">
<link href="${css}/login-jsp.css" rel="stylesheet">

</head>
<body class="mmm">


	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navebar-brand mColoreSS" href="${contextRoot}/home">Home</a>
			<div class="collapse navbar-collapse" id="navbarResponsive"></div>
		</div>
	</nav>
	<div class="logoutMsg">
			<c:if test="${not empty logout}">
			<div class="row">
				<div class="col-xs-6 col-md-offset-2">
					<div class="alert alert-success">${logout}</div>
				</div>
			</div>
		</c:if>
	
	</div>
	<div class="cont_login">
		<div class="header">
			<div class="header-left">
				<div class="header-left2">
					<p>Alltech Electronic Shop</p>
				</div>
			</div>
		</div>
		<div class="cont_info_log_sign_up">
			<div class="signin-click">
				<a href="${contextRoot}/register">Sign-Up</a>
			</div>
			<div class="col_md_sign_up">

				<div class="cont_ba_opcitiy">
					<div class="h2-header">
						<h2>Log In</h2>
					</div>
					<div class="error">
						<c:if test="${not empty message}">
							<div class="help-block">${message}${logout}</div>
						</c:if>
					</div>
					<div class="login-main-from">
						<form action="${contextRoot}/login" method="POST"
							class="form-horizontal" id="loginForm">

							<div class="form-group padding">
								<input type="text" class="form-control" id="username"
									name="username" placeholder="Email*">
								<div class="colorRed">
									<error cssClass="help-block" element="em" />
								</div>
							</div>
							<div class="form-group">
								<input type="password" class="form-control" id="password"
									name="password" placeholder="Password*">
							</div>
							<div class="login-submit">
								<input type="submit" value="LOG-IN"> <input
									type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
							</div>
						</form>
						<div class="lpage_footer">
							<div class="lpage_footer2"></div>
							<div class="lpage_footer3"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="cont_back_info">
			<div class="cont_img_back_grey"></div>
		</div>
		<div class="foother">
			<div class="copy-right">
				<p>&copy; 2018 'AES' All Rights Reserved.</p>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript -->
	<script src="${jquery}/jquery.js"></script>

	<script src="${js}/jquery.validate.js"></script>

	<script src="${js}/bootstrap.min.js"></script>

	<!-- Self coded javascript -->
	<script src="${js}/login.js"></script>

	</div>

</body>

</html>
