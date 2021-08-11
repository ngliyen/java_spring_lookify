<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
	<div class="container w-50 mt-5 border border-dark border-2 p-5">
		<nav class="d-flex justify-content-between align-items-center mb-5">
			<p>Top Ten Songs</p>
			<a href="/dashboard">Dashboard</a>
		</nav>
		<div class="border border-dark border-2 p-2 w-50">
			<c:forEach var="song" items="${songs}">
				<p>
					<c:out value="${song.rating}" />
					- <a href="/songs/${song.id}"><c:out value="${song.title}" /></a> -
					<c:out value="${song.artist}" />
				</p>
			</c:forEach>
		</div>
	</div>
</body>
</html>