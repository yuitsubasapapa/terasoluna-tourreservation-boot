<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<div class="container">
	<p id="messagesArea" class="box">
		<sec:authorize access="!hasRole('ROLE_USER')">
			<spring:message code="label.tr.common.notLoginMessage" />
		</sec:authorize>
		<spring:message code="label.tr.menu.menuMessage" />
	</p>
	<div class="span-24 last">
		<form action="${pageContext.request.contextPath}/searchtour/search"
			method="get">
			<fieldset class="notice">
				<div class="span-5">
					<input id="searchTourBtn" style="width: 150px;" type="submit"
						value="<spring:message code="label.tr.menu.searchBtnMessage" />">
				</div>
				<div class="span-18 last">
					<p>
						<spring:message code="label.tr.menu.tourSearchMessage" />
					</p>
				</div>
				<input type="hidden" name="form" />
			</fieldset>
		</form>
		<sec:authorize access="!hasRole('ROLE_USER')">
			<form action="${pageContext.request.contextPath}/login" method="get">
				<fieldset class="notice">
					<div class="span-5">
						<input id="loginBtn" style="width: 150px;" type="submit"
							value="<spring:message code="label.tr.menu.loginBtnMessage" />">
					</div>
					<div class="span-18 last">
						<p>
							<spring:message code="label.tr.menu.loginMessage" />
						</p>
					</div>
				</fieldset>
			</form>

			<form
				action="${pageContext.request.contextPath}/managecustomer/create"
				method="get">
				<fieldset class="notice">
					<div class="span-5">
						<input id="customerRegisterBtn" style="width: 150px;" type="submit"
							value="<spring:message code="label.tr.menu.customerRegisterBtnMessage" />">
					</div>
					<div class="span-18 last">
						<p>
							<spring:message code="label.tr.menu.customerRegisterMessage" />
						</p>
					</div>
					<input type="hidden" name="form" />
				</fieldset>
			</form>
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_USER')">
			<form
				action="${pageContext.request.contextPath}/managereservation/list"
				method="get">
				<fieldset class="notice">
					<div class="span-5">
						<input id="reservedToursReferBtn" style="width: 150px;" type="submit"
							value="<spring:message code="label.tr.menu.referBtnMessage" />">
					</div>
					<div class="span-18 last">
						<p>
							<spring:message code="label.tr.menu.referMessage" />
						</p>
					</div>
					<input type="hidden" name="form" />
				</fieldset>
			</form>
		</sec:authorize>
	</div>
</div>
