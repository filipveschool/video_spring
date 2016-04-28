<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: filip
  Date: 24/03/2016
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<div class="container">

    <table class="table table-striped">
        <thead>
        <tr>
            <th><spring:message code="label.titel"/></th>
            <th><spring:message code="label.director"/></th>
            <th><spring:message code="label.year"/></th>
            <th><spring:message code="label.genre"/></th>
            <th><spring:message code="label.rating"/></th>
            <th><spring:message code="label.evaluation"/></th>
            <th><spring:message code="label.seen"/></th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${movie.title}</td>
            <td>${movie.director}</td>
            <td>${movie.jaar}</td>
            <td>${movie.genre.toString()}</td>
            <td>${movie.rating.toString()}</td>
            <td>${movie.evaluation.toString()}</td>
            <td>${movie.seen}</td>
            <c:forEach var="actor" items="${movie.actors}">
                ${actor}<br>
            </c:forEach>
        </tr>
        </tbody>
    </table>

    <a class="btn btn-info" href="<c:url value="/movies/showmovies.htm"/>"><spring:message code="label.showallmovies"/></a>


</div>


</body>
</html>
