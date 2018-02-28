<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <fmt:setLocale value="${sessionScope.local}"/>
    <fmt:setBundle basename="localization.local" var="loc"/>
    <fmt:message bundle="${loc}" key="local.title.login" var="login"/>
    <fmt:message bundle="${loc}" key="local.button.name.en" var="en_button"/>
    <fmt:message bundle="${loc}" key="local.button.name.ru" var="ru_button"/>
    <fmt:message bundle="${loc}" key="local.registration" var="signUp"/>
    <fmt:message bundle="${loc}" key="local.user.name" var="name"/>
    <fmt:message bundle="${loc}" key="local.user.surname" var="surname"/>
    <fmt:message bundle="${loc}" key="local.user.login" var="login"/>
    <fmt:message bundle="${loc}" key="local.user.password" var="password"/>
    <fmt:message bundle="${loc}" key="local.user.email" var="email"/>
    <fmt:message bundle="${loc}" key="local.user.number" var="number"/>
    <fmt:message bundle="${loc}" key="local.message.login.duplicated" var="errorLogin"/>
    <title>${signUp}</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <c:set scope="session" var="url" value="registration.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/menu.css">
</head>
<body>
<c:import url="menu.jsp"/>
<div id="page-content-wrapper">
    <h5 style="
    text-align: center;
    text-transform: uppercase;
    margin-top: 0;
    color: #9eaeee;">registration </h5>
    <form action="${pageContext.request.contextPath}/controller" method="post">
        <table>
            <tr>
                <td>${name}</td>
                <td><input name="name" required pattern="[a-zA-Zа-яА-Я-]*"></td>
            </tr>
            <tr>
                <td>${surname}</td>
                <td><input name="surname" required pattern="[a-zA-Zа-яА-Я-]*"></td>
            </tr>
            <tr>
                <td>${login}</td>
                <td><input name="login" required pattern="[a-zA-Zа-яА-Я0-9-]*"></td>
                <c:if test="${requestScope.error eq 'duplicated'}">
                    <label id="errorLogM" style="color: #f44336">${errorLogin}</label>
                </c:if>
            </tr>
            <tr>
                <td>${password}</td>
                <td><input type="password" style="width: 171px; height: 17px; padding-left: 0px" name="password"
                           required pattern="[a-zA-Zа-яА-Я0-9-]*"></td>
            </tr>
            <tr>
                <td>${email}</td>
                <td><input name="email" required pattern="[a-zA-Z0-9-\.@]*"></td>
            </tr>
            <tr>
                <td>${number}</td>
                <td><input name="number" required pattern="+[0-9-]*"></td>
            </tr>
        </table>
        <br><input type="submit" value="${signUp}"/>
        <%--        <label for="captchaCode" class="prompt">
                    Retype the characters from the picture:</label>

                <%
                    // Adding BotDetect Captcha to the page
                    SimpleCaptcha captcha = SimpleCaptcha.load(request, "exampleCaptcha");

                    String captchaHtml = captcha.getHtml();
                    out.write(captchaHtml);
                %>

                <input id="captchaCode" type="text" name="captchaCode"/>--%>
        <input type="hidden" name="command" value="registration-command">
    </form>
    <c:import url="footer.jsp"/>
</div>
</body>
</html>
