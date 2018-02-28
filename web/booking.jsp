<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <fmt:setLocale value="${sessionScope.local}"/>
    <fmt:setBundle basename="localization.local" var="loc"/>
    <fmt:message bundle="${loc}" key="local.booking.yours" var="yourBooking"/>
    <fmt:message bundle="${loc}" key="local.booking.dates" var="dates"/>
    <fmt:message bundle="${loc}" key="local.search.date.from" var="from"/>
    <fmt:message bundle="${loc}" key="local.search.date.to" var="to"/>
    <fmt:message bundle="${loc}" key="local.hostel.name" var="hostelName"/>
    <fmt:message bundle="${loc}" key="local.hostel.stars" var="stars"/>
    <fmt:message bundle="${loc}" key="local.hostel.country" var="country"/>
    <fmt:message bundle="${loc}" key="local.hostel.city" var="city"/>
    <fmt:message bundle="${loc}" key="local.hostel.address" var="address"/>
    <fmt:message bundle="${loc}" key="local.guestroom.night.price" var="nightPrice"/>
    <fmt:message bundle="${loc}" key="local.guestroom.own.bathroom" var="bathroom"/>
    <fmt:message bundle="${loc}" key="local.booking.final.cost" var="finalCost"/>
    <fmt:message bundle="${loc}" key="local.search.book" var="book"/>
    <fmt:message bundle="${loc}" key="local.message.need.log.in" var="needLogIn"/>
    <title>${yourBooking}</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <c:set scope="session" var="url"
           value="${pageContext.request.contextPath}/booking.jsp?id=${param.id}&dateFrom=${param.dateFrom}&dateTo=${param.dateTo}"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/menu.css">

</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/controller">
    <jsp:param name="command" value="view-guestroom-command"/>
    <jsp:param name="id" value="${param.id}"/>
</jsp:include>
<jsp:include page="${pageContext.request.contextPath}/controller">
    <jsp:param name="command" value="view-hostel-command"/>
    <jsp:param name="id" value="${requestScope.guestroom.hostelId}"/>
</jsp:include>
<jsp:include page="${pageContext.request.contextPath}/controller">
    <jsp:param name="command" value="get-booking-details-command"/>
    <jsp:param name="dateFrom" value="${param.dateFrom}"/>
    <jsp:param name="dateTo" value="${param.dateTo}"/>
</jsp:include>
<c:import url="/menu.jsp"/>
<div id="page-content-wrapper">
    <div class="page-content" style="color:whitesmoke;">
        <form action="${pageContext.request.contextPath}/controller" method="post">
            <input type="hidden" name="command" value="booking-room-command">
            <div>${yourBooking}</div>
            <div>${dates} ${from} <input type="hidden" value="${param.dateFrom}" name="dateFrom">${param.dateFrom}
                ${to} <input type="hidden" value="${param.dateTo}" name="dateTo">${param.dateTo}</div>
            <div>${hostelName}:${requestScope.hostel.name}</div>
            <div>${stars}: ${requestScope.hostel.stars}</div>
            <div>${country}: ${requestScope.hostel.country}</div>
            <div>${city}: ${requestScope.hostel.city}</div>
            <div>${address}: ${requestScope.hostel.address}</div>
            <div>${nightPrice}: ${requestScope.guestroom.nightPrice}</div>
            <div class="properties">
                <li>WiFi <c:choose><c:when test="${requestScope.guestroom.wifi eq true}">
                    <img src="${pageContext.request.contextPath}/img/toolbar/tick.svg">
                </c:when><c:otherwise>
                    <img src="${pageContext.request.contextPath}/img/toolbar/cross.svg">
                </c:otherwise></c:choose></li>
                <li>TV <c:choose><c:when test="${requestScope.guestroom.tv eq true}">
                    <img src="${pageContext.request.contextPath}/img/toolbar/tick.svg">
                </c:when><c:otherwise>
                    <img src="${pageContext.request.contextPath}/img/toolbar/cross.svg">
                </c:otherwise></c:choose></li>
                <li>${bathroom}
                    <c:choose>
                        <c:when test="${requestScope.guestroom.bath eq true}">
                            <img src="${pageContext.request.contextPath}/img/toolbar/tick.svg">
                        </c:when>
                        <c:otherwise>
                            <img src="${pageContext.request.contextPath}/img/toolbar/cross.svg">
                        </c:otherwise>
                    </c:choose>
                </li>
            </div>
            <div>${finalCost}: ${requestScope.finalCost}</div>
            <input type="hidden" name="id" value="${param.id}">
            <c:choose>
                <c:when test="${sessionScope.user.role eq 'USER'}">
                    <input style="color: #000" type="submit" value="${book}">
                </c:when>
                <c:otherwise>
                    ${needLogIn}
                </c:otherwise>
            </c:choose>
        </form>
    </div>
    <c:import url="/footer.jsp"/>
</div>
</body>
</html>
