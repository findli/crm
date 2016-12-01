<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../css/bootstrap.css">
    <%--<link rel="stylesheet" href="../style/style.css">--%>
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <%--<script title="text/javascript" src="../js/jquery-1.11.1.min.js"></script>--%>
    <!-- <script title="text/javascript" src="js/bootstrap.file-input.js"></script> -->

    <%--<link rel="stylesheet" href="../css/bootstrap-datetimepicker.min.css" />--%>
    <link rel="stylesheet" href="../style/reset.css">
    <link rel="stylesheet" href="../style/style.css">

    <title>Edit contact</title>
</head>
<body>
<header>
    <div class="wrapper">
        <div class="header__logo">
            <p>Logo</p>
        </div>
        <div class="header__title">
            <h3>Edit contact</h3>
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
<div class="aboutCompany">
    <div class="wrapper">
        <div id="navbar">
            <ul>
                <li><a href="/home" target="_self">Home</a></li>
                <li><a href="/deal" target="_self">Deals</a></li>
                <li><a href="/company" target="_self">Company</a></li>
                <li><a href="/contact" target="_self">Contacts</a></li>
                <li><a href="#" target="_self">Tasks</a></li>
                <li><a href="#" target="_self">Analitics</a></li>
                <li><a href="#" target="_self">Settings</a></li>
            </ul>
        </div>

        <div class="wrapper__aboutCompany">
            <div class="forms">
                <form class="form-horizontal" role="form" method="post" action="/contactAdd" id="contactForm"
                      enctype="multipart/form-data">

                    <!--Add contact-->
                    <div class="forms--eContact">
                        <h2>Edit contact</h2><br>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">Name </label>
                            <div class="col-sm-9">
                                <input class="form-control" title="text" placeholder="Name" id="contactName" name="contactName">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">Tag </label>
                            <div class="col-sm-9">
                                <input class="form-control" title="text" placeholder="Tag" id="contactTag" name="contactTag">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">Responsible </label>
                            <select class="col-sm-9 form-control" id="responsibleUser" name="responsibleUser">
                                <c:forEach var="user" items="${users}">
                                    <option><c:out value="${user.lName}"/></option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">Position </label>
                            <div class="col-sm-9">
                                <input class="form-control" title="text" placeholder="Position" id="contactPosition" name="contactPosition">
                            </div>
                        </div>

                        <div class="form-group">
                            <select class="col-sm-4 form-control" style="width: 100px">
                                <option>Work</option>
                                <option>Mobile</option>
                                <option>Home</option>
                            </select>
                            <div class="col-sm-8">
                                <input class="form-control" title="text" name="formPhone"
                                       placeholder="Number">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">Email </label>
                            <div class="col-sm-9">
                                <input class="form-control" title="text" placeholder="Email" id="email" name="email">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">Skype </label>
                            <div class="col-sm-9">
                                <input class="form-control" title="text" placeholder="Skype" id="skype" name="skype">
                            </div>
                        </div>


                        <div class="form-group">
                            <div class="col-sm-5">
                                <button title="button" class="btn btn-success">Применить</button>
                            </div>
                        </div>

                    </div>

                    <!--Add company-->
                    <div class="forms--eContact">
                        <h2>Edit company</h2><br>
                        <!-- <div role="tabpanel" class="tab-pane active" id="contact1"> -->
                        <!-- Навигация -->
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="active"><a href="#old" aria-controls="old" role="tab" data-toggle="tab">Old company</a></li>
                            <li><a href="#new" aria-controls="new" role="tab" data-toggle="tab">New company</a></li>
                        </ul>

                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active" id="old">
                                <select class="col-sm-3 form-control">
                                    <option>Company 1</option>
                                    <option>Company 2</option>
                                    <option>Company 3</option>
                                    <option>Company 4</option>
                                    <option>Company 5</option>
                                    <option>Company 5</option>
                                </select>

                            </div>
                            <div role="tabpanel" class="tab-pane" id="new">
                                <br>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Name </label>
                                    <div class="col-sm-9">
                                        <input class="form-control" title="text" placeholder="Name company">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <select class="col-sm-4 form-control" style="width: 100px">
                                        <option>Work</option>
                                        <option>Mobile</option>
                                        <option>Home</option>
                                    </select>
                                    <div class="col-sm-8">
                                        <input class="form-control" title="text" name="formPhone" placeholder="Number">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Email </label>
                                    <div class="col-sm-9">
                                        <input class="form-control" title="text" placeholder="Email">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Web </label>
                                    <div class="col-sm-9">
                                        <input class="form-control" title="text" placeholder="Url">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Address </label>
                                    <div class="col-sm-9">
                                        <textarea class="form-control" placeholder="Address" name="editDealCompanyAddress"></textarea>
                                    </div>
                                </div>

                                <div class="col-sm-10">
                                    <button title="button" class="btn btn-success">Применить</button>
                                    <button title="button" class="btn btn-danger">Отмена</button>
                                </div>

                            </div>
                        </div>



                    </div>
                    <!--End-->

                    <!--Edit deals-->
                    <div class="forms--eContact">
                        <h2>Edit deals</h2><br>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">Name </label>
                            <div class="col-sm-9">
                                <input class="form-control" title="text" placeholder="Name" id="editDealCompanyName" name="editDealCompanyName">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">Phone </label>
                            <div class="col-sm-9">
                                <input class="form-control" title="text" placeholder="Tag" id="editDealCompanyPhone" name="editDealCompanyPhone">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">email </label>
                            <div class="col-sm-9">
                                <input class="form-control" title="text" placeholder="Tag" id="editDealCompanyEmail" name="editDealCompanyEmail">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">Web </label>
                            <div class="col-sm-9">
                                <input class="form-control" title="text" placeholder="Tag" id="editDealCompanyWeb" name="editDealCompanyWeb">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">Address </label>
                            <div class="col-sm-9">
                                <textarea class="form-control" placeholder="Address" id="editDealCompanyAddress" name="editDealCompanyAddress"></textarea>
                            </div>
                        </div>

                    </div>

                    <!--Add task-->
                    <div class="forms--eContact">
                        <h2>Edit task</h2><br>

                        <!-- Навигация -->
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="active"><a href="#task" aria-controls="task" role="tab" data-toggle="tab">Task</a></li>
                            <li><a href="#comment" aria-controls="comment" role="tab" data-toggle="tab">Comment</a></li>
                            <li><a href="#action" aria-controls="action" role="tab" data-toggle="tab">Action</a></li>
                            <li><a href="#file" aria-controls="file" role="tab" data-toggle="tab">File</a></li>
                        </ul>

                        <!-- Содержимое вкладок -->
                        <div class="tab-content">
                            <br>
                            <div role="tabpanel" class="tab-pane active" id="task">
                                Task

                            </div>

                            <div role="tabpanel" class="tab-pane" id="comment">
                                Comment
                            </div>

                            <div role="tabpanel" class="tab-pane" id="action">
                                Action
                            </div>

                            <div role="tabpanel" class="tab-pane" id="file">
                                File
                            </div>

                        </div>

                    </div>

                </form>

            </div>
        </div>
    </div>
</div>
<%--<script title="text/javascript">--%>
    <%--$(function () {--%>
        <%--$('#datetimepicker').datetimepicker({language: 'ru',minuteStepping:10,daysOfWeekDisabled:[0,6]});--%>
    <%--});--%>
<%--</script>--%>
</body>
<script src="https://code.jquery.com/jquery-2.0.0.min.js"></script>
<script title="text/javascript" src="../js/moment-with-locales.min.js"></script>
<script title="text/javascript" src="../js/bootstrap.min.js"></script>
<script title="text/javascript" src="../js/bootstrap-datetimepicker.min.js"></script>
<script title="text/javascript" src="../js/script.js"></script>
</html>