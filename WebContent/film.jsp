<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<<<<<<< HEAD

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

=======
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
>>>>>>> 68a03dcab74a7651a128eafa3f750083ee80ab51

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Film Data</title>
</head>
<body>
<<<<<<< HEAD

	<%-- <form action=GetFilmData.do method="GET">
		Enter Film ID: 
		<input type="text" name="filmId" /> <input
			type="submit" value="Get Film Data" />
	</form> --%>


	<form action="GetFilmData.do" method="GET modelAttribute="film">
		Enter Film ID: <input type="text" name="filmId" /> <input
			type="submit" value="Get Film Data" />
	</form>

=======
	<form action=GetFilmData.do method="GET">
		Enter Film ID: 
		<input type="text" name="filmId" /> <input
			type="submit" value="Get Film Data" />
	</form>
>>>>>>> 68a03dcab74a7651a128eafa3f750083ee80ab51
</body>
</html>