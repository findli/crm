<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<c:url value="/" var="basePath"></c:url>

<div id="navbar">
    <ul>
        <li><a href="${basePath}" target="_self">Home</a></li>
        <li><a href="${basePath}deal" target="_self">Deals</a></li>
        <li><a href="${basePath}company" target="_self">Company</a></li>
        <li><a href="${basePath}contact" target="_self">Contacts</a></li>
        <li><a href="${basePath}taskList" target="_self">Tasks</a></li>
        <li><a href="${basePath}analytics" target="_self">Analytics</a></li>
        <li><a href="${basePath}settings" target="_self">Settings</a></li>
    </ul>
</div>