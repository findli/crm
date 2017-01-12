<%--
  Created by IntelliJ IDEA.
  User: Ya
  Date: 1/11/2017
  Time: 3:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>
<head>
    <title><tiles:getAsString name="title"/></title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <tiles:insertAttribute name="header"/>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-3">
            <tiles:insertAttribute name="menu"/>
        </div>
        <div class="col-lg-9">
            <tiles:insertAttribute name="body"/>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <tiles:insertAttribute name="footer"/>
        </div>
    </div>
</div>
</body>
</html>
