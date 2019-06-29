<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Film Data</title>
</head>
<body>
	<form action=GetFilmData.do method="GET">
		Enter Film ID: 
		<input type="text" name="filmId" /> <input
			type="submit" value="Get Film Data" />
	</form>

</body>
</html>