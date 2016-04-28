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


<div class="container">
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Id</th>
            <th><spring:message code="label.name"/></th>
            <th><spring:message code="label.familyname"/></th>
            <th><spring:message code="label.geboortedatum"/></th>
            <th><spring:message code="label.age"/></th>
            <th><spring:message code="label.gender"/></th>
            <th><spring:message code="label.update"/></th>
            <th><spring:message code="label.delete"/></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${actors}" var="actor">
            <tr>
                <td>${actor.id}</td>
                <td>${actor.name}</td>
                <td>${actor.familyName}</td>
                <td>${actor.zetGeboorteDatumOmNaarTekst()}</td>
                <td>${actor.berekenLeeftijd()}</td>
                <td>${actor.gender}</td>
                <td><a class="btn btn-primary" href="<spring:url value="/actors/update/${actor.id}.htm"/>"><i class="fa fa-pencil fa-lg"></i>update</a></td>
                <td><a class="btn btn-danger" href="<spring:url value="/actors/delete/${actor.id}.htm"/>"><i class="fa fa-trash-o fa-lg"></i>Delete</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <a class="btn btn-info" href="<c:url value="/actors/addActor.htm"/>"><spring:message code="label.addnewactor"/></a>

</div>

<div class="container">
    <h1><spring:message code="label.statistics"/></h1>

</div>

</body>
</html>
