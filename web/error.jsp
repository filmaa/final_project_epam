<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <fmt:setLocale value="${sessionScope.local}"/>
    <fmt:setBundle basename="localization.local" var="loc"/>
    <fmt:message bundle="${loc}" key="local.error" var="error"/>
    <fmt:message bundle="${loc}" key="${requestScope.message}" var="message"/>
    <title>${error}</title>
</head>
<body>
<c:import url="menu.jsp"/>
<div id="page-content-wrapper">
    <h3 class="    text-align: center;
    text-transform: uppercase;
    margin-top: 0;
    color: #9eaeee;">${message}</h3>
</div>
</body>
</html>
