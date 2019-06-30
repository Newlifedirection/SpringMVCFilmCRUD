<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Results</title>
<link rel='stylesheet' href='style.css'>
</head>
<body>
    <c:choose>
        <c:when test="${! empty films}">
            <ul>

                <c:forEach items="${films}" var="film">
                    <br>
                    <li>${film.title}</li>
                    <li>${film.description }</li>
                </c:forEach>

            </ul>
        </c:when>
        <c:otherwise>
            <p>No Film Found</p>
        </c:otherwise>
    </c:choose>
</body>
</html>