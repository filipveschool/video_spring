<%--
  Created by IntelliJ IDEA.
  User: filip
  Date: 15/03/2016
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h1>${name}</h1>
<h3>${greetings}</h3>

<div class="container">
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Id</th>
            <th><spring:message code="label.titel"/></th>
            <th><spring:message code="label.director"/></th>
            <th><spring:message code="label.year"/></th>
            <th><spring:message code="label.genre"/></th>
            <th><spring:message code="label.rating"/></th>
            <th><spring:message code="label.evaluation"/></th>
            <th><spring:message code="label.seen"/></th>
            <th><spring:message code="label.update"/></th>
            <th><spring:message code="label.delete"/></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${movies}" var="movie">
        <tr>
            <td>${movie.id}</td>
            <td>${movie.title}</td>
            <td>${movie.director}</td>
            <td>${movie.jaar}</td>
            <td>${movie.genre.toString()}</td>
            <td>${movie.rating.toString()}</td>
            <td>${movie.evaluation.toString()}</td>
            <td>${movie.seen}</td>

            <td><a class="btn btn-primary" href="<spring:url value="/movies/update/${movie.id}.htm"/>"><i class="fa fa-pencil fa-lg"></i>update</a></td>

            <td><a class="btn btn-danger" href="<spring:url value="/movies/delete/${movie.id}.htm"/>"><i class="fa fa-trash-o fa-lg"></i>Delete</a></td>
        </tr>
        </c:forEach>
        </tbody>
    </table>

    <a class="btn btn-info" href="<c:url value="/movies/addMovie.htm"/>"><spring:message code="label.addnewmovie"/></a>

    </div>

    <div class="container">
        <h1><spring:message code="label.statistics"/></h1>


        <table class="table table-striped">
            <thead>
            <tr>
                <th><spring:message code="label.year"/> </th>
                <th><spring:message code="label.count"/> </th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${aantalfilmsgezienperjaar}" var="aantal">
                <tr>
                    <td>${aantal.key}</td>
                    <td>${aantal.value}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

    </div>

</body>
</html>
