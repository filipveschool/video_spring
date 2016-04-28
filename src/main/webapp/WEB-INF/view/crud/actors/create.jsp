<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="springform" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form:form method="post" action="${pageContext.request.contextPath}/actors/process.htm" modelAttribute="person" id="personForm">

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
        <form:input type="number" min="1" step="1" max="2016" value="1990" path="jaarGeboorte" id="jaarGeboorte" cssclass="form-control" class="form-control"/>
    </div>

    <!-- maand -->

    <div class="form-group">
        <label for="maandGeboorte"><spring:message code="label.maandGeboorte"/></label>
        <form:input type="number" min="1" step="1" max="12" value="1" path="maandGeboorte" id="maandGeboorte" cssclass="form-control" class="form-control"/>
    </div>

    <!-- dag -->

    <div class="form-group">
        <label for="dagGeboorte"><spring:message code="label.dagGeboorte"/></label>
        <form:input type="number" min="1" step="1" max="31" value="1" path="dagGeboorte" id="dagGeboorte" name="dagGeboorte" cssclass="form-control" class="form-control"/>
    </div>

    <!-- gender -->
    <div class="form-group">
        <label for="gender"><spring:message code="label.gender"/></label>
        <form:select path="gender" id="gender" class="form-control">
            <form:options/>
        </form:select>
    </div>
<%--
    <div class="form-group">
        <label for="date"><spring:message code="label.datum"/></label>
        <form:input type="date" path="date" for="date" id="date" class="form-control"/>
    </div>
--%>

    <%--
    <div class="form-group">
        <label class="radio-inline">
            <form:radiobutton path="geslacht" id="geslacht" value="True"/>
            <spring:message code="label.true"/>
        </label>
        <label class="radio-inline">
            <form:radiobutton path="geslacht" id="geslacht" value="False"/><spring:message code="label.false"/>
        </label>
    </div>--%>

    <div>
        <input type="submit" value="submit" class="btn btn-default">
    </div>

</form:form>

<script type="text/javascript">
    function updateTextInput(val) {
        document.getElementById('textInput').value=val;
    }
</script>

</body>
</html>
