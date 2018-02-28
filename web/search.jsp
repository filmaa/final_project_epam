<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <fmt:setLocale value="${sessionScope.local}"/>
    <fmt:setBundle basename="localization.local" var="loc"/>
    <fmt:message bundle="${loc}" key="local.menu.search" var="search"/>
    <fmt:message bundle="${loc}" key="local.search.criteria.search" var="searchers"/>
    <fmt:message bundle="${loc}" key="local.booking.night.price" var="price"/>
    <fmt:message bundle="${loc}" key="local.search.night.price.from" var="fromPrice"/>
    <fmt:message bundle="${loc}" key="local.search.night.price.to" var="toPrice"/>
    <fmt:message bundle="${loc}" key="local.search.date" var="dates"/>
    <fmt:message bundle="${loc}" key="local.search.date.from" var="dateFrom"/>
    <fmt:message bundle="${loc}" key="local.search.date.to" var="dateTo"/>
    <fmt:message bundle="${loc}" key="local.search.required.param" var="required"/>
    <fmt:message bundle="${loc}" key="local.search.shower" var="shower"/>
    <fmt:message bundle="${loc}" key="local.search.book" var="book"/>
    <fmt:message bundle="${loc}" key="local.search.date.from" var="from"/>
    <fmt:message bundle="${loc}" key="local.guestroom" var="guestroom"/>
    <fmt:message bundle="${loc}" key="local.search.capacity" var="capacity"/>
    <fmt:message bundle="${loc}" key="local.search.capacity.to" var="capacityTo"/>
    <fmt:message bundle="${loc}" key="local.search.capacity.from" var="capacityFrom"/>
    <fmt:message bundle="${loc}" key="local.search.city.london" var="london"/>
    <fmt:message bundle="${loc}" key="local.search.city.peking" var="peking"/>
    <fmt:message bundle="${loc}" key="local.search.city.moscow" var="moscow"/>
    <fmt:message bundle="${loc}" key="local.search.city.liverpool" var="liverpool"/>
    <fmt:message bundle="${loc}" key="local.search.city.shanghai" var="shanghai"/>
    <fmt:message bundle="${loc}" key="local.text.form" var="textFrom"/>
    <fmt:message bundle="${loc}" key="local.error.empty" var="emptyError"/>
    <fmt:message bundle="${loc}" key="local.error.date" var="dateError"/>
    <fmt:message bundle="${loc}" key="local.hostel.hostel.name" var="hostelName"/>
    <fmt:message bundle="${loc}" key="local.hostel.address" var="address"/>
    <fmt:message bundle="${loc}" key="local.hostel.city" var="city"/>
    <fmt:message bundle="${loc}" key="local.hostel.country" var="country"/>
    <fmt:message bundle="${loc}" key="local.guestroom.night.price" var="nightPrice"/>
    <fmt:message bundle="${loc}" key="local.search.for.start.booking" var="forStartBook"/>
    <fmt:message bundle="${loc}" key="local.user.search.check.search.params" var="infoMessage"/>
    <title>${search}</title>
    <jsp:include page="${pageContext.request.contextPath}/controller">
        <jsp:param name="command" value="get-required-guestrooms-command"/>
        <jsp:param name="page" value="${param.page}"/>
        <jsp:param name="sort" value="${param.sorting}"/>
        <jsp:param name="priceFrom" value="${param.priceFrom}"/>
        <jsp:param name="priceTo" value="${param.priceTo}"/>
        <jsp:param name="dateFrom" value="${param.dateFrom}"/>
        <jsp:param name="dateTo" value="${param.dateTo}"/>
        <jsp:param name="wifi" value="${param.wifi}"/>
        <jsp:param name="tv" value="${param.tv}"/>
        <jsp:param name="shower" value="${param.shower}"/>
        <jsp:param name="capacityFrom" value="${param.capacityFrom}"/>
        <jsp:param name="capacityTo" value="${param.capacityTo}"/>
    </jsp:include>
    <jsp:include page="${pageContext.request.contextPath}/controller">
        <jsp:param name="command" value="get-hostels-cities-command"/>
    </jsp:include>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/search.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/menu.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <!--calendar-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dhmtlxcalendar/fonts/font_roboto/roboto.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dhmtlxcalendar/dhtmlxcalendar.css">
    <script src="${pageContext.request.contextPath}/dhmtlxcalendar/dhtmlxcalendar.js"></script>
    <style>
        input#dateFrom, input#dateTo {
            border: 1px solid #dfdfdf;
            font-family: Roboto, Arial, Helvetica;
            font-size: 14px;
            color: #404040;
            background-color: #fafafa;
            border: #c0c0c0 1px solid;
            width: 100px;
        }

        span.label {
            font-family: Roboto, Arial, Helvetica;
            font-size: 14px;
            color: #404040;
        }
    </style>
    <c:set scope="session" var="url"
           value="/search.jsp?page=${param.page}&sort=${param.sorting}&priceFrom=${param.priceFrom}&priceTo=${param.priceTo}&dateFrom=${param.dateFrom}&dateTo=${param.dateTo}&wifi=${param.wifi}&tv=${param.tv}&shower=${param.shower}&capacityFrom=${param.capacityFrom}&capacityTo=${param.capacityTo}&city=${param.city}"/>
