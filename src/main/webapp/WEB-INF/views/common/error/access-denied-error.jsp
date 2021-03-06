<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://terasoluna.org/functions" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://terasoluna.org/tags" prefix="t"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx"%>


<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->

<html class="no-js">
<!--<![endif]-->

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width" />

<link rel="stylesheet"
    href="${pageContext.request.contextPath}/resources/vendor/blueprint-1.0/950px/screen.css"
    type="text/css" media="screen, projection">
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/resources/vendor/blueprint-1.0/950px/print.css"
    type="text/css" media="print">
<!--[if lt IE 8]><link rel="stylesheet" href="${pageContext.request.contextPath}/css/blueprint-1.0/950px/ie.css" type="text/css" media="screen, projection"><![endif]-->
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/resources/vendor/blueprint-1.0/plugins/fancy-type/screen.css"
    type="text/css" media="screen, projection">

<link rel="stylesheet"
    href="${pageContext.request.contextPath}/resources/app/css/style.css"
    type="text/css" media="screen, projection">

<script type="text/javascript"
    src="${pageContext.request.contextPath}/resources/vendor/js/jquery-1.7.2.js"></script>

<c:set var="titleKey">
    <tiles:insertAttribute name="title" ignore="true" />
</c:set>
<title><spring:message code="${titleKey}"
        text="Terasoluna Tour Web" /></title>
</head>

<body>
    <div class="container">
        <jsp:include page="../../layout/header.jsp" />
        <div class="error">
            <p>
                <spring:message code="e.tr.fw.0006" />
            </p>
        </div>
        <jsp:include page="../../layout/footer.jsp" />
    </div>
</body>
</html>