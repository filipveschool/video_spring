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
    <title><spring:message code="menu.showallmovies"/></title>

    <style>
        .containerfilip {
            width: 1400px;
            margin-right: auto;
            margin-left: auto;
        }
    </style>
</head>
<body>

<div class="containerfilip">
    <div class="row">
        <h1>${name}</h1>
    </div>

    <div class="row">
        <div class="col-xs-12 col-md-12 col-lg-12">
            <h2>This shows the values from the Movie Object without the values from the REST API</h2>

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

                        <td><a class="btn btn-primary" href="<spring:url value="/movies/update/${movie.id}.htm"/>"><i
                                class="fa fa-pencil fa-lg"></i>update</a></td>

                        <td><a class="btn btn-danger" href="<spring:url value="/movies/delete/${movie.id}.htm"/>"><i
                                class="fa fa-trash-o fa-lg"></i>Delete</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <a class="btn btn-info" href="<c:url value="/movies/addMovie.htm"/>"><spring:message
                    code="label.addnewmovie"/></a>

        </div>
    </div>
</div>

<div class="containerfilip">
    <div class="row">
        <div class="col-xs-12 col-md-12 col-lg-12">
            <h2>This shows the values from the Movie Object with the values from the REST API</h2>

            <table class="table table-striped">
                <thead>
                <tr>
                    <th>Id</th>
                    <th><spring:message code="label.titel"/></th>
                    <th>Budget REST</th>
                    <th>Imdb link REST</th>
                    <th>Release date REST</th>
                    <th>Runtime REST</th>
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
                <c:forEach items="${moviesrest}" var="movie">
                    <tr>

                        <td>${movie.key.id}</td>
                        <td>${movie.key.title}</td>
                        <td>$ ${movie.value.budget}</td>
                        <td><a target="_blank"
                               href="<spring:url value="http://www.imdb.com/title/${movie.value.imdb_id}"/>">IMDB
                            URL
                            VAN ${movie.key.title}</a></td>
                        <td>${movie.value.release_date}</td>
                        <td>${movie.value.runtime} minuten</td>
                        <td>${movie.key.director}</td>
                        <td>${movie.key.jaar}</td>
                        <td>${movie.key.genre.toString()}</td>
                        <td>${movie.key.rating.toString()}</td>
                        <td>${movie.key.evaluation.toString()}</td>
                        <td>${movie.key.seen}</td>

                        <td><a class="btn btn-primary"
                               href="<spring:url value="/movies/update/${movie.key.id}.htm"/>"><i
                                class="fa fa-pencil fa-lg"></i>update</a></td>

                        <td><a class="btn btn-danger"
                               href="<spring:url value="/movies/delete/${movie.key.id}.htm"/>"><i
                                class="fa fa-trash-o fa-lg"></i>Delete</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>


<div class="containerfilip">
    <h1><spring:message code="label.statistics"/></h1>


    <table class="table table-striped">
        <thead>
        <tr>
            <th><spring:message code="label.year"/></th>
            <th><spring:message code="label.count"/></th>
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
