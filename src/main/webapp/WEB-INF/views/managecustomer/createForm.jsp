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
	<form:form method="post" modelAttribute="customerForm"
		action="${pageContext.request.contextPath}/managecustomer/create">
		<fieldset>
			<legend>
				<spring:message code="label.tr.managecustomer.managecustomerMessage" />
			</legend>
			<div class="info">
				<p>
					<spring:message code="label.tr.managecustomer.createFormMessage" />
				</p>
			</div>
			<form:errors path="*" cssClass="error" element="div" />
			<p>
				<%-- Kana --%>
				<form:label path="customerKana">
					<spring:message code="label.tr.common.kana" />(<spring:message
						code="label.tr.common.required" />)</form:label>
				<br>
				<form:input type="text" cssClass="text" path="customerKana" />
				&nbsp;(
				<spring:message code="label.tr.managecustomer.fullKanaOnlyMessage" />
				)
			</p>
			<p>
				<%-- Name --%>
				<form:label path="customerName">
					<spring:message code="label.tr.common.name" />(<spring:message
						code="label.tr.common.required" />)</form:label>
				<br>
				<form:input type="text" cssClass="text" path="customerName" />
				&nbsp;(
				<spring:message code="label.tr.managecustomer.fullOnlyMessage" />
				)
			</p>
			<p>
				<%-- BirthDay --%>
				<form:label path="customerBirthYear">
					<spring:message code="label.tr.common.birthday" />(<spring:message
						code="label.tr.common.required" />)</form:label>
				<br>
				<form:select path="customerBirthYear" items="${CL_BIRTH_YEAR}" />
				<spring:message code="label.tr.common.year" />
				<form:select path="customerBirthMonth" items="${CL_MONTH}" />
				<spring:message code="label.tr.common.month" />
				<form:select path="customerBirthDay" items="${CL_DAY}" />
				<spring:message code="label.tr.common.day" />
			</p>
			<p>
				<%-- Job --%>
				<form:label path="customerJob">
					<spring:message code="label.tr.common.job" />(<spring:message
						code="label.tr.common.required" />)</form:label>
				<br>
				<form:input path="customerJob" cssClass="text" />
			</p>
			<p>
				<%-- EMail --%>
				<form:label path="customerMail">
					<spring:message code="label.tr.common.email" />
				</form:label>
				<br>
				<form:input path="customerMail" cssClass="text" />
			</p>
			<p>
				<%-- Tel --%>
				<form:label path="customerTel">
					<spring:message code="label.tr.common.tel" />(<spring:message
						code="label.tr.common.required" />)</form:label>
				<br>
				<form:input path="customerTel" cssClass="text" />
				&nbsp;(
				<spring:message code="label.tr.managecustomer.halfTelOnlyMessage" />
				)&nbsp;
				<spring:message code="label.tr.managecustomer.telExampleMessage" />
			</p>
			<p>
				<%-- Zipcode --%>
				<form:label path="customerPost">
					<spring:message code="label.tr.common.zip" />(<spring:message
						code="label.tr.common.required" />)</form:label>
				<br>
				<form:input path="customerPost" cssClass="text" />
				&nbsp;(
				<spring:message
					code="label.tr.managecustomer.halfPasswordOnlyMessage" />
				)&nbsp;
				<spring:message code="label.tr.managecustomer.zipExampleMessage" />
			</p>
			<p>
				<%-- Address --%>
				<form:label path="customerAdd">
					<spring:message code="label.tr.common.address" />(<spring:message
						code="label.tr.common.required" />)</form:label>
				<br>
				<form:input path="customerAdd" cssClass="text" />
			</p>
			<p>
				<%-- Password --%>
				<form:label path="customerPass">
					<spring:message code="label.tr.common.password" />(<spring:message
						code="label.tr.common.required" />)</form:label>
				<br>
				<form:password path="customerPass" cssClass="text" />
				&nbsp;(
				<spring:message
					code="label.tr.managecustomer.halfPasswordOnlyMessage" />
				)
			</p>
			<p>
				<%-- Password Confirm --%>
				<form:label path="customerPassConfirm">
					<spring:message code="label.tr.common.passwordConfirm" />(<spring:message
						code="label.tr.common.required" />)</form:label>
				<br>
				<form:password path="customerPassConfirm" cssClass="text" />
			</p>
			<p>
				<input id="confirmBtn" type="submit" name="confirm"
					value="<spring:message code="label.tr.common.confirm" />">
				<input id="resetBtn" type="reset"
					value="<spring:message code="label.tr.common.reset" />">
			</p>
		</fieldset>
	</form:form>
</div>
