<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
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
		<nav class="d-flex align-items-center gap-4">
			<p class="col-4 mb-0">Songs by artist: <c:out value="${name}"/></p>
			<form class="d-flex justify-content-start gap-3 col-6" method="POST" action="/search">
				<input class="col form-control w-50" type="text" id="search" name="search">
				<input class="btn btn-dark" type="submit" value="New Search">
			</form>
			<a class="col-2" href="/dashboard">Dashboard</a>
		</nav>
		<p class="text-danger pt-3 pb-3"><c:out value="${error}"/></p>
		<table class="table">
			<thead>
				<tr>
					<th>Name</th>
					<th>Rating</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="song" items="${songs}">
					<tr class="align-middle">
						<td><a href="/songs/${song.id}"><c:out value="${song.title}"/></a></td>
						<td><c:out value="${song.rating}"/></td>
						<td class="d-flex align-items-center">
							<form action="/songs/${song.id}" method="post">
    							<input type="hidden" name="_method" value="delete">
						    	<input class="btn btn-link p-0" type="submit" value="delete">
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>