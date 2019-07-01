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

	<a href="index.html" class="btn btn-block btn-primary">HOME</a>
	<a href="#" class="btn btn-block btn-warning">UPDATE ${film.title}</a>

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
			type="submit" value="SUBMIT" class="btn btn-block btn-success" />
	</form>

</body>
</html>