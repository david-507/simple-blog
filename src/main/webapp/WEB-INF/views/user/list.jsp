<%@ page language="java" contentType="text/html; charset=UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <c:import url="/WEB-INF/views/includes/head.jsp" />

    <link href="<c:url value="/webjars/bootstrap/css/bootstrap.min.css" />" rel="stylesheet">
    <link href="<c:url value="/assets/css/custom.css" />" rel="stylesheet">
</head>

<body>

<%--HEADER MENU--%>
<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom box-shadow">
    <c:import url="/WEB-INF/views/includes/menu.jsp" />
</div>
<%--END HEADER MENU--%>


<div class="container">

    <table class="table table-sm table-hover">
        <caption>List of users</caption>
        <thead class="thead-dark">
            <tr>
                <th scope="col">#</th>
                <th scope="col">Avatar</th>
                <th scope="col">Name</th>
                <th scope="col">Email</th>
                <th scope="col">City</th>
                <th scope="col">Actions</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${users}" var="user">
            <tr>
                <th scope="row">${user.id}</th>
                <td>
                    <c:choose>
                        <c:when test="${not empty user.avatar}">
                            <c:set var="userImg" value="${user.avatar}" />
                        </c:when>
                        <c:otherwise>
                            <c:set var="userImg" value="https://api.adorable.io/avatars/55/${user.email}.png" />
                        </c:otherwise>
                    </c:choose>
                    <img src="${userImg}" alt="avatar" width="55" height="55" />
                </td>
                <td>${user.name}</td>
                <td>${user.email}</td>
                <td>${user.city}</td>
                <td>
                    <a href="<c:url value="/?id=${user.id}" />">editar</a> |
                    <a href="<c:url value="/?id=${user.id}" />">borrar</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>


</div>




<c:import url="/WEB-INF/views/includes/footer.jsp" />



</body>