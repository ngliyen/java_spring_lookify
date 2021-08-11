<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Lookify!</title>
	<!-- for Bootstrap CSS -->
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<!-- YOUR own local CSS -->
	<!-- 	<link rel="stylesheet" href="/css/my_style.css"/> -->
	<!-- For any Bootstrap that uses JS or jQuery-->
	<!-- 	<script src="/webjars/jquery/jquery.min.js"></script> -->
	<!-- 	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script> -->
	<!-- YOUR own local JS -->
	<!-- 	<script src="/js/my_script.js"></script> -->
</head>
<body>
	<div class="container w-50 mt-5 border border-dark border-2 p-5">
		<nav class="d-flex align-items-center gap-4">
			<a class="col-2" href="/songs/new">Add New</a>
			<a class="col-2" href="/search/topTen">Top Songs</a>
			<form class="d-flex justify-content-start gap-3 col-7" method="POST" action="/search">
				<input class="col form-control w-50" type="text" id="search" name="search">
				<input class="btn btn-dark" type="submit" value="Search Artists">
			</form>
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