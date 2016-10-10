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
	<div class="success">
		<p>
			<spring:message code="label.tr.managecustomer.createCompleteMessage"
				arguments="${f:h(customerCode)}" />
		</p>
	</div>
	<form:form action="${pageContext.request.contextPath}/" method="get">
		<input id="goToMenuBtn" type="submit" name="submit"
			value="<spring:message code="label.tr.common.gotoMenuMessage" />">
	</form:form>
</div>
