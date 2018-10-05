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
<link href="${css}/bullingPerson.css" rel="stylesheet"> 
<link href="${css}/signup-success.css" rel="stylesheet">

</head>
<body>

	<div class="wrapper">

		<!-- Navigation -->
        <%@include file="flows-navbar.jsp" %> 

		<div class="content">