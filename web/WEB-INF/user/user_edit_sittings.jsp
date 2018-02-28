<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <fmt:setLocale value="${sessionScope.local}"/>
    <fmt:setBundle basename="localization.local" var="loc"/>
    <fmt:message bundle="${loc}" key="local.user.settings" var="settings"/>
    <fmt:message bundle="${loc}" key="local.user.name" var="name"/>
    <fmt:message bundle="${loc}" key="local.user.number" var="number"/>
    <fmt:message bundle="${loc}" key="local.user.surname" var="surname"/>
    <fmt:message bundle="${loc}" key="local.user.email" var="email"/>
    <fmt:message bundle="${loc}" key="local.user.login.noun" var="login"/>
    <fmt:message bundle="${loc}" key="local.user.password" var="password"/>
    <fmt:message bundle="${loc}" key="local.admin.save" var="save"/>
    <title>${settings}</title>
    <c:set scope="session" var="url" value="/user/settings"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/menu.css">
    <style>
        <%@include file="/css/style.css"%>
    </style>
</head>
<body>
<c:import url="/menu.jsp"/>
<div id="page-content-wrapper">
    <c:import url="/WEB-INF/user/user_head_account.jsp"/>
    <form action="${pageContext.request.contextPath}/controller" method="post">
        <input type="hidden" name="command" value="edit-user-command">
        <input type="hidden" name="id" value="${sessionScope.user.id}"><br>
        <table>
            <tr>
                <td>${name}</td>
                <td><input type="text" name="name" value="${sessionScope.user.name}"></td>
            </tr>
            <tr>
                <td>${surname}</td>
                <td><input type="text" name="surname" value="${sessionScope.user.surname}"></td>
            </tr>
            <tr>
                <td>${login}</td>
                <td><input type="text" name="login" value="${sessionScope.user.login}"></td>
            </tr>
            <tr>
                <td>${password}</td>
                <td><input type="password" style="width:200px;height: 20px ;" name="password"
                           value="${sessionScope.user.password}"></td>
            </tr>
            <tr>
                <td>${email}</td>
                <td><input type="text" name="email" value="${sessionScope.user.email}"></td>
            </tr>
            <tr>
                <td>${number}</td>
                <td><input type="text" pattern="[+]{0,1}[0-9-]*" name="number" value="${sessionScope.user.number}"></td>
            </tr>
        </table>
        <input type="submit" value="${save}">
    </form>
</div>
</body>
</html>
