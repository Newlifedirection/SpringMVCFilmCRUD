<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Film</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<link rel='stylesheet' href='style.css'>
</head>
<body>
	<a href="index.html" class="btn btn-block btn-info">Home</a>
	<c:choose>
		<c:when test="${! empty film}">
			<h2>Film View</h2>
			<ul>
				<li>Film ID: ${film.filmId}</li>
				<li>Title: ${film.title}</li>
				<li>Description: ${film.description}</li>
				<li>Release Year: ${film.releaseYear}</li>
				<li>Language ID: ${film.languageId}</li>
				<li>Rental Duration: ${film.rentalDuration}</li>
				<li>Rental Rate: ${film.rentalRate}</li>
				<li>Length: ${film.length}</li>
				<li>Replacement Cost: ${film.replacementCost}</li>
				<li>Rating: ${film.rating}</li>
			</ul>
		</c:when>
		<c:otherwise>
			<h2>No Film Found</h2>
		</c:otherwise>
	</c:choose>
	<form action=GetFilmData.do method="GET">
		Enter Film ID: <input type="number" value="${film.filmId }"
			name="filmId" /> <input type="submit" value="Get Film Data" />
	</form>
	<form action="DeleteFilm.do" method="POST">
		<input type="hidden" value="${film.filmId }" name="filmId" /> <input
			type="submit" value="Delete" />
	</form>
	<form action="UpdateFilm.do" method="GET">
		<input type="hidden" value="${film.filmId }" name="filmId" /> <input
			type="submit" value="Update" />
	</form>
</body>
</html>