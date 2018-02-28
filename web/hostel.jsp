<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <fmt:setLocale value="${sessionScope.local}"/>
    <fmt:setBundle basename="localization.local" var="loc"/>
    <fmt:message bundle="${loc}" key="local.title.hotel" var="hotel"/>
    <fmt:message bundle="${loc}" key="local.hostel.city" var="city"/>
    <fmt:message bundle="${loc}" key="local.hostel.stars" var="stars"/>
    <fmt:message bundle="${loc}" key="local.hostel.address" var="address"/>
    <fmt:message bundle="${loc}" key="local.hostel.rooms" var="rooms"/>
    <title>${hotel}</title>


    <jsp:include page="${pageContext.request.contextPath}/controller">
        <jsp:param name="command" value="view-hostel-command"/>
        <jsp:param name="id" value="${param.id}"/>
    </jsp:include>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/menu.css">
    <c:set scope="session" var="url" value="/hostel.jsp?id=${param.id}"/>
</head>
<body>
<c:import url="menu.jsp"/>
<div id="page-content-wrapper">
    <div class="page-content">
        <h1 style="
    text-align: center;
    text-transform: uppercase;
    margin-top: 0;
    color: #9eaeee;">${requestScope.hostel.name} </h1>
        <img src="${requestScope.hostel.imgPath}" style=" width: 50%;"/>
        <table>
            <tr>
                <td>${stars}</td>
                <td>${requestScope.hostel.stars}</td>
            </tr>
            <tr>
                <td>${city}</td>
                <td>${requestScope.hostel.city}</td>
            </tr>
            <tr>
                <td>${address}</td>
                <td>${requestScope.hostel.address}</td>
            </tr>
        </table>
        <p>${requestScope.hostel.description}</p>
        <a style="float: right"
           href="${pageContext.request.contextPath}/search.jsp?city=${requestScope.hostel.city}">${rooms}</a>
    </div>
    <c:import url="footer.jsp"/>
</div>
</body>
</html>
