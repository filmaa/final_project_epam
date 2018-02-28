<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <fmt:setLocale value="${sessionScope.local}"/>
    <fmt:setBundle basename="localization.local" var="loc"/>
    <fmt:message bundle="${loc}" key="local.guestroom" var="room"/>
    <fmt:message bundle="${loc}" key="local.guestroom.properties" var="properties"/>
    <fmt:message bundle="${loc}" key="local.guestroom.capacity" var="capacity"/>
    <fmt:message bundle="${loc}" key="local.guestroom.own.bathroom" var="bathroom"/>
    <fmt:message bundle="${loc}" key="local.title.hotel" var="hotel"/>
    <fmt:message bundle="${loc}" key="local.guestroom.night.price" var="nightPrice"/>
    <fmt:message bundle="${loc}" key="local.comment.message.comment.for.comment" var="actionsForComment"/>
    <fmt:message bundle="${loc}" key="local.comment.comments" var="comments"/>
    <fmt:message bundle="${loc}" key="local.admin.save" var="save"/>
    <title>${room}</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/menu.css">
    <c:set scope="session" var="url" value="/guestroom.jsp?id=${param.id}"/>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/controller">
    <jsp:param name="command" value="view-guestroom-command"/>
    <jsp:param name="id" value="${param.id}"/>
</jsp:include>
<c:import url="menu.jsp"/>
<div id="page-content-wrapper">
    <div style="padding-left: 20px; padding-right: 20px">
        <div>
            <c:forEach var="img" items="${requestScope.guestroom.imgPath}">
                <img height="300px" width="450px" style="margin: 10px" src="${img}"/>
            </c:forEach>
        </div>
        <div class="money" style="color:#cccccc;"> ${nightPrice}
            ${requestScope.guestroom.nightPrice}$
        </div>
        <div><p>${requestScope.guestroom.description}</p></div>
        <div class="whole-properties">
            <div style="color: #cccccc">${properties}</div>
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
                        </c:when><c:otherwise>
                        <img src="${pageContext.request.contextPath}/img/toolbar/cross.svg">
                    </c:otherwise>
                    </c:choose>
                </li>
                <li>${capacity}
                    ${requestScope.guestroom.capacity}
                </li>


            </div>
        </div>
        <div><a href="${pageContext.request.contextPath}/hostel.jsp?id=${requestScope.guestroom.hostelId}">${hotel}</a>
        </div>
        <div style="color: white">${comments}</div>
        <jsp:include page="/controller">
            <jsp:param name="command" value="get-guestroom-comments-command"/>
            <jsp:param name="id" value="${requestScope.guestroom.id}"/>
        </jsp:include>
        <c:forEach var="comment" items="${requestScope.comments}">
            <div class="comment">
                <div class="title">
                    <jsp:include page="/controller">
                        <jsp:param name="command" value="get-user-by-id-command"/>
                        <jsp:param name="id" value="${comment.userId}"/>
                    </jsp:include>
                    <div style="float: left">${requestScope.user.login}&#8195;${comment.commentDate}</div>
                    <c:if test="${sessionScope.user.role=='ADMIN'}">
                        <div style="float: right;">
                            <form action="${pageContext.request.contextPath}/controller" method="post">
                                <input type="hidden" name="command" value="delete-comment-by-id-command">
                                <input type="hidden" name="id" value="${comment.id}">
                                <input type="hidden" name="guestroomId" value="${param.id}">
                                <input type="submit" style="background:url(/img/toolbar/cross.svg);width:25px;
                            height:25px" value="">
                            </form>
                        </div>
                    </c:if>
                </div>
                <div style="color: white" class="text">
                        ${comment.comment}
                </div>
            </div>
        </c:forEach>

        <c:choose>
            <c:when test="${sessionScope.user eq null || empty sessionScope.user}">
                <div style="color: white">${actionsForComment}</div>
            </c:when>
            <c:otherwise>
                <form action="${pageContext.request.contextPath}/controller" method="post">
                    <input type="hidden" name="command" value="add-comment-command">
                    <input type="hidden" name="id" value="${requestScope.guestroom.id}">
                    <div class="form-group row">
                        <div class="col-sm-11">
                            <input class="form-control" type="text" name="comment">
                        </div>
                        <div class="col-sm-1">
                            <input class="form-control" type="submit" value="${save}">
                        </div>
                    </div>
                </form>
            </c:otherwise>
        </c:choose>
    </div>
    <c:import url="footer.jsp"/>
</div>

</body>
</html>
