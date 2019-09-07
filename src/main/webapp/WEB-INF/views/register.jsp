<%@ page language="java" contentType="text/html; charset=UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <c:import url="includes/head.jsp" />

    <link href="<c:url value="/webjars/bootstrap/css/bootstrap.min.css" />" rel="stylesheet">
    <link href="<c:url value="/assets/css/custom.css" />" rel="stylesheet">
</head>

<body>

<%--HEADER MENU--%>
<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom box-shadow">
    <c:import url="/WEB-INF/views/includes/menu.jsp" />
</div>
<%--END HEADER MENU--%>


<main role="main" class="container">


    <%-- Need to use contextPath because cannot use c:url inside <form:form ?? --%>
    <c:set var="action" value="${pageContext.servletContext.contextPath}/signup" />

    <form:form action="${action}" modelAttribute="rb" id="rform" method="post" enctype="multipart/form-data">
        <div class="form-row">
            <spring:bind path="name">
            <div class="form-group col-md-6">
                    <form:label for="name" path="name" cssClass="sr-only">Nombre</form:label>
                    <form:input path="name" type="text" class="form-control ${status.error ? 'is-invalid' : ''}" id="name" placeholder="Nombre" autofocus="autofocus" required="required" />
                    <form:errors path="name" cssClass="invalid-feedback" element="div" />
            </div>
            </spring:bind>

            <spring:bind path="email">
            <div class="form-group col-md-6">
                <form:label path="email" for="email" cssClass="sr-only">Email</form:label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="inputGroupPrepend">@</span>
                    </div>
                        <form:input path="email" type="email" class="form-control ${status.error ? 'is-invalid' : ''}" id="email" placeholder="nombre@ejemplo.com" aria-describedby="inputGroupPrepend" required="required" />
                        <form:errors path="email" cssClass="invalid-feedback" element="div" />
                </div>
            </div>
            </spring:bind>
        </div>
        <spring:bind path="password">
        <div class="form-group">
            <form:label path="password" for="password" cssClass="sr-only">Contraseña</form:label>
            <form:input path="password" type="password" size="128" class="form-control ${status.error ? 'is-invalid' : ''}" id="password" placeholder="Contraseña" required="required" />
            <form:errors path="password" cssClass="invalid-feedback" element="div" />
        </div>
        </spring:bind>

        <spring:bind path="passwordRepeat">
        <div class="form-group">
            <form:label path="passwordRepeat" for="passwordRepeat" cssClass="sr-only">Confirmar Contraseña</form:label>
            <form:input path="passwordRepeat" type="password" size="128" class="form-control ${status.error ? 'is-invalid' : ''}" id="passwordRepeat" placeholder="Confirmar" required="required" />
            <form:errors path="passwordRepeat" cssClass="invalid-feedback" element="div" />
        </div>
        </spring:bind>

        <spring:bind path="city">
        <div class="form-group">
            <form:label path="city" for="city" cssClass="sr-only">Ciudad</form:label>
            <form:input path="city" type="text" class="form-control ${status.error ? 'is-invalid' : ''}" id="city" placeholder="Ciudad" required="required" />
            <form:errors path="city" cssClass="invalid-feedback" element="div" />
        </div>
        </spring:bind>

            <div class="form-group">
                <label for="file" class="sr-only">Avatar</label>
                <input id="file" name="file" type="file" class="form-control input-file" />
                <div class="invalid-feedback" id="file-error"></div>
            </div>

        <button id="sbutton" type="submit" class="btn btn-primary">Registrarme</button>
    </form:form>

</main>

<c:import url="/WEB-INF/views/includes/footer.jsp" />

<script>
    $(document).ready(function() {
        const MAX_FILE_SIZE = 2 * 1024 * 1024;
        const fileInput = $('#file');
        const errorDiv = $('#file-error');

        $(fileInput).on('change', function(evt) {
            var file = this.files[0];

            if( file!=null && file.size > MAX_FILE_SIZE ) {
                $(errorDiv).html("The file you are about to upload is too big. Max size is 2Mb.");
                $(fileInput).addClass("is-invalid");
                console.log(this.files[0].size);
                $('#sbutton').attr("disabled","disabled");
            } else {
                $(errorDiv).html("");
                $(fileInput).removeClass("is-invalid");
                $('#sbutton').removeAttr("disabled");
            }

        });
    });
</script>

</body>