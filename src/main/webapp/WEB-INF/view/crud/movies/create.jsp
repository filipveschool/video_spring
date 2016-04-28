<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="springform" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Maak je movie hier aan</title>
</head>
<body>

<form:form method="post" action="${pageContext.request.contextPath}/movies/process.htm"
           modelAttribute="movie" id="movieForm">

    <!-- titel -->
    <div class="form-group">
        <label for="title"><spring:message code="label.titel"/></label>
        <form:input path="title" id="title" cssclass="form-control" class="form-control"/>
        <div class="has-error">
            <form:errors path="title" class="help-inline"/>
        </div>
    </div>

    <!-- director -->
    <div class="form-group">
        <label for="director"><spring:message code="label.director"/></label>
        <form:input path="director" id="director" cssclass="form-control" class="form-control" />
        <div class="error">
            <form:errors path="director" cssClass="error"/>
        </div>
    </div>

    <!-- jaar -->

    <%--
    <div class="form-group">
        <label for="jaar"><spring:message code="label.year"/></label>
        <form:select path="jaar" id="jaar" class="form-control">
        <form:options items="${jaartallen}"  />
        </form:select>
    </div>--%>


    <div class="form-group">
        <label for="jaar"><spring:message code="label.year"/></label>
        <form:select path="jaar" id="jaar" class="form-control">
            <c:forEach var="i" begin="1986" end="2016">
                <form:option value="${i}"/>
            </c:forEach>
        </form:select>
    </div>


    <div class="form-group">
        <label for="genre"><spring:message code="label.genre"/></label>
        <form:select path="genre" id="genre" cssClass="form-control" class="form-control">
            <form:options/>
        </form:select>
    </div>

    <div class="form-group">
        <label for="rating"><spring:message code="label.rating"/></label>
        <form:select path="rating" id="rating" cssclass="form-control" class="form-control">
            <form:options/>
        </form:select>
    </div>

    <div class="form-group">
        <label for="evaluation"><spring:message code="label.evaluation"/></label>
        <form:select path="evaluation" id="evaluation" cssclass="form-control" class="form-control">
            <form:options/>
        </form:select>
    </div>

    <div class="form-group">
        <label class="radio-inline">
        <form:radiobutton path="seen" id="seen" value="True"/>
            <spring:message code="label.true"/>
        </label>
        <label class="radio-inline">
        <form:radiobutton path="seen" id="seen" value="False"/><spring:message code="label.false"/>
        </label>
</div>


    <div>
        <input type="submit" value="submit" class="btn btn-default">
    </div>

</form:form>
</body>
</html>
