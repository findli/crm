<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<c:url var="basePath" value="/"></c:url>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${basePath}/css/bootstrap.css">

    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <link rel="stylesheet" href="${basePath}/css/bootstrap-datetimepicker.min.css"/>
    <link rel="stylesheet" href="${basePath}/style/reset.css">
    <link rel="stylesheet" href="${basePath}/style/style.css">

    <script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="../js/moment-with-locales.min.js"></script>

    <title>${pageTitle}</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <tiles:insertAttribute name="header"/>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-2">
            <tiles:insertAttribute name="menu"/>
        </div>
        <div class="col-lg-10">
            <tiles:insertAttribute name="body"/>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <tiles:insertAttribute name="footer"/>
        </div>
    </div>
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="${basePath}/js/bootstrap.js"></script>
<!-- <script src="https://code.jquery.com/jquery-2.0.0.min.js"></script> -->
</body>
</html>
