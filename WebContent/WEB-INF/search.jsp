<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Film Data</title>
</head>
<body>
	
	
	<form action="SearchResults.do" method="GET">
		Film Keyword:
		<input type="text" name="keyword" size="25"/> 
		<input type="submit" value="Get Film" />
	</form>

</body>
	
</body>
</html>