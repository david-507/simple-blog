<%@ page language="java" contentType="text/html; charset=UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <c:import url="includes/menu.jsp" />
</div>
<%--END HEADER MENU--%>


<main role="main" class="container-fluid">

    <%--JUMBOTRON--%>
    <section class="jumbotron text-center">
        <div class="container">
            <h1 class="jumbotron-heading">Simple blog <img src="<c:url value="/assets/img/lang-logo.png" />" /></h1>
            <h2 class="jumbotron-heading">Un blog sobre hibernate</h2>
            <p class="lead text-muted">Tutoriales, información y tips sobre la mejor tecnologia de persistencia Java y .Net.</p>
            <c:if test="${empty sessionScope.user}">
                <p>
                    <a href="<c:url value="/signup" />" class="btn btn-primary my-2">Regrístrate</a>
                </p>
            </c:if>
        </div>
    </section>
    <%--END JUMBOTRON--%>

        <c:forEach items="${postList}" var="postItem">
            <div class="row">
                <div class="col-md-12 col-lg-12">
                    <h1><a href="<c:url value="/post/${postItem.id}"/>">${postItem.titulo}</a></h1>
                    <div>
                        <div class="pull-right" style="padding: 10px 0 0 5px;">${postItem.autor.nombre}</div>
                        <img alt="User Pic" src="http://i.pravatar.cc/50?u=${postItem.autor.email}"
                             class="img-circle img-responsive pull-right">
                        <p></p>
                    </div>
                    <div style="clear: both; margin-bottom: 10px;"></div>
                    <c:if test="${not empty postItem.url}">
                        <p><a href="<c:url value="${postItem.url}" />">${postItem.url}</a></p>
                    </c:if>
                    <div class="dotdotdot">
                        <p>${postItem.contenido}</p>
                    </div>
                    <div>
					<span class="badge">Escrito el <fmt:formatDate pattern="dd/MM/yyyy" value="${postItem.fecha}" /> a las
					<fmt:formatDate pattern="HH:mm:ss" value="${postItem.fecha}" /></span>
                        <span class="label label-info">${(fn:length(postItem.comments) gt 0) ? fn:length(postItem.comments) : 'Sin '}
                                ${(fn:length(postItem.comments) == 1) ? 'comentario' : 'comentarios'}</span>
                    </div>
                    <hr>
                </div>
            </div>
        </c:forEach>

    <%-- POSTS? --%>
    <c:if test="${not empty postList}">
    <div class="my-3 p-3 bg-white rounded box-shadow">
        <h6 class="border-bottom border-gray pb-2 mb-0">Ultimos posts</h6>
        <c:forEach items="${postList}" var="postItem">
            <div class="media text-muted pt-3">
                <img data-src="holder.js/32x32?theme=thumb&bg=007bff&fg=007bff&size=1" alt="" class="mr-2 rounded" />
                <p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
                    <strong class="d-block text-gray-dark">${postItem.autor.nombre}</strong>
                    <div class="dotdotdot">
                        <p>${postItem.contenido}</p>
                    </div>
                </p>
                <span class="badge">Escrito el <fmt:formatDate pattern="dd/MM/yyyy" value="${postItem.fecha}" /> a las
                        <fmt:formatDate pattern="HH:mm:ss" value="${postItem.fecha}" /></span>
                <span class="label label-info">${(fn:length(postItem.comments) gt 0) ? fn:length(postItem.comments) : 'Sin '}
                        ${(fn:length(postItem.comments) == 1) ? 'comentario' : 'comentarios'}</span>
                </div>
            </div>
        </c:forEach>
        <small class="d-block text-right mt-3">
            <a href="#">Todos los posts</a>
        </small>
    </div>
    </c:if>
    <%-- END POSTS --%>

    <%-- SUGGESTIONS --%>
    <div class="my-3 p-3 bg-white rounded box-shadow">
        <h6 class="border-bottom border-gray pb-2 mb-0">Suggestions</h6>
        <c:forEach items="1,2,3" var="index">
            <div class="media text-muted pt-3">
                <img data-src="holder.js/32x32?theme=thumb&bg=007bff&fg=007bff&size=1" alt="" class="mr-2 rounded">
                <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
                    <div class="d-flex justify-content-between align-items-center w-100">
                        <strong class="text-gray-dark">Full Name</strong>
                        <a href="#">Follow</a>
                    </div>
                    <span class="d-block">@username</span>
                </div>
            </div>
        </c:forEach>
        <small class="d-block text-right mt-3">
            <a href="#">All suggestions</a>
        </small>
    </div>
    <%-- END SUGGESTIONS--%>


</main>

<c:import url="includes/footer.jsp" />

<script>
    $(document).ready(function() {
        $(".dotdotdot").dotdotdot({
            height: 150
        });
    });
</script>

</body>