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
<link rel='stylesheet' href='style.css'>

</head>
<body>
<a href="index.html" class="btn btn-block btn-info">Home</a>
	<c:choose>
		<c:when test="${! empty films}">
			<form action="SearchResults.do" method="GET">
				Keyword: <input type="text" name="keyword" size="25" /> <input
					type="submit" value="Get Film" />
			</form>
			<h2>Search Results:</h2>
			<table>
				<thead>
					<tr>
						<th scope="col">Title</th>
						<th scope="col">Description</th>
					</tr>
					<c:forEach items="${films}" var="film">
						<tr>
							<td>${film.title}</td>
							<td>${film.description }</td>
						</tr>
					</c:forEach>
			</table>

		</c:when>
		<c:otherwise>
			<h2>Keyword Not Found</h2>
			<form action="SearchResults.do" method="GET">
				Film Keyword: <input type="text" name="keyword" size="25" /> <input
					type="submit" value="Get Film" />
			</form>
		</c:otherwise>
	</c:choose>
</body>
</html>