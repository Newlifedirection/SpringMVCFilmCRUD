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
	<a href="index.html" class="btn btn-block btn-primary">Home</a>
	<c:choose>
		<c:when test="${! empty film}">
			<h2>${film.title}</h2>
			<ul>
				<li><strong>Film ID:</strong> ${film.filmId}</li>
				<li><strong>Title:</strong> ${film.title}</li>
				<li><strong>Description:</strong> ${film.description}</li>
				<li><strong>Release Year:</strong> ${film.releaseYear}</li>
				<li><strong>Language ID:</strong> ${film.languageId}</li>
				<li><strong>Rental Duration:</strong> ${film.rentalDuration}</li>
				<li><strong>Rental Rate:</strong> ${film.rentalRate}</li>
				<li><strong>Length:</strong> ${film.length}</li>
				<li><strong>Replacement Cost:</strong> ${film.replacementCost}</li>
				<li><strong>Rating:</strong> ${film.rating}<br></li>
				<li><strong>Actors:</strong><br> <c:choose>
						<c:when test="${! empty actors }">
							<c:forEach items="${actors }" var="actor">
								<tr>
									<td>${actor.firstName } ${actor.lastName }<br></td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose></li>
				<li><strong>Category:</strong> ${film.category }</li>
			</ul>
		</c:when>
		<c:otherwise>
			<div class="alert alert-primary" role="alert">Film Not Found!
				Did you delete something?</div>
		</c:otherwise>
	</c:choose>
	<%-- 	<form action="GetFilmData.do" method="GET">
		<input type="number" name="filmId" size="25"
			placeholder="Enter Film ID" value="${film.filmId }" /> <input
			type="submit" value="Submit" class="btn btn-block btn-primary" />
	</form> --%>
	<form action="UpdateFilm.do" method="GET">
		<input type="hidden" value="${film.filmId }" name="filmId" /> <input
			type="submit" value="Update" class="btn btn-block btn-warning" />
	</form>
	<form action="DeleteFilm.do" method="POST">
		<input type="hidden" value="${film.filmId }" name="filmId" /> <input
			type="submit" value="Delete" class="btn btn-block btn-danger" />
	</form>
</body>
</html>