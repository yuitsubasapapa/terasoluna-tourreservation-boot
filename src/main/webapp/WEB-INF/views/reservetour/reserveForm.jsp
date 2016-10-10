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
	<h2 id="screenName">
		<spring:message code="label.tr.searchtour.titleDetailScreenMessage" />
	</h2>

	<div class="info">
		<spring:message code="label.tr.searchtour.detailScreenFlowMessage" />
	</div>

	<sec:authorize access="!hasRole('ROLE_USER')">
		<p>
			<spring:message code="label.tr.searchtour.loginToReserveMessage" />
		</p>
	</sec:authorize>
	<sec:authorize access="hasRole('ROLE_USER')">
		<p>
			<spring:message code="label.tr.searchtour.pressReserveBtnMessage" />
		</p>
	</sec:authorize>
	<div class="span-24">
		<t:messagesPanel />
		<form:errors path="*" class="error" />
		<br>
		<jsp:include page="../common/fragment/tourInfoTable.jsp" />
		<br>
		<sec:authorize access="hasRole('ROLE_USER')">
			<br>
			<jsp:include page="../common/fragment/customerTable.jsp" />
		</sec:authorize>
		<br>
		<jsp:include page="../common/fragment/priceTable.jsp" />
	</div>
	<sec:authorize access="hasRole('ROLE_USER')">
		<br>
		<table>
			<tr>
				<td></td>
				<td></td>
			</tr>
			<form:form
				action="${pageContext.request.contextPath}/reservetour/reserve"
				method="POST" modelAttribute="reserveTourForm">
				<table>
					<form:errors path="*" cssClass="error" element="div" />
					<caption>
						<spring:message code="label.tr.common.specialNotes" />
					</caption>
					<tr>
						<td><spring:message code="label.tr.common.opinionSuggestion" /></td>
						<td><form:textarea path="remarks" tabindex="1" /> <br>
							<spring:message
								code="label.tr.searchtour.lessThanEightyCharsMessage" />
							<br> <spring:message
								code="label.tr.searchtour.opinionSuggestionMessage" /></td>
					</tr>
					<form:hidden path="tourCode" />
					<form:hidden path="childCount" />
					<form:hidden path="adultCount" />
				</table>
				<br />
				<input id="confirmBtn" type="submit" name="confirm"
					value="<spring:message code="label.tr.common.confirm" />" />
			</form:form>
			<form:form
				action="${pageContext.request.contextPath}/searchtour/search"
				method="get">
				<input id="backToToursBtn" type="submit"
					value="<spring:message code="label.tr.common.goBackMessage"/>">
				<input type="hidden" name="page"
					value="${f:h(param['page'])}" />
				<input type="hidden" name="size"
					value="${f:h(param['size'])}" />
			</form:form>
		</table>
	</sec:authorize>
	<sec:authorize access="!hasRole('ROLE_USER')">
		<form:form action="${pageContext.request.contextPath}/login"
			method="get" cssClass="inline">
			<input id="loginBtn" type="submit"
				value="<spring:message code="label.tr.menu.loginBtnMessage" />">
			<input type="hidden" name="redirectTo"
				value="${pageContext.request.contextPath}/reservetour/read?${f:query(reserveTourForm)}&page=${f:h(param['page'])}&size=${f:h(param['size'])}" />
		</form:form>
		<form:form
			action="${pageContext.request.contextPath}/searchtour/search"
			method="get" cssClass="inline">
			<input type="hidden" name="page"
					value="${f:h(param['page'])}" />
			<input type="hidden" name="size"
					value="${f:h(param['size'])}" />
			<input id="backToToursBtn" type="submit" value="<spring:message code="label.tr.common.goBackMessage"/>">
		</form:form>
	</sec:authorize>
</div>

