<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h5 class="my-0 mr-md-auto font-weight-normal"><a href="<c:url value="/" />">Simple blog</a></h5>
<c:choose>
    <c:when test="${not empty sessionScope.user}">
        <jsp:include page="menu_logged.jsp" flush="true">
            <jsp:param name="inicio" value="inicio" />
            <jsp:param name="usuario" value="${sessionScope.userLoggedIn.nombre}" />
        </jsp:include>
    </c:when>
    <c:otherwise>
        <jsp:include page="menu_notlogged.jsp">
            <jsp:param name="inicio" value="inicio" />
        </jsp:include>
    </c:otherwise>
</c:choose>