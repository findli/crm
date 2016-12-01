<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>


<html>
<head>
    <link rel="stylesheet" href="style/reset.css">
    <link rel="stylesheet" href="style/timeline.css">
    <link rel="stylesheet" href="style/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <link rel="stylesheet" href="style/ion.calendar.css">
    <link rel="stylesheet" href="style/jquery-clockpicker.css">
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
    <title>Company</title>
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
                <li><a href="#" target="_self">Home</a></li>
                <li><a href="#" target="_self">Deals</a></li>
                <li><a href="#" target="_self">Company</a></li>
                <li><a href="#" target="_self">Contacts</a></li>
                <li><a href="#" target="_self">Tasks</a></li>
                <li><a href="#" target="_self">Analitics</a></li>
                <li><a href="#" target="_self">Settings</a></li>
            </ul>
        </div>

        <div class="wrapper__aboutCompany">
            <form action="company">
                <form class="forms">
                    <div class="forms--nCompany">
                        <p>Name Company <input class="text" id='formCompany' title="text" name="formCompany"
                                               value="${company.title}"></p>
                        <p>Tags <input class="text" id='formTag' title="text" name="formTag" placeholder=""></p>
                        <a href="">Responsible</a><br>
                        <select>
                            <option>Work telephone</option>
                            <option>Mobile telephone</option>
                            <option>Home telephone</option>
                        </select>
                        <input class="text" id='formPhone' title="text" name="formPhone"
                               value="${company.phoneNumber}">
                        <p>Email <input class="text" id='formEmail' title="text" name="formEmail"
                                        value="${company.email}"></p>
                        <p>Web <input class="text" id='formWeb' title="text" name="formWeb"
                                      value="${company.website}"></p>
                        <p>Address <input class="text" id='formAddress' title="text" name="formAddress"
                                          value="${company.address.id}"></p>
                        <input class="formAddBut" title="submit" name="formUpdateCompany" value="Update company">
                    </div>
                </form>
            </form>

            <div class="forms--users">
                <div class="wrapper__users">
                    <c:forEach items="${contactList}" var="contactList">
                        <div id="fu${contactList.id}" class="users__panel">
                            <p>${contactList.fName} ${contactList.lName}</p>
                            <a href="#">Edit</a>
                            <a href="#">Undock</a>
                            <input class="users__panel--input" id='cbfu${contactList.id}' title="checkbox">
                        </div>
                        <div class="users__panel--body">
                            <p>Position: ${contactList.position}</p>
                            <p>Email: ${contactList.email}</p>
                            <select>
                                <option>Work telephone</option>
                                <option>Mobile telephone</option>
                                <option>Home telephone</option>
                            </select>
                            <input class="text" id='formPhonefu${contactList.id}' title="text" name="formPhone"
                                   placeholder="Number">
                            <p>Skype: ${contactList.skype}</p>
                        </div>
                    </c:forEach>
                </div>

                <input onclick="location.href='#modalAddContact'" class="formAddBut" title="button"
                       value="Add contact">
            </div>
            <!--Modal window contact-->
            <form action="company">
                <div id="modalAddContact" class="modalDialog">
                    <div>
                        <header>
                            <div class="wrapper__modal1Title">
                                <div><i class="fa fa-user"></i></div>
                                <h3>Add contact</h3>
                            </div>
                        </header>
                        <p style="display: inline">Name <input style="float: none; width: 148px" title="text"
                                                               class="modalInput"
                                                               id="modalContactName" name="modalContactName"></p>
                        <p style="display: inline;">Surname <input style="float: none; width: 147px" title="text"
                                                                   class="modalInput"
                                                                   id="modalContactSurname"
                                                                   name="modalContactSurname"></p>
                        <%--             <select name="companyContact">
                                         <c:forEach items="${contactList}" var="contactList">
                                             <option>${contactList.fName} ${contactList.lName} </option>
                                         </c:forEach>
                                     </select>--%>
                        <p>Position <input title="text" class="modalInput" name="modalContactPosition"
                                           id="modalContactPosition"></p>
                        <p>Phone <i class="fa fa-plus-square"></i>
                            <select>
                                <option>Working</option>
                                <option>Direct working</option>
                                <option>Mobile</option>
                                <option>Fax</option>
                                <option>Home</option>
                                <option>Other</option>
                            </select>
                            <input class="modalInput" id='modalContactPhone' name="formPhone"
                                   placeholder="+38(067)123-45-67">
                        </p>
                        <p>Email <input title="text" class="modalInput" name="modalContactEmail"
                                        id="modalContactEmail"></p>
                        <p>Skype <input title="text" class="modalInput" name="modalContactSkype"
                                        id="modalContactSkype"></p>
                        <input class="modalBut" name="modalButContact" title="submit" value="Save contact">
                        <input class="modalBut cancel" onclick="location.href='#close'" title="button"
                               value="Cancel">
                    </div>
                </div>
            </form>
            <!--End-->
            <div class="form--deals">
                <div class="wrapper__deals">
                    <c:set var="totalDeals" value="0" scope="page"/>
                    <c:set var="amount" value="0" scope="page"/>
                    <c:forEach items="${dealList}" var="dealList">
                        <c:set var="totalDeals" value="${totalDeals+1}" scope="page"/>
                        <c:set var="amount" value="${amount + dealList.budget}" scope="page"/>
                    </c:forEach>
                    <div class="deal__panel">
                        <p>Total deals: ${totalDeals}</p>
                        <p>Amount: ${amount}</p>
                    </div>
                    <c:forEach items="${dealList}" var="dealList">
                        <div class="deal__panel--body">
                            <p>${dealList.title}</p>
                            <p>${dealList.getStage().getTitle()}</p>
                            <p>${dealList.budget}</p>
                            <input class="formDealEditDeal" title="button" value="Edit deal">
                        </div>
                    </c:forEach>
                </div>

                <input onclick="location.href='#modalDeal'" class="formAddBut" title="button"
                       value="Quickly add deal">

                <!--Modal window deal-->
                <form action="company">
                    <div id="modalDeal" class="modalDialog modalDeal">
                        <div>
                            <header>
                                <div class="wrapper__modal1Title">
                                    <div><i class="fa fa-briefcase"></i></div>
                                    <h3>Add deal</h3>
                                </div>
                            </header>
                            <table border="1">
                                <caption>Current deals with main.java.com.becomejavasenior.ServletCompany:</caption>
                                <tr>
                                    <th>deal(s)</th>
                                    <th style="width: 60px">6500</th>
                                    <th style="width: 60px">USD</th>
                                </tr>
                                <c:forEach items="company.getDeals" var="0">
                                    <tr>
                                        <td>${deal.getTitle()}"</td>
                                        <td>${deal.getBudget()}"</td>
                                        <td>USD</td>
                                    </tr>
                                </c:forEach>
                            </table>
                            <span><input class="checkboxDeal" title="checkbox">Add more deals</span>
                            <p>Title: <input title="text" class="modalInput" name="modalDealTitle"
                                             id="modalDealTitle" disabled></p>
                            <p>Stage:
                                <select disabled>
                                    <option>Choose from the list ...</option>
                                    <option>First contact</option>
                                    <option>Conversation</option>
                                    <option>Deciding</option>
                                    <option>Approval of the contract</option>
                                    <option>Successfully implemented</option>
                                    <option>Closed or sold</option>
                                </select>
                            </p>
                            <p>Budget: <input title="text" class="modalInput" name="modalDealBudget"
                                              id="modalDealBudget" disabled></p>
                            <input class="modalBut" title="submit" name="modalButDeal" value="Save contact">
                            <input class="modalBut cancel" onclick="location.href='#close'" title="button"
                                   value="Cancel">
                        </div>
                    </div>
                </form>
                <!--End-->
            </div>


            <div class="form--action">
                <h3>Tasks and Notes</h3>

                <section id="cd-timeline">
                    <c:forEach items="${taskList}" var="taskList">
                        <div class="cd-timeline-block taskBlock">
                            <div class="cd-timeline-content">
                                <div id="task" class="action__task action--task">
                                    <h4>${taskList.title}</h4>
                                    <p>Time of completion: ${taskList.deadlineDate}</p>
                                    <p>Responsible ${taskList.responsibleUser.lName}</p>
                                    <p>Type of task ${taskList.taskType.title}</p>
                                    <textarea rows="3" cols="21" id="formTaskText${taskList.id}"
                                              class="formActionText"
                                              name="text" >${taskList.description}</textarea>
                                    <input class="actionBut" name="formTaskDel" title="submit"
                                           value="Delete">
                                    <input id="formTaskEdit" class="actionBut" title="submit" value="Edit">
                                    <input id="formTaskDone" class="actionBut" title="submit" value="Done">
                                </div>
                                <span class="cd-date">${taskList.deadlineDate}</span>
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
                                    <h4>${noteList.noteText}</h4>
                                    <p>Created: ${noteList.dateCreate}</p>
                                    <p>User name: ${noteList.getCreatedByUserId().getlName()}</p>
                                    <textarea rows="3" cols="21" id="formNoteText" class="formActionText"
                                              name="text"></textarea>
                                    <input id="formNoteDel?idDeal=${noteList.id}" class="actionBut" title="button"
                                           value="Delete">
                                    <input id="formNoteEdit" class="actionBut" title="button" value="Edit">
                                </div>
                                <span class="cd-date">${noteList.dateCreate}</span>
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
                                <p>Name main.java.com.becomejavasenior.ServletCompany:</p>
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
                                    <p>User name: <%--${fileList.getCreationByUser().getlName()}--%></p>
                                    <a>${fileList.fileSize} byte(s)</a>
                                    <input id="formFileDel?idFile=${fileList.id}" class="actionBut" title="button"
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
                    <input onclick="location.href='#modalTask'" class="actionBut" title="button" value="Add task">
                    <input class="actionBut" title="button" value="Add note">
                    <p><input class="checkbox" id="actionButNote" title="checkbox" checked>Note contact</p>
                    <p><input class="checkbox" id="actionButDeal" title="checkbox" checked>Note deal</p>
                </div>

                <!--Modal window task-->
                <form action="company">
                    <div id="modalTask" class="modalDialog modalTask">
                        <div>
                            <header>
                                <div class="wrapper__modal1Title">
                                    <div><i class="fa fa-tasks"></i></div>
                                    <h3>Add task</h3>
                                </div>
                            </header>
                            <input title="hidden" id="hiddenDate" name="hiddenDate">
                            <p>Duration:
                                <select>
                                    <option>Choose from the list</option>
                                    <option>today</option>
                                    <option>tomorrow</option>
                                    <option>next week</option>
                                    <option>next month</option>
                                    <option>next year</option>
                                </select>
                            </p>
                            <div class="myCalendar" id="myCalendar-1"></div>

                            <div class="container">
                                <input class="clockpicker" value="Choose time" id="timeChoose" data-default="20:48">
                            </div>
                            <p>Type:
                                <select>
                                    <option>Choose from the list</option>
                                    <option>Follow-up</option>
                                    <option>meet</option>
                                    <option>other</option>
                                </select>
                            </p>
                            <p>Responsible:
                                <select name="modalTaskResponsible">
                                    <c:forEach items="${contactList}" var="contactList">
                                        <option>${contactList.fName} ${contactList.lName} </option>
                                    </c:forEach>
                                </select>
                            </p>
                            <p>Description:<textarea class="modalTextArea" id="modalTaskDesc" rows="5" cols="42"
                                                     name="text"></textarea>
                            </p>

                            <input class="modalBut" title="submit" name="modalButTask" value="Save contact">
                            <input class="modalBut cancel" onclick="location.href='#close'" title="button"
                                   value="Cancel">

                        </div>
                    </div>
                </form>
                <!--End-->
            </div>

        </div>
    </div>
</div>
</div>
<script src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
<script title="text/javascript" src="js/jquery-clockpicker.js"></script>
</body>
<script title="text/javascript" src="js/script.js"></script>
<script title="text/javascript" src="js/moment2.1.js"></script>
<script title="text/javascript" src="js/ion.calendar.min.js"></script>
</html>
