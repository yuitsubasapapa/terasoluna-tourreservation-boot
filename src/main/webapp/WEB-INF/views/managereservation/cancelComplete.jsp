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
	<h2 id="screenName">
		<spring:message
			code="label.tr.managereservation.aftercancelScreenTitleMessage" />
	</h2>

	<div class="success">
		<spring:message
			code="label.tr.managereservation.aftercancelScreenFlowMessage" />
	</div>

	<br />
	<spring:message
		code="label.tr.managereservation.aftercancelScreenMessage"
		arguments="${f:h(param.reserveNo)}" />
	<br />
	<div class="span-5">

		<table>
			<tr>
				<td><form:form
						action="${f:h(pageContext.request.contextPath)}/managereservation/list"
						method="GET">
						<spring:message
							code="label.tr.managereservation.returnToListScreenBtnMessage"
							var="returnToListScreenButton" />
						<input type="submit" value="${f:h(returnToListScreenButton)}">
					</form:form></td>
				<td><form:form
						action="${f:h(pageContext.request.contextPath)}/" method="GET">
						<spring:message code="label.tr.common.gotoMenuMessage"
							var="gotoMenuButton" />
						<input type="submit" value="${f:h(gotoMenuButton)}">
					</form:form></td>
			</tr>
		</table>
	</div>
	<p>
		<br />
	</p>
	<p>
		<br />
	</p>
</div>

