<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <fmt:setLocale value="${sessionScope.local}"/>
    <fmt:setBundle basename="localization.local" var="loc"/>
    <fmt:message bundle="${loc}" key="local.block.page" var="block_page"/>
    <fmt:message bundle="${loc}" key="local.block.page.message" var="message"/>
    <fmt:message bundle="${loc}" key="local.block.page.reason" var="reason"/>
    <fmt:message bundle="${loc}" key="local.block.page.contacts" var="contacts"/>
    <title>${block_page}</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <c:set scope="session" var="url" value="block_page.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/menu.css">
</head>
<body>
<c:import url="menu.jsp"/>
<div id="page-content-wrapper">
    <div class="main-window">
        <div style="color: gainsboro">
            ${message}<br>
            ${reason}<br>
            ${contacts}<br>
        </div>
    </div>
    <c:import url="footer.jsp"/>
</div>
</body>
</html>
