<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>Students</title>
</head>
<body>
<h1>Students</h1>
<br>
<ul>
    <jsp:useBean id="students" scope="request" type="java.util.List"/>
    <c:forEach var="student" items="${students}">
        <li>
            Student ID: ${student.id}
            Student Name: ${student.name}
            Student Age: ${student.age}
            <c:url var="updateUrl" value="/students/update">
                <c:param name="id" value="${student.id}"/>
            </c:url>
            <a href="${updateUrl}">Update student</a>

            <form:form action="students/delete/${student.id}">
                <input type="hidden" name="_method" value="DELETE"/>
                <input type="submit" value="Delete student">
            </form:form>


        </li>
    </c:forEach>
</ul>
<br>
<c:url var="createUrl" value="/students/create"></c:url>
<a href="${createUrl}">Create new student</a>
</body>
</html>