<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://terasoluna.org/functions" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://terasoluna.org/tags" prefix="t"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx"%>

  <div class="container">
   <jsp:include page="../common/top.jsp" />
    <form:form action="${pageContext.request.contextPath}/j_spring_security_check" method="post">
      <fieldset>
        <legend>
          <spring:message code="label.tr.login.loginFormMessage" />
        </legend>

        <c:if test="${param.error == true}">
          <t:messagesPanel messagesAttributeName="SPRING_SECURITY_LAST_EXCEPTION"/>
        </c:if>

        <p>
          <label for="username"><spring:message
              code="label.tr.common.userId" /></label><br> <input type="text"
            class="text" id="username" name="j_username">
        </p>
        <p>
          <label for="password"><spring:message
              code="label.tr.common.password" /></label><br> <input type="password"
            class="text" id="password" name="j_password">
        </p>
        <p>
          <input id="loginBtn" type="submit"
            value="<spring:message code="label.tr.common.login" />">
          <input id="resetBtn" type="reset" value="<spring:message code="label.tr.common.reset" />">
          <input type="hidden" name="redirectTo" value="${f:h(param.redirectTo)}" />
        </p>
      </fieldset>
    </form:form>
    <hr>
    <p>
      <spring:message code="label.tr.login.notCustmerMessage" />
    </p>
    <form action="${pageContext.request.contextPath}/managecustomer/create" method="get">
      <input id="customerRegisterBtn" type="submit" name="form"
        value="<spring:message code="label.tr.common.register" />">
    </form>   
  </div>