</head>
<body>
<c:import url="menu.jsp"/>
<div id="page-content-wrapper">
    <div class="main-window">
        <div class="criteria-search">
            <button class="hide-search-button" onclick="showDropdown()">
                ${searchers}
            </button>
            <div id="dropdownSearchCriteria" class="search-down">
                <form action="search.jsp" method="get">
                    <input type="hidden" name="command" value="get-required-guestrooms-command">
                    <input type="hidden" name="search" value="true"/>
                    <div class="row">
                        <label class="col-sm-1 search-label" for="city">${city}</label>
                        <div class="col-sm-1">
                            <select id="city" name="city">
                                <c:choose>
                                    <c:when test="${not empty param.city}">
                                        <option value="${param.city}">${param.city}</option>
                                        <option value=""></option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value=""></option>
                                    </c:otherwise>
                                </c:choose>
                                <c:forEach var="it" items="${requestScope.cities}">
                                    <option value="${it}">${it}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-sm-2 search-label">${price}</label>
                    </div>
                    <div class="row">
                        <label for="priceFrom" class="col-sm-1 search-label">${fromPrice}</label>
                        <div class="col-sm-2">
                            <input id="priceFrom" type="text" name="priceFrom" pattern="[0-9]*"/>
                        </div>
                        <label for="priceTo" class="col-sm-1 search-label">${toPrice}</label>
                        <div class="col-sm-2">
                            <input id="priceTo" type="text" name="priceTo" pattern="[0-9]*"/>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-sm-2 search-label">${dates}</label>
                    </div>
                    <div class="date row">
                        <label for="dateFrom" class="col-sm-1 search-label">${dateFrom}</label>
                        <div class="col-sm-2">
                            <input required id="dateFrom" type="text" name="dateFrom" style="width: 150px"
                                   onclick="setSens('dateTo', 'max');"
                                   readonly="true" value="${param.dateFrom}">
                        </div>
                        <label for="dateTo" class="col-sm-1 search-label">${dateTo}</label>
                        <div class="col-sm-2">
                            <input required id="dateTo" type="text" name="dateTo" style="width: 150px"
                                   onclick="setSens('dateFrom', 'min');"
                                   readonly="true" value="${param.dateTo}">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 search-label-error">
                            <c:if test="${requestScope.error eq 'empty'}">
                                <div class="error">${emptyError}</div>
                            </c:if>
                            <c:if test="${requestScope.error eq 'date'}">
                                <div class="error">${dateError}</div>
                            </c:if>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-sm-3 search-label">${capacity}</label>
                    </div>
                    <div class="row">
                        <label for="capacityFrom" class="col-sm-1 search-label">${capacityFrom}</label>
                        <div class="col-sm-2">
                            <input id="capacityFrom" type="text" value="${param.capacityFrom}" name="capacityFrom"
                                   pattern="[0-9]*"/>
                        </div>
                        <label for="capacityTo" class="col-sm-1 search-label">${capacityTo}</label>
                        <div class="col-sm-2">
                            <input id="capacityTo" type="text" value="${param.capacityTo}" name="capacityTo"
                                   pattern="[0-9]*"/>
                        </div>
                    </div>
                    ${required}
                    <div class="row">
                        <label for="wifi" class="col-sm-1 search-label">Wifi</label>
                        <div class="col-sm-1">
                            <c:choose>
                                <c:when test="${param.wifi eq 'true'}">
                                    <input id="wifi" type="checkbox" value="true" name="wifi" checked/>
                                </c:when>
                                <c:otherwise>
                                    <input id="wifi" type="checkbox" value="true" name="wifi"/>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <label for="tv" class="col-sm-1 search-label">TV</label>
                        <div class="col-sm-1">
                            <c:choose>
                                <c:when test="${param.tv eq 'true'}">
                                    <input id="tv" type="checkbox" value="true" name="tv" checked/> </c:when>
                                <c:otherwise>
                                    <input id="tv" type="checkbox" value="true" name="tv"/> </c:otherwise>
                            </c:choose>
                        </div>
                        <label for="shower" class="col-sm-1 search-label">${shower}</label>
                        <div class="col-sm-1">
                            <c:choose>
                                <c:when test="${param.shower eq 'true'}">
                                    <input id="shower" type="checkbox" value="true" name="shower" checked/></c:when>
                                <c:otherwise>
                                    <input id="shower" type="checkbox" value="true" name="shower"/></c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <input type="submit" value="${search}" class="search-button"/>
                </form>
            </div>
        </div>
        <c:if test="${empty requestScope.page.entity}">
            <h1 style="text-align: center;text-transform: uppercase;margin-top: 0;color: #9eaeee;">${infoMessage}</h1>
        </c:if>
        <c:if test="${( empty param.dateTo) or (empty param.dateFrom)}">
            <h4 style="text-align: center; margin-top: 0;color: #ff0000">${forStartBook}</h4>
        </c:if>
        <c:forEach var="room" items="${requestScope.page.entity}">
            <jsp:include page="/controller">
                <jsp:param name="command" value="view-hostel-command"/>
                <jsp:param name="id" value="${room.hostelId}"/>
            </jsp:include>
            <div class="room-hotel">
                <p>
                <div class="img-down"><img src="${room.imgPath[0]}" width="100%"></div>
                <div class="room-description">
                    <div class="room-parameters">
                        <div class="money">${nightPrice}:&#8195;${room.nightPrice}$</div>
                            ${capacity}:&#8195;${room.capacity}<br>
                            ${hostelName}:&#8195;${requestScope.hostel.name}<br>
                            ${country}:&#8195;${requestScope.hostel.country}<br>
                            ${city}:&#8195;${requestScope.hostel.city}<br>
                            ${address}:&#8195;${requestScope.hostel.address}
                    </div>
                    <div style="">
                            ${room.description}</div>
                </div>
                <c:if test="${(not empty param.dateTo) && (not empty param.dateFrom)}">
                    <a href="${pageContext.request.contextPath}/booking.jsp?id=${room.id}&dateFrom=${param.dateFrom}&dateTo=${param.dateTo}">${book}</a>
                </c:if>
                <a style="float: right;"
                   href="${pageContext.request.contextPath}/guestroom.jsp?id=${room.id}">${guestroom}</a>
                <span class="clear"></span>
            </div>
        </c:forEach>
    </div>
    <div class="down-pagination">
        <c:choose> <c:when test="${requestScope.page.currentPage gt 1}">
            <a href="${pageContext.request.contextPath}/search.jsp?page=1&sort=${param.sorting}&priceFrom=${param.priceFrom}&priceTo=${param.priceTo}&dateFrom=${param.dateFrom}&dateTo=${param.dateTo}&wifi=${param.wifi}&tv=${param.tv}&shower=${param.shower}&capacityFrom=${param.capacityFrom}&capacityTo=${param.capacityTo}&city=${param.city}"><<</a>&#8195;
            <a href="${pageContext.request.contextPath}/search.jsp?page=${requestScope.page.currentPage - 1}&sort=${param.sorting}&priceFrom=${param.priceFrom}&priceTo=${param.priceTo}&dateFrom=${param.dateFrom}&dateTo=${param.dateTo}&wifi=${param.wifi}&tv=${param.tv}&shower=${param.shower}&capacityFrom=${param.capacityFrom}&capacityTo=${param.capacityTo}&city=${param.city}"><</a>&#8195;
        </c:when>
            <c:otherwise>
                &#8195;<<&#8195;<&#8195;
            </c:otherwise>
        </c:choose>
        &#8195;${requestScope.page.currentPage} ${textFrom} ${requestScope.page.numberOfPages}&#8195;
        <c:choose><c:when test="${requestScope.page.currentPage lt requestScope.page.numberOfPages}">
            <a href="${pageContext.request.contextPath}/search.jsp?page=${requestScope.page.currentPage + 1}&sort=${param.sorting}&priceFrom=${param.priceFrom}&priceTo=${param.priceTo}&dateFrom=${param.dateFrom}&dateTo=${param.dateTo}&wifi=${param.wifi}&tv=${param.tv}&shower=${param.shower}&capacityFrom=${param.capacityFrom}&capacityTo=${param.capacityTo}&city=${param.city}">></a>&#8195;
            <a href="${pageContext.request.contextPath}/search.jsp?page=${requestScope.page.numberOfPages}&sort=${param.sorting}&priceFrom=${param.priceFrom}&priceTo=${param.priceTo}&dateFrom=${param.dateFrom}&dateTo=${param.dateTo}&wifi=${param.wifi}&tv=${param.tv}&shower=${param.shower}&capacityFrom=${param.capacityFrom}&capacityTo=${param.capacityTo}&city=${param.city}">>></a>
        </c:when>
            <c:otherwise>
                &#8195;>&#8195;>>&#8195;
            </c:otherwise>
        </c:choose>
    </div>
    <c:import url="footer.jsp"/>
