<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <fmt:setLocale value="${sessionScope.local}"/>
    <fmt:setBundle basename="localization.local" var="loc"/>
    <fmt:message bundle="${loc}" key="local.button.name.en" var="en_button"/>
    <fmt:message bundle="${loc}" key="local.button.name.ru" var="ru_button"/>
    <fmt:message bundle="${loc}" key="local.admin.edit" var="edit"/>
    <fmt:message bundle="${loc}" key="local.hostel.name" var="name"/>
    <fmt:message bundle="${loc}" key="local.hostel.stars" var="stars"/>
    <fmt:message bundle="${loc}" key="local.russian" var="russian"/>
    <fmt:message bundle="${loc}" key="local.englich" var="english"/>
    <fmt:message bundle="${loc}" key="local.hostel.country" var="country"/>
    <fmt:message bundle="${loc}" key="local.hostel.city" var="city"/>
    <fmt:message bundle="${loc}" key="local.hostel.address" var="address"/>
    <fmt:message bundle="${loc}" key="local.hostel.description" var="description"/>
    <fmt:message bundle="${loc}" key="local.hostel.update.image" var="updateImage"/>
    <fmt:message bundle="${loc}" key="local.admin.save" var="save"/>
    <title></title>
    <c:set scope="session" var="url" value="/admin/add_hotel"/>
</head>
<body>
<%@include file="/WEB-INF/admin/admin_header.jsp" %>
<form action="${pageContext.request.contextPath}/controller" method="post" enctype="multipart/form-data">
    <input type="hidden" name="command" value="add-hostel-command">
    ${name}:<input type="text" name="name">
    <br>
    ${stars}:<input type="text" name="stars">
    <br>
    <div>${russian}</div>
    ${country}:<input type="text" name="countryRu">
    <br>
    ${city}:<input type="text" name="cityRu">
    <br>
    ${address}:<input type="text" name="addressRu">
    <br>
    ${description}:<input type="text" name="descriptionRu">
    <div>${english}</div>
    ${country}:<input type="text" name="countryEn">
    <br>
    ${city}:<input type="text" name="cityEn">
    <br>
    ${address}:<input type="text" name="addressEn">
    <br>
    ${description}:<input type="text" name="descriptionEn">
    <br>
    <img src="${requestScope.hostelEn.imgPath}">
    <input type="file" name="file" accept="image/jpeg">
    <input type="submit" value="${save}">
</form>
</body>
</html>
