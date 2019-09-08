<%@ page language="java" contentType="text/html; charset=UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <c:import url="/WEB-INF/views/includes/head.jsp" />

    <link href="<c:url value="/webjars/bootstrap/css/bootstrap.min.css" />" rel="stylesheet">
    <link href="<c:url value="/assets/css/login.css" />" rel="stylesheet">
</head>

<body>


<main role="main" class="container">
    <%-- Need to use contextPath because cannot use c:url inside <form:form ?? --%>
    <c:set var="action" value="${pageContext.servletContext.contextPath}" />

    <form:form class="form-signin" method="POST" action="${action}" modelAttribute="userLogin">
        <a href="<c:url value="/"/>"><img src="" data-src="holder.js/64x64?theme=thumb&bg=0052ff&fg=007bff&size=1" alt="" class="mr-2 rounded" /></a>
        <h1 class="h3 mb-3 font-weight-normal">Iniciar sesión</h1>
        <form:label path="email" class="sr-only">Correo electrónico</form:label>
        <form:input path="email" type="email" id="inputEmail" class="form-control" placeholder="Email address" required="required" autofocus="autofocus" />
        <form:label path="password" class="sr-only">Contraseña</form:label>
        <form:input path="password" type="password" id="inputPassword" class="form-control" placeholder="Password" required="required" />
        <div class="checkbox mb-3">
            <label>
                <input type="checkbox" value="remember-me" /> Recordarme
            </label>
        </div>
        <c:if test="${not empty error}">
            <p class="alert alert-danger mt-5 mb-3 text-muted">${error}</p>
        </c:if>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
    </form:form>


</main>

<script src="<c:url value="/webjars/jquery/3.4.1/jquery.min.js"/>"></script>
<script src="<c:url value="/assets/js/popper.min.js"/>"></script>
<script src="<c:url value="/assets/js/holder.min.js"/>"></script>
</body>