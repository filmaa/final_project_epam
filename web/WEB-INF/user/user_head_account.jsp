<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <fmt:setLocale value="${sessionScope.local}"/>
    <fmt:setBundle basename="localization.local" var="loc"/>
    <fmt:message bundle="${loc}" key="local.user.my.bookings" var="bookings"/>
    <fmt:message bundle="${loc}" key="local.user.settings" var="settings"/>
    <fmt:message bundle="${loc}" key="local.admin.logout" var="logout"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        <%@include file="/css/style.css"%>
    </style>
</head>
<body>
<div>
    <div class="head-navbar">
        <li>
            <a href="${pageContext.request.contextPath}/user/bookings">${bookings}</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/user/settings">${settings}</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/controller?command=logout-command">${logout}</a>
        </li>
    </div>
</div>

</body>
</html>
