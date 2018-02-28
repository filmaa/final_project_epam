<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <fmt:setLocale value="${sessionScope.local}"/>
    <fmt:setBundle basename="localization.local" var="loc"/>
    <fmt:message bundle="${loc}" key="local.button.name.en" var="en_button"/>
    <fmt:message bundle="${loc}" key="local.button.name.ru" var="ru_button"/>
    <fmt:message bundle="${loc}" key="local.title.hotel" var="hotel"/>
    <fmt:message bundle="${loc}" key="local.guestroom.description.ru" var="descriptionRu"/>
    <fmt:message bundle="${loc}" key="local.guestroom.description.en" var="descriptionEn"/>
    <fmt:message bundle="${loc}" key="local.search.shower" var="shower"/>
    <fmt:message bundle="${loc}" key="local.guestroom.night.price" var="nightPrice"/>
    <fmt:message bundle="${loc}" key="local.guestroom.capacity" var="capacity"/>
    <fmt:message bundle="${loc}" key="local.admin.edit" var="edit"/>
    <fmt:message bundle="${loc}" key="local.admin.add.image" var="addImg"/>
    <fmt:message bundle="${loc}" key="local.admin.save" var="save"/>
    <fmt:message bundle="${loc}" key="local.admin.delete" var="delete"/>

    <title>${edit}</title>
    <c:set scope="session" var="url" value="/admin/edit_guestroom?id=${param.id}"/>
</head>
<body>
<%@include file="/WEB-INF/admin/admin_header.jsp" %>
<jsp:include page="${pageContext.request.contextPath}/controller">
    <jsp:param name="command" value="get-hostels-names-command"/>
</jsp:include>
<jsp:include page="${pageContext.request.contextPath}/controller">
    <jsp:param name="command" value="get-guestroom-by-id-command"/>
</jsp:include>
<jsp:include page="${pageContext.request.contextPath}/controller">
    <jsp:param name="command" value="get-guestroom-descriptions-command"/>
</jsp:include>
<jsp:include page="${pageContext.request.contextPath}/controller">
    <jsp:param name="command" value="get-hostel-name-by-id-command"/>
</jsp:include>
<form action="${pageContext.request.contextPath}/controller" method="post">
    <input type="hidden" name="command" value="edit-guestroom-command">
    <input type="hidden" name="id" value="${param.id}">
    ${hotel}:&#8195;
    <div>
        <select name="name">
            <option>${requestScope.hostelName}</option>
            <c:forEach var="name" items="${requestScope.names}">
                <option value="${name}">${name}</option>
            </c:forEach>
        </select>
    </div>
    <div>
        ${descriptionRu}<input type="text" name="descriptionRu" value="${requestScope.descriptionRu}">
        <br>
        ${descriptionEn}<input type="text" name="descriptionEn" value="${requestScope.descriptionEn}">
    </div>
    <div>
        <c:choose>
            <c:when test="${requestScope.guestroom.wifi}">
                <div>wifi<input type="checkbox" value="true" name="wifi" checked/></div>
            </c:when>
            <c:otherwise>
                <div>wifi<input type="checkbox" value="true" name="wifi"/></div>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${requestScope.guestroom.tv}">
                <div>TV<input type="checkbox" value="true" name="tv" checked/></div>
            </c:when>
            <c:otherwise>
                <div>TV<input type="checkbox" value="true" name="tv"/></div>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${requestScope.guestroom.bath}">
                <div>${shower}<input type="checkbox" value="true" name="bath" checked/></div>
            </c:when>
            <c:otherwise>
                <div>${shower}<input type="checkbox" value="true" name="bath"/></div>
            </c:otherwise>
        </c:choose>
    </div>
    <div>
        ${capacity}:
        <input type="text" pattern="[0-9]*" name="capacity" value="${requestScope.guestroom.capacity}">
        <br>
        ${nightPrice}:
        <input type="text" pattern="[0-9]*" name="nightPrice" value="${requestScope.guestroom.nightPrice}">
    </div>
    <input type="submit" value="${save}">
</form>
<form role="form" action="${pageContext.request.contextPath}/controller" method="post" enctype="multipart/form-data">
    <input type="hidden" name="command" value="add-picture-guestroom-command">
    <input type="hidden" name="id" value="${param.id}">
    ${addImg}<input type="file" name="file" accept="image/jpeg">
    <input type="submit" value="${save}">
</form>
<table>
    <c:forEach var="img" items="${requestScope.guestroom.imgPath}">
        <form action="${pageContext.request.contextPath}/controller" method="post">
            <input type="hidden" name="command" value="delete-guestroom-img-command">
            <input type="hidden" name="imgPath" value="${img}">
            <input type="hidden" name="id" value="${param.id}">
            <img src="${img}" width=350px>
            <input type="submit" value="${delete}">
            <br>
        </form>
    </c:forEach>
</table>
</body>
</html>
