<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update hier je movie</title>
</head>
<body>

<form:form method="post" action="${pageContext.request.contextPath}/movies/updatemovie.htm" modelAttribute="movie" id="movieForm">
<form:hidden path="id" value="${movie.id}"/>
    <!-- titel -->
    <div class="form-group">
        <label for="title"><spring:message code="label.titel"/></label>
        <form:input path="title" id="title" cssclass="form-control" class="form-control"/>
    </div>

    <!-- director -->
    <div class="form-group">
        <label for="director"><spring:message code="label.director"/></label>
        <form:input path="director" id="director" cssclass="form-control" class="form-control" />
    </div>

    <!-- jaar -->
    <div class="form-group">
        <label for="jaar"><spring:message code="label.year"/></label>
        <form:input path="jaar" id="jaar" cssclass="form-control" class="form-control"/>
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
        <label for="seen"><spring:message code="label.seenornot"/> </label>
        <form:input path="seen" id="seen" cssclass="form-control" class="form-control"/>
    </div>


    <div>
        <input type="submit" value="submit" class="btn btn-default">
    </div>



</form:form>

</body>
</html>
