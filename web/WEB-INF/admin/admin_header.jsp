<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <fmt:setLocale value="${sessionScope.local}"/>
    <fmt:setBundle basename="localization.local" var="loc"/>
    <fmt:message bundle="${loc}" key="local.admin.hostels" var="hostel"/>
    <fmt:message bundle="${loc}" key="local.admin.users" var="users"/>
    <fmt:message bundle="${loc}" key="local.admin.guestrooms" var="rooms"/>
    <fmt:message bundle="${loc}" key="local.admin.booking" var="bookings"/>
    <fmt:message bundle="${loc}" key="local.admin.logout" var="logout"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">

</head>
<body>
<div class="head-navbar">
    <li><a href="${pageContext.request.contextPath}/admin/admin_users">${users}</a></li>
    <li><a href="${pageContext.request.contextPath}/admin/admin_hostels">${hostel}</a></li>
    <li><a href="${pageContext.request.contextPath}/admin/admin_guestrooms">${rooms}</a></li>
    <li><a href="${pageContext.request.contextPath}/admin/admin_users_bookings">${bookings}</a></li>
    <li><a href="${pageContext.request.contextPath}/controller?command=logout-command">${logout}</a></li>
    <li>
        <form action="${pageContext.request.contextPath}/controller" method="post">
            <input type="hidden" name="command" value="change-local-command">
            <input type="hidden" name="local" value="ru"/>
            <input type="submit" value="${ru_button}"/>
        </form>
    </li>
    <li>
        <form action="${pageContext.request.contextPath}/controller" method="post">
            <input type="hidden" name="command" value="change-local-command">
            <input type="hidden" name="local" value="en"/>
            <input type="submit" value="${en_button}">
        </form>
    </li>
</div>
</body>
</html>