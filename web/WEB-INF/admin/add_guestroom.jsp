<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <fmt:setLocale value="${sessionScope.local}"/>
    <fmt:setBundle basename="localization.local" var="loc"/>
    <fmt:message bundle="${loc}" key="local.admin.add.guestroom" var="addGuestroom"/>
    <fmt:message bundle="${loc}" key="local.button.name.en" var="en_button"/>
    <fmt:message bundle="${loc}" key="local.button.name.ru" var="ru_button"/>
    <fmt:message bundle="${loc}" key="local.title.hotel" var="hotel"/>
    <fmt:message bundle="${loc}" key="local.guestroom.description.ru" var="descriptionRu"/>
    <fmt:message bundle="${loc}" key="local.guestroom.description.en" var="descriptionEn"/>
    <fmt:message bundle="${loc}" key="local.search.shower" var="shower"/>
    <fmt:message bundle="${loc}" key="local.guestroom.night.price" var="nightPrice"/>
    <fmt:message bundle="${loc}" key="local.guestroom.capacity" var="capacity"/>
    <fmt:message bundle="${loc}" key="local.admin.add.image" var="addImg"/>
    <fmt:message bundle="${loc}" key="local.admin.save" var="save"/>

    <title>${addGuestroom}</title>

    <c:set scope="session" var="url" value="/admin/add_guestroom"/>
</head>
<body>
<%@include file="/WEB-INF/admin/admin_header.jsp" %>
<jsp:include page="${pageContext.request.contextPath}/controller">
    <jsp:param name="command" value="get-hostels-names-command"/>
</jsp:include>
<form role="form" action="${pageContext.request.contextPath}/controller" method="post" enctype="multipart/form-data">
    <input type="hidden" name="command" value="add-guestroom-command">
    ${hotel}:&#8195;
    <div>
        <select name="name">
            <option value="any"></option>
            <c:forEach var="name" items="${requestScope.names}">
                <option value="${name}">${name}</option>
            </c:forEach>
        </select>
    </div>
    <div>
        ${descriptionRu}<input type="text" name="descriptionRu">
        <br>
        ${descriptionEn}<input type="text" name="descriptionEn">
    </div>
    <div>
        <div>wifi<input type="checkbox" value="true" name="wifi"/></div>
        <div>TV<input type="checkbox" value="true" name="tv"/></div>
        <div>${shower}<input type="checkbox" value="true" name="shower"/></div>
    </div>
    <div>
        ${capacity}:<input type="text" pattern="[0-9]*" name="capacity">
        ${nightPrice}:<input type="text" pattern="[0-9]*" name="nightPrice">
    </div>
    ${addImg}<input type="file" name="file" accept="image/jpeg">
    <input type="submit" value="${save}">
</form>

</body>
</html>
