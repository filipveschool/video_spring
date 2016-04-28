<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<div class="container">
    <h1>${movie.title}</h1>
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

        <c:forEach items="${persons}" var="actor">
            <tr>
                <td>${actor[0]}</td>
                <td>${actor[1]}</td>
                <td>${actor[2]}</td>
                <td>${actor[3]}/${actor[4]}/${actor[5]}</td>
                <td>${actor[6]}</td>
                <td>${actor[7]}</td>
                <%--
                <td>${actor.id}</td>
                <td>${actor.name}</td>
                <td>${actor.familyName}</td>
                <td>${actor.zetGeboorteDatumOmNaarTekst()}</td>
                <td>${actor.berekenLeeftijd()}</td>
                <td>${actor.gender}</td>
                <td><a class="btn btn-primary" href="<spring:url value="/actors/update/${actor.id}.htm"/>"><i class="fa fa-pencil fa-lg"></i>update</a></td>
                <td><a class="btn btn-danger" href="<spring:url value="/actors/delete/${actor.id}.htm"/>"><i class="fa fa-trash-o fa-lg"></i>Delete</a></td>
                --%>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <a class="btn btn-info" href="<c:url value="/actors/addActor.htm"/>"><spring:message code="label.addnewactor"/></a>

</div>

</body>
</html>
