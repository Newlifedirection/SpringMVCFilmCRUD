<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Film</title>
</head>
<body>
	<c:choose>
		<c:when test="${! empty film}">
			<ul>
				<li>${film.filmId}</li>
				<li>${film.title}</li>
				<li>${film.description}</li>
				<li>${film.releaseYear}</li>
				<li>${film.languageId}</li>
				<li>${film.rentalDuration}</li>
				<li>${film.rentalRate}</li>
				<li>${film.length}</li>
				<li>${film.replacementCost}</li>
				<li>${film.rating}</li>
				<%--  <li>${film.language}</li> --%>
			</ul>
		</c:when>
		<c:otherwise>
			<p>No Film Found</p>
		</c:otherwise>
	</c:choose>
	<form action="deleteFilm.do" method="POST">
	<input type="hidden" value="${film.filmId }" name="filmID" /> <input
			type="submit" value="Update" />
		<input type="submit" value="Delete" />
	
	</form>
	<form action="updateFilm.do" method="GET">
		<input type="hidden" value="${film.filmId }" name="filmID" /> <input
			type="submit" value="Update" />
	</form>
</body>
</html>