</div>

<script>


    function showDropdown() {
        var x = document.getElementById("dropdownSearchCriteria");
        if (x.style.display === "none") {
            x.style.display = "block";
        } else {
            x.style.display = "none";
        }
    }

    dhtmlXCalendarObject.prototype.langData["ru"] = {
        dateformat: '%Y-%m-%d',
        monthesFNames: ["Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь"],
        monthesSNames: ["Янв", "Фев", "Мар", "Апр", "Май", "Июн", "Июл", "Авг", "Сен", "Окт", "Ноя", "Дек"],
        daysFNames: ["Воскресенье", "Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота"],
        daysSNames: ["Вс", "Пн", "Вт", "Ср", "Чт", "Пт", "Сб"],
        weekstart: 1,
        weekname: "н",
        today: "Сегодня",
        clear: "Очистить"
    };

    var calendar;
    $(document).ready(function () {

        showDropdown();

        calendar = new dhtmlXCalendarObject(["dateFrom", "dateTo"]);
        calendar.setDateFormat("%Y-%m-%d");
        calendar.loadUserLanguage('${sessionScope.local}');
        calendar.hideTime();
        calendar.setSensitiveRange(new Date(), null);
        // init values
        // var t = new Date();
        // byId("date_from").value = "2013-03-05";
        // byId("date_to").value = "2013-03-15";
    });

    function setSens(id, k) {
        // update range
        if (k == "min") {
            calendar.setSensitiveRange(byId(id).value, null);
        } else {
            calendar.setSensitiveRange(null, byId(id).value);
        }
    }

    function byId(id) {
        return document.getElementById(id);
    }
</script>
</body>
</html>