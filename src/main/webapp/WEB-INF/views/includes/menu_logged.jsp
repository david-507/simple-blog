<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" session="true"%>
<nav class="my-2 my-md-0 mr-md-3">
    <a class="p-2 text-dark ${not empty param.inicio ? 'active' : '' }"
       href="<c:url value="/post/create" />">Escribir post</a>
    <a class="p-2 text-dark ${not empty param.autores ? 'active' : '' }" href="<c:url value="/authors" />">Autores</a>
</nav>

<div class="dropdown">
    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        ${sessionScope.user.name}
    </button>
    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
        <a class="dropdown-item" href="<c:url value="/user/list" />">Users</a>
        <a class="dropdown-item" href="#">Another action</a>
        <a class="dropdown-item" href="#">Something else here</a>
        <div class="dropdown-divider"></div>
        <a class="dropdown-item" href="<c:url value="/logout" />">Salir</a>
    </div>
</div>