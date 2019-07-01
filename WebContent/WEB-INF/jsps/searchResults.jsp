<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Results</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
	<a href="index.html" class="btn btn-block btn-primary">HOME</a>
	<a href="#" class="btn btn-block btn-success">SEARCH RESULTS</a>

	<c:choose>
		<c:when test="${! empty films}">
			<table class="table">
				<table class="table table-hover table-sm">
					<tr>
						<th scope="col">Title</th>
						<th scope="col">Description</th>
						<th scope="col">Details</th>
					</tr>
					<c:forEach items="${films}" var="film">
						<tr>
							<td>${film.title}</td>
							<td>${film.description }</td>
							<td>
								<form action=GetFilmData.do method="GET">
									<input type="hidden" value="${film.filmId }" name="filmId" />
									<input type="submit" value="Details"
										class="btn btn-block btn-warning" />
								</form>
							</td>
						</tr>
					</c:forEach>
				</table>
				</c:when>
				<c:otherwise>
					<h2>
						Keyword Not Found<br>Try Again
					</h2>
					<form action="SearchResults.do" method="GET">
						Enter Keyword: <input type="text" name="keyword" size="25" /> <input
							type="submit" value="SUBMIT" class="btn btn-block btn-success" />
					</form>
				</c:otherwise>
	</c:choose>

</body>
</html>