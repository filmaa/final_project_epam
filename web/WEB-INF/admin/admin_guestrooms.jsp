<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <fmt:setLocale value="${sessionScope.local}"/>
    <fmt:setBundle basename="localization.local" var="loc"/>
    <fmt:message bundle="${loc}" key="local.admin.guestrooms" var="rooms"/>
    <fmt:message bundle="${loc}" key="local.button.name.en" var="en_button"/>
    <fmt:message bundle="${loc}" key="local.button.name.ru" var="ru_button"/>
    <fmt:message bundle="${loc}" key="local.admin.edit" var="edit"/>
    <fmt:message bundle="${loc}" key="local.admin.delete" var="delete"/>
    <fmt:message bundle="${loc}" key="local.page.from" var="from"/>
    <fmt:message bundle="${loc}" key="local.search.search" var="search"/>
    <fmt:message bundle="${loc}" key="local.admin.search.by.hostel" var="searchByHostel"/>
    <fmt:message bundle="${loc}" key="local.guestroom.add.new" var="addGuestroom"/>
    <title>${rooms}</title>
    <c:set scope="session" var="url" value="/admin/admin_guestrooms?page=${param.page}&name=${param.name}"/>
</head>
<body>
<%@include file="/WEB-INF/admin/admin_header.jsp" %>
<jsp:include page="${pageContext.request.contextPath}/controller">
    <jsp:param name="command" value="get-guestrooms-command"/>
    <jsp:param name="page" value="${param.page}"/>
    <jsp:param name="name" value="${param.name}"/>
</jsp:include>
<jsp:include page="${pageContext.request.contextPath}/controller">
    <jsp:param name="command" value="get-hostels-names-command"/>
    <jsp:param name="page" value="${param.page}"/>
    <jsp:param name="name" value="${param.name}"/>
</jsp:include>
<div>
    <form action="${pageContext.request.contextPath}/admin/admin_guestrooms" method="get">
        <input type="hidden" name="command" value="get-guestrooms-command">
        <input type="hidden" name="page" value="${param.page}"/>
        ${searchByHostel}:&#8195;
        <select name="name">
            <option value="any"></option>
            <c:forEach var="name" items="${requestScope.names}">
                <option value="${name}">${name}</option>
            </c:forEach>
        </select>
        <input type="submit" value="${search}">
    </form>
</div>
<a href="${pageContext.request.contextPath}/admin/add_guestroom">${addGuestroom}</a>
<table>
    <thead>
    <tr>
        <td>ID</td>
        <td>${edit}</td>
        <td>${delete}</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="room" items="${requestScope.page.entity}">
        <tr>
            <td>${room.id}</td>
            <td>
                <a href="${pageContext.request.contextPath}/admin/edit_guestroom?id=${room.id}">${edit}</a>
            </td>
            <td>
                <form action="${pageContext.request.contextPath}/controller" method="post">
                    <input type="hidden" name="command" value="delete-guestroom-command">
                    <input type="hidden" name="id" value="${room.id}">
                    <input type="submit" value="${delete}">
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">
    <c:if test="${requestScope.page.currentPage gt 1}">
        <a href="${pageContext.request.contextPath}/admin/admin_guestrooms?page=1&name=${param.name}"><<</a>&#8195;
        <a href="${pageContext.request.contextPath}/admin/admin_guestrooms?page=${requestScope.page.currentPage - 1}&name=${param.name}"><</a>&#8195;
    </c:if>
    &#8195;${requestScope.page.currentPage} ${from} ${requestScope.page.numberOfPages}&#8195;
    <c:if test="${requestScope.page.currentPage lt requestScope.page.numberOfPages}">
        <a href="${pageContext.request.contextPath}/admin/admin_guestrooms?page=${requestScope.page.currentPage + 1}&name=${param.name}">></a>&#8195;
        <a href="${pageContext.request.contextPath}/admin/admin_guestrooms?page=${requestScope.page.numberOfPages}&name=${param.name}">>></a>
    </c:if>
</div>
</body>
</html>
