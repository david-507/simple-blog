<%@ page language="java" contentType="text/html; charset=UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <c:import url="includes/head.jsp" />

    <link href="<c:url value="/webjars/bootstrap/4.3.1/css/bootstrap.min.css" />" rel="stylesheet">
    <link href="<c:url value="/assets/css/custom.css" />" rel="stylesheet">
</head>

<body>

<%--HEADER MENU--%>
<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom box-shadow">
    <c:import url="includes/menu.jsp" />
</div>
<%--END HEADER MENU--%>


<main role="main" class="container">
    <%-- Need to use contextPath because cannot use c:url inside <form:form ?? --%>
    <c:set var="action" value="${pageContext.servletContext.contextPath}/signup" />

    <form:form action="${action}" modelAttribute="register" id="rform" method="post" novalidate="novalidate" cssClass="toValidate">
        <div class="form-row">
            <div class="form-group col-md-6">
                <form:label for="name" path="name" cssClass="sr-only">Nombre</form:label>
                <form:input path="name" type="text" class="form-control" id="name" placeholder="Nombre" autofocus="autofocus" required="required" />
            </div>
            <div class="form-group col-md-6">
                <form:label path="email" for="email" cssClass="sr-only">Email</form:label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="inputGroupPrepend">@</span>
                    </div>
                    <form:input path="email" type="email" class="form-control" id="email" placeholder="nombre@ejemplo.com" aria-describedby="inputGroupPrepend" required="required" />
                    <div class="invalid-feedback">
                        Profavor, introduce un email válido.
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <form:label path="password" for="password" cssClass="sr-only">Contraseña</form:label>
            <form:input path="password" type="password" class="form-control" id="password" placeholder="Contraseña" required="required" />
        </div>
        <div class="form-group">
            <form:label path="passwordRepeat" for="passwordRepeat" cssClass="sr-only">Confirmar Contraseña</form:label>
            <form:input path="passwordRepeat" type="password" class="form-control" id="passwordRepeat" placeholder="Confirmar" required="required" />
        </div>
        <div class="form-group">
            <form:label path="city" for="city" cssClass="sr-only">Ciudad</form:label>
            <form:input path="city" type="text" class="form-control" id="city" placeholder="Ciudad" required="required" />
        </div>
        <button type="submit" class="btn btn-primary">Registrarme</button>
    </form:form>



</main>

<c:import url="includes/footer.jsp" />


<script>
    (function() {
        'use strict';
        window.addEventListener('load', function() {
            <%-- Fetch all the forms we want to apply custom Bootstrap validation styles --%>
            var forms = document.getElementsByClassName('toValidate');
            <%-- loop over forms to prevent submission --%>
            var validation = Array.prototype.filter.call(forms, function(form) {
                form.addEventListener('submit', function(event) {
                    var is_valid = form.checkValidity();
                    <%-- check passwordRepeat matches password --%>
                    if($('password').text()!==$('passwordRepeat').text)
                        is_valid = false;

                    if (is_valid === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();
</script>
</body>