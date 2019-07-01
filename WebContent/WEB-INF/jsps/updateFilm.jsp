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
</head>
<body>

	<a href="index.html" class="btn btn-block btn-primary">Home</a>
	<a href="#" class="btn btn-block btn-warning">Update Film
		ID${film.filmId}</a>
	<%-- <c:choose>
		<c:when test="${! empty film}">
			<h2>Film Details</h2>
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
									<td>${actor.firstName }${actor.lastName }<br></td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose></li>
				<li><strong>Category:</strong> ${film.category }</li>
			</ul>
		</c:when>
		<c:otherwise>
			<h2>No Film Found</h2>
		</c:otherwise>
	</c:choose> --%>
	<form action="UpdateFilm.do" modelAttribute="film" method="POST">
		<table style="”float: right;"margin-left:10px;”>
			<tr>
				<td><strong>Title :</strong></td>
				<td><input type="text" name="title" value="${film.title}" /></td>
			</tr>
			<tr>
				<td><strong>Description :</strong></td>
				<td><input type="text" name="description"
					value="${film.description}" /></td>
			</tr>
			<tr>
				<td><strong>Release Year :</strong></td>
				<td><input type="text" name="releaseYear"
					value="${film.releaseYear}" /></td>
			</tr>
			<tr>
				<td><strong>Language ID :</strong></td>
				<td><input type="text" name="languageId"
					value="${film.languageId}" /></td>
			</tr>
			<tr>
				<td><strong>Rental Duration :</strong></td>
				<td><input type="text" name="rentalDuration"
					value="${film.rentalDuration}" /></td>
			</tr>
			<tr>
				<td><strong>Rental Rate :</strong></td>
				<td><input type="text" name="rentalRate"
					value="${film.rentalRate}" /></td>
			</tr>
			<tr>
				<td><strong>Length :</strong></td>
				<td><input type="text" name="length" value="${film.length}" /></td>
			</tr>
			<tr>
				<td><strong>Replacement Cost :</strong></td>
				<td><input type="text" name="replacementCost"
					value="${film.replacementCost}" /></td>
			</tr>
			<tr>
				<td><strong>Rating :</strong></td>
				<td><label><input type="radio" name="rating" value="G">G</label><br>
					<label><input type="radio" name="rating" value="PG">PG</label><br>
					<label><input type="radio" name="rating" value="PG13">PG13</label><br>
					<label><input type="radio" name="rating" value="R">R</label><br>
					<label><input type="radio" name="rating" value="NC17">NC17</label><br></td>
			</tr>
		</table>
		<input type="hidden" value="${film.filmId }" name="filmId" /> <input
			type="submit" value="Submit" class="btn btn-block btn-success" />
	</form>
	<%-- <form action="DeleteFilm.do" method="POST">
		<input type="hidden" value="${film.filmId }" name="filmId" /> <input
			type="submit" value="Delete" class="btn btn-block btn-danger" />
	</form>
	<a href="index.html" class="btn btn-block btn-primary">Home</a> --%>
</body>
</html>