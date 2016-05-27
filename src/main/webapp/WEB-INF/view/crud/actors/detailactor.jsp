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
            <th><spring:message code="label.name"/></th>
            <th><spring:message code="label.familyname"/></th>

            <%--<th><spring:message code="label.jaarGeboorte"/></th>
            <th><spring:message code="label.maandGeboorte"/></th>
            <th><spring:message code="label.dagGeboorte"/></th>--%>
            <th><spring:message code="label.gender"/></th>
            <th><spring:message code="label.datum"/></th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${person.name}</td>
            <td>${person.familyName}</td>
            <%--<td>${actor.jaarGeboorte}</td>
            <td>${actor.maandGeboorte}</td>
            <td>${actor.dagGeboorte}</td>--%>
            <td>${person.zetGeboorteDatumOmNaarTekst()}</td>
            <td>${person.gender}</td>

        </tr>
        </tbody>
    </table>

    <a class="btn btn-info" href="<c:url value="/actors/showactors.htm"/>"><spring:message
            code="label.showallactors"/></a>


</div>


</body>
</html>
