<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <fmt:setLocale value="${sessionScope.local}"/>
    <fmt:setBundle basename="localization.local" var="loc"/>
    <fmt:message bundle="${loc}" key="local.admin.hostels" var="hostel"/>
    <fmt:message bundle="${loc}" key="local.index.perfect" var="perfect"/>
    <fmt:message bundle="${loc}" key="local.search.book.suit" var="book_suit"/>
    <fmt:message bundle="${loc}" key="local.hostel.rooms" var="rooms"/>
    <fmt:message bundle="${loc}" key="local.hostel.city" var="city"/>
    <fmt:message bundle="${loc}" key="local.hostel.stars" var="stars"/>
    <fmt:message bundle="${loc}" key="local.hostel.address" var="address"/>
    <fmt:message bundle="${loc}" key="local.hostel.look.hostel" var="look_hostel"/>

    <title>${hostel}</title>

    <jsp:include page="${pageContext.request.contextPath}/controller">
        <jsp:param name="command" value="get-hostels-command"/>
    </jsp:include>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <c:set scope="session" var="url" value="index.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/menu.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/search.css">
</head>
<body>
<c:import url="menu.jsp"/>
<div id="page-content-wrapper">
    <div id="welcomeCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#welcomeCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#welcomeCarousel" data-slide-to="1"></li>
            <li data-target="#welcomeCarousel" data-slide-to="2"></li>
            <li data-target="#welcomeCarousel" data-slide-to="3"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox" style="height: 70%">
            <div class="item active">
                <img src="img/city/city.jpg" alt="City">
                <div class="carousel-caption">
                    <h3>${perfect}</h3>
                    <p><a href="search.jsp">${book_suit}</a></p>
                </div>
            </div>

            <div class="item">
                <img src="img/city/moscow.jpg" alt="Moscow">
                <div class="carousel-caption">
                    <h3>${perfect}</h3>
                    <p><a href="search.jsp">${book_suit}</a></p>
                </div>
            </div>

            <div class="item">
                <img src="img/city/paris1.jpg" alt="Paris">
                <div class="carousel-caption">
                    <h3>${perfect}</h3>
                    <p><a href="search.jsp">${book_suit}</a></p>
                </div>
            </div>
            <div class="item">
                <img src="img/city/moscow3.jpg" alt="Moscow">
                <div class="carousel-caption">
                    <h3>${perfect}</h3>
                    <p><a href="search.jsp">${book_suit}</a></p>
                </div>
            </div>
        </div>

        <!-- Left and right controls -->
        <a class="left carousel-control" href="#welcomeCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#welcomeCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

    <c:forEach var="hostel" items="${requestScope.hostels}">
        <div class="room-hotel">
            <p>
            <h3>${hostel.name}</h3>
            <div class="img-down">
                <img src="${hostel.imgPath}" width="100%"></div>
            <div class="room-description">
                <div class="room-parameters">
                    <table style="background-color:#9476af;width: 50%;color: linen">
                        <tr>
                            <td>${stars}</td>
                            <td>${hostel.stars}</td>
                        </tr>
                        <tr>
                            <td>${city}</td>
                            <td>${hostel.city}</td>
                        </tr>
                        <tr>
                            <td>${address}</td>
                            <td>${hostel.address}</td>
                        </tr>
                    </table>
                </div>
                <div style="">
                        ${hostel.description}</div>
            </div>
            <a style="float: left"
               href="${pageContext.request.contextPath}/hostel.jsp?id=${hostel.id}">${look_hostel}</a>
            <a style="float: right"
               href="${pageContext.request.contextPath}/search.jsp?city=${hostel.city}">${rooms}</a>
            <span class="clear"></span>
        </div>
    </c:forEach>

    <c:import url="footer.jsp"/>
</div>
</body>
</html>
