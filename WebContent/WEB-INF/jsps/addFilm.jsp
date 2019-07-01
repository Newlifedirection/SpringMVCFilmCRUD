<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Add Film</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
	<a href="index.html" class="btn btn-block btn-primary">Home</a>
	<a href="AddFilm.do" class="btn btn-block btn-success">Add Film</a>
	<form action="AddFilm.do" modelAttribute="film" method="POST">
		<table class="table table-striped table-sm table-hover">
			<tr>
				<td><strong>Title :</strong></td>
				<td><input type="text" name="title" size="30"
					placeholder="Ex: Hello Kitty Boom" /></td>
			</tr>
			<tr>

				<td><strong>Description :</strong></td>
				<td><input type="text" name="description" size="30"
					placeholder="Ex: An Epic Explosion" /></td>
			</tr>
			<tr>
				<td><strong>Release Year</strong></td>
				<td><input type="text" name="releaseYear" size="30"
					placeholder="Between: 1901 - 2155" /></td>
			</tr>
			<tr>
				<td><strong>Language ID :</strong></td>
				<td><input type="text" name="languageId" size="30"
					placeholder="1-6" value="1" /></td>
			</tr>
			<tr>
				<td><strong>Rental Duration :</strong></td>
				<td><input type="text" name="rentalDuration" size="30"
					placeholder="Ex: 60" /></td>
			</tr>
			<tr>
				<td><strong>Rental Rate :</strong></td>
				<td><input type="text" name="rentalRate" size="30"
					placeholder="3.99" /></td>
			</tr>
			<tr>
				<td><strong>Length :</strong></td>
				<td><input type="text" name="length" size="30"
					placeholder="56" /></td>
			</tr>
			<tr>
				<td><strong>Replacement Cost :</strong></td>
				<td><input type="text" name="replacementCost" size="30"
					placeholder="19.99" /></td>
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
		<input type="submit" value="Submit" class="btn btn-block btn-warning" />
	</form>
</body>
</html>