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
	<!-- begin body-->
	<h2 id="screenName">
		<spring:message code="label.tr.searchtour.reserveScreenTitleMessage" />
	</h2>
	<div class="success">
		<spring:message code="label.tr.searchtour.reserveScreenFlowMessage" />
	</div>
	<br />

	<p>
		<spring:message code="label.tr.searchtour.searchtourReservePdfMessage" />
	</p>
	<p>
		<spring:message
			code="label.tr.searchtour.searchtourReserveDetailMessage" />
	</p>
	<form:form method="get"
		action="${pageContext.request.contextPath}/managereservation/downloadPDF">
		<input type="hidden" name="reserveNo"
			value="${f:h(output.getReserve().getReserveNo())}" />
		<input type="submit"
			value="<spring:message code="label.tr.common.downloadpdfBtnMessage"/>" />
	</form:form>

	<jsp:include page="../common/fragment/paymentTable.jsp" />
	<br />
	<hr />
	<jsp:include page="../common/fragment/reserveTable.jsp" />
	<br />
	<!-- representative -->
	<hr />
	<jsp:include page="../common/fragment/customerTable.jsp" />

	<%-- representative end --%>

	<%-- total amount start --%>
	<br />
	<hr />
	<jsp:include page="../common/fragment/priceTable.jsp" />
	<br />
	<hr />
	<table>
		<caption>
			<spring:message code="label.tr.common.specialNotes" />
		</caption>
		<tr>
			<td><spring:message code="label.tr.common.opinionSuggestion" /></td>
			<td>${f:h(output.reserve.remarks)}</td>
		</tr>
	</table>
	<br />
	<div>
		<form:form method="GET"
			action="${pageContext.request.contextPath}/searchtour/search">
			<input type="submit"
				value="<spring:message code="label.tr.searchtour.goTourSearchScreenMessage" />"
				tabindex="1" />
		</form:form>
		<form:form action="${pageContext.request.contextPath}/" method="get">
			<input type="submit" name="submit"
				value="<spring:message code="label.tr.common.gotoMenuMessage" />">
		</form:form>

	</div>
</div>
<!-- end body-->

