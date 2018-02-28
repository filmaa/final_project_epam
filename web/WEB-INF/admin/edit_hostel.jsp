<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <fmt:setLocale value="${sessionScope.local}"/>
    <fmt:setBundle basename="localization.local" var="loc"/>
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
    <fmt:message bundle="${loc}" key="local.button.name.en" var="en_button"/>
    <fmt:message bundle="${loc}" key="local.button.name.ru" var="ru_button"/>
    <title>${edit}</title>

    <c:set scope="session" var="url" value="/admin/edit_hostel?id=${param.id}"/>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/controller">
    <jsp:param name="command" value="get-hostel-with-descriptions-command"/>
    <jsp:param name="id" value="${param.id}"/>
</jsp:include>
<%@include file="/WEB-INF/admin/admin_header.jsp" %>
<form action="${pageContext.request.contextPath}/controller" method="post" enctype="multipart/form-data" role="form">
    <input type="hidden" name="command" value="edit-hostel-command">
    <input type="hidden" name="id" value="${param.id}">
    ${name}:<input type="text" name="name" value="${requestScope.hostelRu.name}">
    <br>
    ${stars}:<input type="text" name="stars" value="${requestScope.hostelRu.stars}">
    <br>
    <div>${russian}</div>
    ${country}:<input type="text" name="countryRu" value="${requestScope.hostelRu.country}">
    <br>
    ${city}:<input type="text" name="cityRu" value="${requestScope.hostelRu.city}">
    <br>
    ${address}:<input type="text" name="addressRu" value="${requestScope.hostelRu.address}">
    <br>
    ${description}:<input type="text" name="descriptionRu" value="${requestScope.hostelRu.description}">

    <div>${english}</div>
    ${country}:<input type="text" name="countryEn" value="${requestScope.hostelEn.country}">
    <br>
    ${city}:<input type="text" name="cityEn" value="${requestScope.hostelEn.city}">
    <br>
    ${address}:<input type="text" name="addressEn" value="${requestScope.hostelEn.address}">
    <br>
    ${description}:<input type="text" name="descriptionEn" value="${requestScope.hostelEn.description}">
    <br>
    ${updateImage}<br>
    <img src="${requestScope.hostelEn.imgPath}">
    <input type="hidden" name="imgPath" value="${requestScope.hostelEn.imgPath}">
    <input type="file" name="file" accept="image/jpeg">
    <input type="submit" value="${save}">
</form>
</body>
</html>
