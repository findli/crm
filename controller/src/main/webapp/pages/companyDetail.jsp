<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>


<html>
<head>
    <link rel="stylesheet" href="../style/reset.css">
    <link rel="stylesheet" href="../style/timeline.css">
    <link rel="stylesheet" href="../style/styleCompany.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <link rel="stylesheet" href="../style/ion.calendar.css">
    <link rel="stylesheet" href="../style/jquery-clockpicker.css">
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
    <title>Detail company</title>
</head>
<body>
<header>
    <div class="wrapper">
        <div class="header__logo">
            <p>Logo</p>
        </div>
        <div class="header__title">
            <h3>Company</h3>
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
                <li><a href="/" target="_self">Home</a></li>
                <li><a href="/deal" target="_self">Deals</a></li>
                <li><a href="/company" target="_self">Company</a></li>
                <li><a href="/contact" target="_self">Contacts</a></li>
                <li><a href="#" target="_self">Tasks</a></li>
                <li><a href="#" target="_self">Analitics</a></li>
                <li><a href="#" target="_self">Settings</a></li>
            </ul>
        </div>

        <div class="wrapper__aboutCompany">
            <form action="company">
                <form class="forms">
                    <div class="forms--nCompany">
                        <p>Name Company <input class="text" id='formCompany' type="text" name="formCompany"
                                               value="${company.title}"></p>
                        <p>Tags <input class="text" id='formTag' type="text" name="formTag" placeholder=""></p>
                        <a href="">Responsible</a><br>
                        <select>
                            <option>Work telephone</option>
                            <option>Mobile telephone</option>
                            <option>Home telephone</option>
                        </select>
                        <input class="text" id='formPhone' type="text" name="formPhone"
                               value="${company.phoneNumber}">
                        <p>Email <input class="text" id='formEmail' type="text" name="formEmail"
                                        value="${company.email}"></p>
                        <p>Web <input class="text" id='formWeb' type="text" name="formWeb"
                                      value="${company.website}"></p>
                        <p>Address <input class="text" id='formAddress' type="text" name="formAddress"
                                          value="${company.address.id}"></p>
                        <input class="formAddBut" type="submit" name="formUpdateCompany" value="Update company">
                    </div>
                </form>
            </form>

            <div class="forms--users">
                <div class="wrapper__users">
                    <c:forEach items="${contactList}" var="contactList">
                        <div id="fu${contactList.getId()}" class="users__panel">
                            <p>${contactList.getfName()} ${contactList.getlName()}</p>
                            <a href="/dealEdit?idContact=${contactList.getId()}">Edit</a>
                            <a href="#">Undock</a>
                            <input class="users__panel--input" id='cbfu${contactList.getId()}' type="checkbox">
                        </div>
                        <div class="users__panel--body">
                            <p>Position: ${contactList.getPosition()}</p>
                            <p>Email: ${contactList.getEmail()}</p>
                            <select>
                                <option>Work telephone</option>
                                <option>Mobile telephone</option>
                                <option>Home telephone</option>
                            </select>
                            <input class="text" id='formPhonefu${contactList.getId()}' type="text" name="formPhone"
                                   placeholder="Number">
                            <p>Skype: ${contactList.getSkype()}</p>
                        </div>
                    </c:forEach>
                </div>

                <input onclick="location.href='#modalAddContact'" class="formAddBut" type="button"
                       value="Add contact">
            </div>
            <div class="form--deals">
                <div class="wrapper__deals">
                    <c:set var="totalDeals" value="0" scope="page"/>
                    <c:set var="amount" value="0" scope="page"/>
                    <c:forEach items="${dealList}" var="dealList">
                        <c:set var="totalDeals" value="${totalDeals+1}" scope="page"/>
                        <c:set var="amount" value="${amount + dealList.getBudget()}" scope="page"/>
                    </c:forEach>
                    <div class="deal__panel">
                        <p>Total deals: ${totalDeals}</p>
                        <p>Amount: ${amount}</p>
                    </div>
                    <c:forEach items="${dealList}" var="dealList">
                        <div class="deal__panel--body">
                            <p>${dealList.getTitle()}</p>
                            <p>${dealList.getStage().getTitle()}</p>
                            <p>${dealList.getBudget()}</p>
                            <input onClick='location.href="/dealEdit?idDeal=${dealList.getId()}"'
                                   class="formDealEditDeal" type="button" value="Edit deal">
                        </div>
                    </c:forEach>
                </div>

                <input onClick='location.href="/pages/deal_add.jsp"' class="formAddBut" type="button"
                       value="Quickly add deal">
            </div>


            <div class="form--action">
                <h3>Tasks and Notes</h3>

                <section id="cd-timeline">
                    <c:forEach items="${taskList}" var="taskList">
                        <div class="cd-timeline-block taskBlock">
                            <div class="cd-timeline-content">
                                <div id="task" class="action__task action--task">
                                    <h4>${taskList.getTitle()}</h4>
                                    <p>Time of completion: ${taskList.getDeadLine()}</p>
                                    <p>Responsible ${taskList.getResponsibleUserId().getlName()}</p>
                                    <p>Type of task ${taskList.getTaskTypeId().getType()}</p>
                                    <textarea rows="3" cols="21" id="formTaskText${taskList.getId()}"
                                              class="formActionText"
                                              name="text" disabled>${taskList.getDescription()}</textarea>
                                    <input class="actionBut" id="formTaskDel=${taskList.getId()}"
                                           type="button"
                                           value="Delete">
                                    <input id="formTaskEdit"
                                           onClick='location.href="/dealEdit?idTask=${taskList.getId()}"'
                                           class="actionBut" type="button" value="Edit">
                                    <input id="formTaskDone" class="actionBut" type="submit" value="Done">
                                </div>
                                <span class="cd-date">${taskList.getDeadLine()}</span>
                            </div> <!-- cd-timeline-content -->
                        </div>
                        <!-- cd-timeline-block -->
                        <div class="cd-timeline-block">
                            <!-- ... -->
                        </div>
                    </c:forEach>


                    <c:forEach items="${noteList}" var="noteList">
                        <div class="cd-timeline-block noteBlock">
                            <div class="cd-timeline-content">
                                <div id="note" class="action__task action--note">
                                    <h4>${noteList.getNoteText()}</h4>
                                    <p>Created: ${noteList.getDateCreate()}</p>
                                    <p>User name: ${noteList.getCreatedUser().getlName()}</p>
                                        <%--           <textarea rows="3" cols="21" id="formNoteText" class="formActionText"
                                                             name="text" disabled></textarea>--%>
                                    <input id="formNoteDel=${noteList.getId()}" class="actionBut" type="button"
                                           value="Delete">
                                    <input id="formNoteEdit"
                                           onClick='location.href="/dealEdit?idNote=${noteList.getId()}"'
                                           class="actionBut" type="button" value="Edit">
                                </div>
                                <span class="cd-date">${noteList.getDateCreate()}</span>
                            </div> <!-- cd-timeline-content -->
                        </div>
                        <!-- cd-timeline-block -->
                        <div class="cd-timeline-block">
                            <!-- ... -->
                        </div>
                    </c:forEach>


                    <div class="cd-timeline-block">
                        <div class="cd-timeline-content">
                            <div id="action" class="action__task">
                                <h4>Action</h4>
                                <p>Activiity;</p>
                                <p>User name:</p>
                                <p>Name:</p>
                                <p>Name entity:</p>
                            </div>
                            <span class="cd-date"></span>
                        </div> <!-- cd-timeline-content -->
                    </div> <!-- cd-timeline-block-->

                    <div class="cd-timeline-block">
                        <!-- ... -->
                    </div>
                    <c:forEach items="${fileList}" var="fileList">
                        <div class="cd-timeline-block">
                            <div class="cd-timeline-content">
                                <div id="file" class="action__task">
                                    <h4>File</h4>
                                    <p>Created: ${fileList.dateCreate}</p>
                                    <p>User name:<%-- ${fileList.getCreationByUser().getlName()}--%>></p>
                                    <a>${fileList.fileSize} byte(s)</a>
                                    <input id="formFileDel=${fileList.id}" class="actionBut" type="button"
                                           value="Delete">
                                </div>
                                <span class="cd-date">${fileList.dateCreate}</span>
                            </div> <!-- cd-timeline-content -->
                        </div>
                        <!-- cd-timeline-block -->
                        <div class="cd-timeline-block">
                            <!-- ... -->
                        </div>
                    </c:forEach>
                </section>


                <div class="wrapper__actionBut">
                    <input onClick='location.href="/pages/deal_add.jsp"' class="actionBut" type="button"
                           value="Add task">
                    <input class="actionBut" type="button" value="Add note">
                    <p><input class="checkbox" id="actionButNote" type="checkbox" checked>Note contact</p>
                    <p><input class="checkbox" id="actionButDeal" type="checkbox" checked>Note deal</p>
                </div>
            </div>

        </div>
    </div>
</div>
</div>
<script src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
<script type="text/javascript" src="../js/jquery-clockpicker.js"></script>
</body>
<script type="text/javascript" src="../js/scriptCompany.js"></script>
<script type="text/javascript" src="../js/moment2.1.js"></script>
<script type="text/javascript" src="../js/ion.calendar.min.js"></script>
</html>
