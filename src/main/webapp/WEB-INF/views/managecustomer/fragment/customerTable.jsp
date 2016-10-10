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

<table id="customerTable">
    <caption>
        <spring:message code="label.tr.common.notLoginMessage" />
    </caption>
    <tr>
        <td><spring:message code="label.tr.common.kana" /></td>
        <td>${f:h(customerForm.customerKana)}</td>
    </tr>
    <tr>
        <td><spring:message code="label.tr.common.name" /></td>
        <td>${f:h(customerForm.customerName)}</td>
    </tr>
    <tr>
        <td><spring:message code="label.tr.common.birthday" /></td>
        <td>${f:h(customerForm.customerBirthYear)}<spring:message
                code="label.tr.common.year" />
            ${f:h(customerForm.customerBirthMonth)}<spring:message
                code="label.tr.common.month" />
            ${f:h(customerForm.customerBirthDay)}<spring:message
                code="label.tr.common.day" /></td>
    </tr>
    <tr>
        <td><spring:message code="label.tr.common.job" /></td>
        <td>${f:h(customerForm.customerJob)}</td>
    </tr>
    <tr>
        <td><spring:message code="label.tr.common.email" /></td>
        <td>${f:h(customerForm.customerMail)}</td>
    </tr>
    <tr>
        <td><spring:message code="label.tr.common.tel" /></td>
        <td>${f:h(customerForm.customerTel)}</td>
    </tr>
    <tr>
        <td><spring:message code="label.tr.common.zip" /></td>
        <td>${f:h(customerForm.customerPost)}</td>
    </tr>
    <tr>
        <td><spring:message code="label.tr.common.address" /></td>
        <td>${f:h(customerForm.customerAdd)}</td>
    </tr>
    <tr>
        <td><spring:message code="label.tr.common.password" /></td>
        <td>********</td>
    </tr>
</table>