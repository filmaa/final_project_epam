<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:setLocale value="${sessionScope.local}"/>
<fmt:setBundle basename="localization.local" var="loc"/>
<fmt:message bundle="${loc}" key="local.footer.information" var="information"/>
<fmt:message bundle="${loc}" key="local.footer.contacts" var="contacts"/>
<fmt:message bundle="${loc}" key="local.footer.rooms" var="rooms"/>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

<div class="footer">
    <a href="#">${information}</a>
    <a href="#">${contacts}</a>
    <a href="${pageContext.request.contextPath}/search.jsp">${rooms}</a>
</div>

