<%@ page language="java" contentType="text/html; charset=UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Simple blog</title>

    <link href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="<c:url value="/assets/css/login.css" />" rel="stylesheet">
</head>

<body>


<main role="main" class="container">

    <form:form class="form-signin" method="POST" action="/login" modelAttribute="userLogin">
        <img data-src="holder.js/64x64?theme=thumb&bg=0052ff&fg=007bff&size=1" alt="" class="mr-2 rounded" />
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
        <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
        <p class="mt-5 mb-3 text-muted">${message} - ${totalUsers}</p>
    </form:form>


</main>


<!-- /container -->

<script type="text/javascript" src="/webjars/jquery/3.4.1/jquery.min.js"></script>
<script src="/assets/js/holder.min.js"></script>
<script>
    $(document).ready(function() {
    });
</script>
<%-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
--%>
</body>