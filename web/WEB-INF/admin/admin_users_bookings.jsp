<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <fmt:setLocale value="${sessionScope.local}"/>
    <fmt:setBundle basename="localization.local" var="loc"/>
    <fmt:message bundle="${loc}" key="local.admin.booking" var="booking"/>
    <fmt:message bundle="${loc}" key="local.button.name.en" var="en_button"/>
    <fmt:message bundle="${loc}" key="local.button.name.ru" var="ru_button"/>

    <fmt:message bundle="${loc}" key="local.admin.booking" var="bookings"/>
    <fmt:message bundle="${loc}" key="local.booking.user.id" var="userId"/>
    <fmt:message bundle="${loc}" key="local.booking.id" var="idRoom"/>
    <fmt:message bundle="${loc}" key="local.booking.last.date" var="lastDay"/>
    <fmt:message bundle="${loc}" key="local.booking.start.date" var="startDay"/>
    <fmt:message bundle="${loc}" key="local.booking.night.price" var="nightPrice"/>
    <fmt:message bundle="${loc}" key="local.booking.status.payed" var="status"/>
    <fmt:message bundle="${loc}" key="local.booking.day.of.booking" var="bookDay"/>
    <fmt:message bundle="${loc}" key="local.booking.final.cost" var="finalCost"/>
    <fmt:message bundle="${loc}" key="local.booking.pay.booking" var="pay"/>
    <fmt:message bundle="${loc}" key="local.booking.payed.true" var="isPayed"/>
    <fmt:message bundle="${loc}" key="local.booking.payed.false" var="notPayed"/>
    <fmt:message bundle="${loc}" key="local.text.form" var="from"/>
    <title>${booking}</title>
    <c:set scope="session" var="url" value="/admin/admin_users_bookings"/>
</head>
<body>
<%@include file="/WEB-INF/admin/admin_header.jsp" %>
<jsp:include page="${pageContext.request.contextPath}/controller">
    <jsp:param name="command" value="get-bookins-command"/>
    <jsp:param name="page" value="${param.page}"/>
    <jsp:param name="userId" value="${param.userId}"/>
</jsp:include>
<jsp:include page="${pageContext.request.contextPath}/controller">
    <jsp:param name="command" value="get-users-command"/>
    <jsp:param name="page" value="${param.page}"/>
</jsp:include>
<br>
<form action="${pageContext.request.contextPath}/admin/admin_users_bookings" method="get">
    <input type="hidden" name="command" value="get-bookins-command">
    <input type="hidden" name="page" value="${param.page}"/>
    <label>
        ����� �� ID ������������
        <input name="userId" value="${param.userId}">
    </label>
    <input type="submit">
</form>
<br>
<table>
    <thead>
    <tr>
        <th>${userId}</th>
        <th>${idRoom}</th>
        <th>${nightPrice}</th>
        <th>${startDay}</th>
        <th>${lastDay}</th>
        <th>${status}</th>
        <th>${bookDay}</th>
        <th>${finalCost}</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="booking" items="${requestScope.pageBookings.entity}">
        <tr>
            <td>${booking.userId}</td>
            <td>
                <a style="color: gainsboro;"
                   href="${pageContext.request.contextPath}/admin/edit_guestroom?id=${booking.guestroomId}">${booking.guestroomId}</a>
            </td>
            <td>${booking.nightPrice}</td>
            <td>${booking.startDay}</td>
            <td>${booking.lastDay}</td>
            <td>${booking.id} </td>
            <td>${booking.nightsCount}</td>
            <td>${booking.finalCost}</td>
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
