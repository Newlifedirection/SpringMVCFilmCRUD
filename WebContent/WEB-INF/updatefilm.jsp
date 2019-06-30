<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Film</title>
<link rel='stylesheet' href='style.css'>
</head>
<body>
	<h1>Edit Film</h1>
	<form action="updateFilm.do" modelAttribute="film" method="post">
		<c:choose>
			<c:when test="${! empty film}">
				<ul>
					<li>Film Id: ${film.filmId}</li>
					<li>Title: ${film.title}</li>
					<li>Description: ${film.description}</li>
					<li>Release Year: ${film.releaseYear}</li>
					<li>Language Id: ${film.languageId}</li>
					<li>Rental Duration: ${film.rentalDuration}</li>
					<li>Rental Rate: ${film.rentalRate}</li>
					<li>Length: ${film.length}</li>
					<li>Replacement Cost: ${film.replacementCost}</li>
					<li>Rating: ${film.rating}</li>
				
				</ul>
			</c:when>
			<c:otherwise>
				<p>No Film Found</p>
			</c:otherwise>
		</c:choose>
		<table>

			<form>
				<tr>
					<td>Title :</td>
					<td><input type="text" name="title" value="${film.title}"/></td>
				</tr>
				<tr>
					<td>Description :</td>
					<td><input type="text" name="description" value="${film.description}"/></td>
				</tr>
				<tr>
					<td>Release Year :</td>
					<td><input type="text" name="releaseYear" value="${film.releaseYear}"/></td>
				</tr>
				<tr>
					<td>Language ID :</td>
					<td><input type="text" name="languageId" value="${film.languageId}"/></td>
				</tr>
				<tr>
					<td>Rental Duration :</td>
					<td><input type="text" name="rentalDuration" value="${film.rentalDuration}"/></td>
				</tr>
				<tr>
					<td>Rental Rate :</td>
					<td><input type="text" name="rentalRate" value="${film.rentalRate}"/></td>
				</tr>
				<tr>
					<td>Length :</td>
					<td><input type="text" name="length" value="${film.length}"/></td>
				</tr>
				<tr>
					<td>Replacement Cost :</td>
					<td><input type="text" name="replacementCost" value="${film.replacementCost}"/></td>
				</tr>
				<tr>
					<td>Rating :</td>
					<td><label><input type="radio" name="rating" value="G">G</label><br>
						<label><input type="radio" name="rating" value="PG">PG</label><br>
						<label><input type="radio" name="rating" value="PG13">PG13</label><br>
						<label><input type="radio" name="rating" value="R">R</label><br>
						<label><input type="radio" name="rating" value="NC17">NC17</label><br></td>
				</tr>

				<tr>
					<td></td>
					<td><input type= "hidden" value="${film.filmId }" name="filmId"/>
					<input type="submit" value="Save" /></td>
				</tr>
			</form>
		</table>
	</form>
</body>
</html>