<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:setLocale value="${sessionScope.local}"/>
<fmt:setBundle basename="localization.local" var="loc"/>
<fmt:message bundle="${loc}" key="local.title.login" var="login"/>
<fmt:message bundle="${loc}" key="local.password" var="password"/>
<fmt:message bundle="${loc}" key="local.user.cancel" var="cancel"/>
<fmt:message bundle="${loc}" key="local.forget" var="forget"/>
<fmt:message bundle="${loc}" key="local.not.valid.password.login" var="errorLoginMessage"/>
<fmt:message bundle="${loc}" key="local.user.login.noun" var="lognoun"/>
<fmt:message bundle="${loc}" key="local.title.hotel" var="hotel"/>
<fmt:message bundle="${loc}" key="local.home.page" var="home"/>
<fmt:message bundle="${loc}" key="local.menu.search" var="search"/>
<fmt:message bundle="${loc}" key="local.account" var="account"/>
<fmt:message bundle="${loc}" key="local.menu.questions" var="faq"/>
<fmt:message bundle="${loc}" key="local.menu.or" var="menuor"/>
<fmt:message bundle="${loc}" key="local.menu.sign.up" var="signup"/>


<nav class="navbar navbar-inverse navbar-fixed-top" id="sidebar-wrapper" role="navigation">
    <ul class="nav sidebar-nav">
        <li class="sidebar-brand">
            <a href="${pageContext.request.contextPath}/index.jsp">
                ${hotel}
            </a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/search.jsp"><i class="fa fa-fw fa-search"></i> ${search}</a>
        </li>
        <li>
            <div style="padding-left: 30px">
                <form action="${pageContext.request.contextPath}/controller" method="post"
                      style="display: inline-block; margin: auto">
                    <input type="hidden" name="command" value="change-local-command">
                    <input type="hidden" name="local" value="en"/>
                    <input type="image" style="width: 30px;height: 30px"
                           src="${pageContext.request.contextPath}/img/toolbar/en.png"/>
                </form>
                <form action="${pageContext.request.contextPath}/controller" method="post"
                      style="display: inline-block; margin: auto">
                    <input type="hidden" name="command" value="change-local-command">
                    <input type="hidden" name="local" value="ru"/>
                    <input type="image" style="width: 30px;height: 30px"
                           src="${pageContext.request.contextPath}/img/toolbar/ru.png"/>
                </form>
            </div>
        </li>
        <li>
            <a href="#"><i class="fa fa-fw fa-question-circle"></i> ${faq}</a>
        </li>
        <li>
            <c:choose>
                <c:when test="${sessionScope.user eq null}">
                    <a href="#" onclick="document.getElementById('id01').style.display='block'"><i
                            class="fa fa-fw fa-user-circle-o"></i> ${account}</a>
                </c:when>
                <c:when test="${sessionScope.user.role =='ADMIN'}">

                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/user/account"><i
                            class="fa fa-fw fa-user-circle-o"></i> ${account}</a>
                </c:otherwise>
            </c:choose>
            <c:choose>
                <c:when test="${errorParam eq true}">
                    ${'<div id="id01" class="modal" style="z-index: 999999; display: block">'}
                </c:when>
                <c:otherwise>
                    ${'<div id="id01" class="modal" style="z-index: 999999;">'}
                </c:otherwise>
            </c:choose>
            <span onclick=" document.getElementById('id01').style.display='none'" class="close"
                  title="Close Modal">&times;</span>
            <form class="modal-content animate"
                  action="${pageContext.request.contextPath}/controller"
                  method="post">
                <input type="hidden" name="command" value="login-command"/>
                <div class="container">
                    <c:if test="${errorParam eq true}">
                        <label id="errorLogM" style="color: #f44336"><b>${errorLoginMessage}</b></label>
                        <br>
                    </c:if>
                    <label><b>${lognoun}</b></label>
                    <input type="text" placeholder="Enter Username" name="login" required>

                    <label><b>${password}</b></label>
                    <input type="password" placeholder="Enter Password" name="password" required>
                    <button type="submit">${login}</button>
                </div>
                <div class="container" style="background-color:#f1f1f1">
                    <button type="button"
                            onclick="document.getElementById('id01').style.display='none'"
                            class="cancelbtn">
                        ${cancel}
                    </button>
                    <div class="psw" style="float: right">
                        <a href="${pageContext.request.contextPath}/registration.jsp"
                           style="padding: 0;    display: unset; color: red;font-weight:bold">${signup}</a></div>
                    <br>
                    <div class="psw" style="float: right">${forget}
                        <a href="#"
                           style="padding: 0;    display: unset; color: red; font-weight:bold">${password}?</a>
                    </div>
                </div>
            </form>
            ${'</div>'}
        </li>
    </ul>
</nav>
<script>
    // Get the modal
    var modal = document.getElementById('id01');

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    };

    $(document).ready(function () {
        $('input[name=login]').click(function () {
            $('#errorLogM').fadeOut();
        });

        $('input[name=password]').click(function () {
            $('#errorLogM').fadeOut();
        })
    });
</script>