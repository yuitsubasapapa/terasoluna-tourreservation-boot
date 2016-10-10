<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<sec:authorize access="!hasRole('ROLE_USER')">
    <p id="messagesArea" class="box">
        <spring:message code="label.tr.common.notLoginMessage" />
    </p>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_USER')">
    <form:form action="${pageContext.request.contextPath}/logout" method="POST"
        cssClass="inline">
        <input id="logoutBtn" type="submit" name="logout"
            value="<spring:message code="label.tr.common.logout"/>">
    </form:form>
</sec:authorize>