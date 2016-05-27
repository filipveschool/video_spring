<%--
  Created by IntelliJ IDEA.
  User: filip
  Date: 15/03/2016
  Time: 14:33
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="springform" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update hier je acteur</title>
</head>
<body>
<form:form method="post" action="${pageContext.request.contextPath}/actors/updateactor.htm"
           modelAttribute="person" id="personForm">
    <form:hidden path="id" value="${person.id}"/>
    <!-- voornaam -->
    <div class="form-group">
        <label for="name"><spring:message code="label.name"/></label>
        <form:input path="name" id="name" cssclass="form-control" class="form-control"/>
    </div>

    <!-- familienaam -->
    <div class="form-group">
        <label for="familyName"><spring:message code="label.familyname"/></label>
        <form:input path="familyName" id="familyName" cssclass="form-control" class="form-control"/>
    </div>

    <!-- jaar -->

    <div class="form-group">
        <label for="jaarGeboorte"><spring:message code="label.jaarGeboorte"/></label>
        <form:input type="number" min="1" step="1" max="2016" path="jaarGeboorte" id="jaarGeboorte"
                    cssclass="form-control" class="form-control"/>
    </div>

    <!-- maand -->

    <div class="form-group">
        <label for="maandGeboorte"><spring:message code="label.maandGeboorte"/></label>
        <form:input type="number" min="1" step="1" max="12" path="maandGeboorte" id="maandGeboorte"
                    cssclass="form-control" class="form-control"/>
    </div>

    <!-- dag -->

    <div class="form-group">
        <label for="dagGeboorte"><spring:message code="label.dagGeboorte"/></label>
        <form:input type="number" min="1" step="1" max="31" path="dagGeboorte" id="dagGeboorte" name="dagGeboorte"
                    cssclass="form-control" class="form-control"/>
    </div>

    <!-- gender -->
    <div class="form-group">
        <label for="gender"><spring:message code="label.gender"/></label>
        <form:select path="gender" id="gender" class="form-control">
            <form:options/>
        </form:select>
    </div>

    <div>
        <input type="submit" value="submit" class="btn btn-default">
    </div>


</form:form>
</body>
</html>
