<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Add Song</title>
	<!-- for Bootstrap CSS -->
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
	<div class="container w-50 mt-5 border border-dark border-2 p-5">
		<nav class="d-flex justify-content-end mb-5">
			<a href="/dashboard">Dashboard</a>
		</nav>
		<form:form action="/songs" method="post" modelAttribute="song">
			<p class="d-flex">
				<form:label class="form-label col" path="title">Title</form:label>
				<form:errors class="text-danger col" path="title"/>
				<form:input class="form-control col" path="title"/>
			</p>
			<p class="d-flex">
				<form:label class="form-label col" path="artist">Artist</form:label>
				<form:errors class="text-danger col" path="artist"/>
				<form:input class="form-control col" path="artist"/>
			</p>
			<p class="d-flex">
				<form:label class="form-label col" path="rating">Rating</form:label>
				<form:errors class="text-danger col" path="rating"/>
				<form:input type="number" class="form-control col" path="rating"/>
			</p>
			<div class="d-flex justify-content-end">
				<input class = "btn btn-dark" type="submit" value="Add Song"/>
			</div>
		</form:form>
	</div>
</body>
</html>