<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<c:url var="basePath" value=""></c:url>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../css/bootstrap.css">

    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <%--  <script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>--%>
    <link rel="stylesheet" href="../css/bootstrap-datetimepicker.min.css"/>
    <link rel="stylesheet" href="../style/reset.css">
    <link rel="stylesheet" href="../style/style.css">
    <title>Add contact</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <header>
                <div class="wrapper">
                    <div class="header__logo">
                        <p>Logo</p>
                    </div>
                    <div class="header__title">
                        <h3>Contact</h3>
                        <div class="header__user">
                            <div class="header__user--photo">
                                <i class="fa fa-user"></i>
                            </div>
                            <p id="user">User</p>
                            <a href="">Log out</a>
                        </div>
                    </div>
                </div>
            </header>
            <%--<tiles:insertAttribute name="header"/>--%>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-3">
            <div id="navbar">
                <ul>
                    <li><a href="/" target="_self">Home</a></li>
                    <li><a href="/deal" target="_self">Deals</a></li>
                    <li><a href="/company" target="_self">Company</a></li>
                    <li><a href="/contact" target="_self">Contacts</a></li>
                    <li><a href="/taskList" target="_self">Tasks</a></li>
                    <li><a href="#" target="_self">Analitics</a></li>
                    <li><a href="/settings" target="_self">Settings</a></li>
                </ul>
            </div>
            <%--<tiles:insertAttribute name="menu"/>--%>
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
