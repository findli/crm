<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  $END$
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
        <div class="forms">
          <div class="forms--nCompany">
            <p>Name Company <input class="text" id='formCompany' title="text" name="formCompany"
                                   placeholder="Name Company"></p>
            <p>Tags <input class="text" id='formTag' title="text" name="formTag" placeholder="Tag"></p>
            <a href="">Responsible</a><br>
            <select>
              <option>Work telephone</option>
              <option>Mobile telephone</option>
              <option>Home telephone</option>
            </select>
            <input class="text" id='formPhone' title="text" name="formPhone" placeholder="Number">
            <p>Email <input class="text" id='formEmail' title="text" name="formEmail" placeholder="Email"></p>
            <p>Web <input class="text" id='formWeb' title="text" name="formWeb" placeholder="Url"></p>
            <p>Address <input class="text" id='formAddress' title="text" name="formAddress"
                              placeholder="Address"></p>
          </div>

          <div class="forms--users">
            <div class="wrapper__users">
              <div id="fu1" class="users__panel">
                <p>User 1</p>
                <a href="#">Edit</a>
                <a href="#">Undock</a>
                <input class="users__panel--input" id='cbfu1' title="checkbox">
              </div>
              <div class="users__panel--body">
                <p>Position</p>
                <p>Email</p>
                <select>
                  <option>Work telephone</option>
                  <option>Mobile telephone</option>
                  <option>Home telephone</option>
                </select>
                <input class="text" id='formPhonefu1' title="text" name="formPhone" placeholder="Number">
                <p>Skype</p>
              </div>

              <!--Example-->
              <div id="fu2" class="users__panel">
                <p>User 2</p>
                <a href="#" class="users__panel--edit">Edit</a>
                <a href="#">Undock</a>
                <input class="users__panel--input" id='cbfu2' title="checkbox">
              </div>
              <div class="users__panel--body">
                <p>Position</p>
                <p>Email</p>
                <select>
                  <option>Work telephone</option>
                  <option>Mobile telephone</option>
                  <option>Home telephone</option>
                </select>
                <input class="text" id='formPhonefu2' title="text" name="formPhone" placeholder="Number">
                <p>Skype</p>
              </div>


              <div id="fu3" class="users__panel">
                <p>User 2</p>
                <a href="#" class="users__panel--edit">Edit</a>
                <a href="#">Undock</a>
                <input class="users__panel--input" id='cbfu3' title="checkbox">
              </div>
              <div class="users__panel--body">
                <p>Position</p>
                <p>Email</p>
                <select>
                  <option>Work telephone</option>
                  <option>Mobile telephone</option>
                  <option>Home telephone</option>
                </select>
                <input class="text" id='formPhonefu3' title="text" name="formPhone" placeholder="Number">
                <p>Skype</p>
              </div>
              <div id="fu4" class="users__panel">
                <p>User 2</p>
                <a href="#" class="users__panel--edit">Edit</a>
                <a href="#">Undock</a>
                <input class="users__panel--input" id='cbfu4' title="checkbox">
              </div>
              <div class="users__panel--body">
                <p>Position</p>
                <p>Email</p>
                <select>
                  <option>Work telephone</option>
                  <option>Mobile telephone</option>
                  <option>Home telephone</option>
                </select>
                <input class="text" id='formPhonefu4' title="text" name="formPhone" placeholder="Number">
                <p>Skype</p>
              </div>
              <div id="fu5" class="users__panel">
                <p>User 2</p>
                <a href="#" class="users__panel--edit">Edit</a>
                <a href="#">Undock</a>
                <input class="users__panel--input" id='cbfu5' title="checkbox">
              </div>
              <div class="users__panel--body">
                <p>Position</p>
                <p>Email</p>
                <select>
                  <option>Work telephone</option>
                  <option>Mobile telephone</option>
                  <option>Home telephone</option>
                </select>
                <input class="text" id='formPhonefu5' title="text" name="formPhone" placeholder="Number">
                <p>Skype</p>
              </div>
              <!--END-->
            </div>


            <input onclick="location.href='#modalAddContact'" class="formAddBut" title="button"
                   value="Add contact">
          </div>
          <!--Modal window contact-->
          <div id="modalAddContact" class="modalDialog">
            <div>
              <header>
                <div class="wrapper__modal1Title">
                  <div><i class="fa fa-user"></i></div>
                  <h3>Add contact company</h3>
                </div>
              </header>

              <p style="display: inline">Name <input style="float: none; width: 148px" title="text"
                                                     class="modalInput"
                                                     id="modalContactName"></p>
              <p style="display: inline;">Surname <input style="float: none; width: 147px" title="text"
                                                         class="modalInput"
                                                         id="modalContactSurname"></p>
              <p>Position <input title="text" class="modalInput" id="modalContactPosition"></p>
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
              <p>Email <input title="text" class="modalInput" id="modalContactEmail"></p>
              <p>Skype <input title="text" class="modalInput" id="modalContactSkype"></p>
              <input class="modalBut" title="button" value="Save contact">
              <input class="modalBut cancel" onclick="location.href='#close'" title="button"
                     value="Cancel">
            </div>
          </div>
          <!--End-->
          <div class="form--deals">
            <div class="wrapper__deals">
              <div class="deal__panel">
                <p>Total deals: </p>
                <p>Amount: </p>
              </div>
              <div class="deal__panel--body">
                <p>Name deal</p>
                <p>Stage deal</p>
                <p>100 USD</p>
                <input class="formDealEditDeal" title="button" value="Edit deal">
              </div>

              <!--Для примера -->
              <div class="deal__panel--body">
                <p>Name deal</p>
                <p>Stage deal</p>
                <p>100 USD</p>
                <input class="formDealEditDeal" title="button" value="Edit deal">
              </div>
              <div class="deal__panel--body">
                <p>Name deal</p>
                <p>Stage deal</p>
                <p>100 USD</p>
                <input class="formDealEditDeal" title="button" value="Edit deal">
              </div>
              <div class="deal__panel--body">
                <p>Name deal</p>
                <p>Stage deal</p>
                <p>100 USD</p>
                <input class="formDealEditDeal" title="button" value="Edit deal">
              </div>
              <div class="deal__panel--body">
                <p>Name deal</p>
                <p>Stage deal</p>
                <p>100 USD</p>
                <input class="formDealEditDeal" title="button" value="Edit deal">
              </div>
              <div class="deal__panel--body">
                <p>Name deal</p>
                <p>Stage deal</p>
                <p>100 USD</p>
                <input class="formDealEditDeal" title="button" value="Edit deal">
              </div>
              <div class="deal__panel--body">
                <p>Name deal</p>
                <p>Stage deal</p>
                <p>100 USD</p>
                <input class="formDealEditDeal" title="button" value="Edit deal">
              </div>
              <div class="deal__panel--body">
                <p>Name deal</p>
                <p>Stage deal</p>
                <p>100 USD</p>
                <input class="formDealEditDeal" title="button" value="Edit deal">
              </div>
              <div class="deal__panel--body">
                <p>Name deal</p>
                <p>Stage deal</p>
                <p>100 USD</p>
                <input class="formDealEditDeal" title="button" value="Edit deal">
              </div>
              <div class="deal__panel--body">
                <p>Name deal</p>
                <p>Stage deal</p>
                <p>100 USD</p>
                <input class="formDealEditDeal" title="button" value="Edit deal">
              </div>
            </div>

            <input onclick="location.href='#modalDeal'" class="formAddBut" title="button"
                   value="Quickly add deal">

            <!--Modal window deal-->
            <div id="modalDeal" class="modalDialog modalDeal">
              <div>
                <header>
                  <div class="wrapper__modal1Title">
                    <div><i class="fa fa-briefcase"></i></div>
                    <h3>Add deal</h3>
                  </div>
                </header>
                <table border="1">
                  <caption>Current deals with company:</caption>
                  <tr>
                    <th>deal(s)</th>
                    <th style="width: 60px">6500</th>
                    <th style="width: 60px">USD</th>
                  </tr>
                  <tr>
                    <td>deal</td>
                    <td>6500</td>
                    <td>USD</td>
                  </tr>
                  <tr>
                    <td>deal</td>
                    <td>6500</td>
                    <td>USD</td>
                  </tr>
                  <tr>
                    <td>deal</td>
                    <td>6500</td>
                    <td>USD</td>
                  </tr>
                </table>
                <span><input class="checkboxDeal" title="checkbox">Add more deals</span>
                <p>Title: <input title="text" class="modalInput" id="modalDealTitle" disabled></p>
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
                <p>Budget: <input title="text" class="modalInput" id="modalDealBudget" disabled></p>
                <input class="modalBut" title="button" value="Save contact">
                <input class="modalBut cancel" onclick="location.href='#close'" title="button"
                       value="Cancel">
              </div>
            </div>
            <!--End-->


          </div>
          <div class="form--action">
            <h3>Tasks and Notes</h3>

            <section id="cd-timeline">

              <div class="cd-timeline-block">
                <div class="cd-timeline-content">
                  <div id="task" class="action__task action--task">
                    <h4>Task</h4>
                    <p>Time of completion:</p>
                    <p>Responsible</p>
                    <p>Type of task</p>
                    <!--<input id="formTaskText" class="formActionText" title="text">-->
                    <textarea rows="3" cols="21" id="formTaskText" class="formActionText" name="text"></textarea>
                    <input id="formTaskDel" class="actionBut" title="button" value="Delete">
                    <input id="formTaskEdit" class="actionBut" title="button" value="Edit">
                    <input id="formTaskDone" class="actionBut" title="button" value="Done">
                  </div>
                  <span class="cd-date">Jan 14</span>
                </div> <!-- cd-timeline-content -->
              </div> <!-- cd-timeline-block -->

              <div class="cd-timeline-block">
                <!-- ... -->
              </div>


              <div class="cd-timeline-block">
                <div class="cd-timeline-content">
                  <div id="note" class="action__task action--note">
                    <h4>Note</h4>
                    <p>Created:</p>
                    <p>User name:</p>
                    <!--      <input id="formNoteText" class="formActionText" title="text">-->
                    <textarea rows="3" cols="21" id="formNoteText" class="formActionText" name="text"></textarea>
                    <input id="formNoteDel" class="actionBut" title="button" value="Delete">
                    <input id="formNoteEdit" class="actionBut" title="button" value="Edit">
                  </div>
                  <span class="cd-date">Jan 20</span>
                </div> <!-- cd-timeline-content -->
              </div> <!-- cd-timeline-block -->

              <div class="cd-timeline-block">
                <!-- ... -->
              </div>

              <div class="cd-timeline-block">
                <div class="cd-timeline-content">
                  <div id="action" class="action__task">
                    <h4>Action</h4>
                    <p>Activiity;</p>
                    <p>User name:</p>
                    <p>Name company:</p>
                    <p>Name entity:</p>
                  </div>
                  <span class="cd-date">Jan 20</span>
                </div> <!-- cd-timeline-content -->
              </div> <!-- cd-timeline-block-->

              <div class="cd-timeline-block">
                <!-- ... -->
              </div>

              <div class="cd-timeline-block">
                <div class="cd-timeline-content">
                  <div id="file" class="action__task">
                    <h4>File</h4>
                    <p>Created;</p>
                    <p>User name:</p>
                    <input id="formFileDel" class="actionBut" title="button" value="Delete">
                  </div>
                  <span class="cd-date">Jan 20</span>
                </div> <!-- cd-timeline-content -->
              </div> <!-- cd-timeline-block -->

              <div class="cd-timeline-block">
                <!-- ... -->
              </div>
            </section>


            <div class="wrapper__actionBut">
              <input onclick="location.href='#modalTask'" class="actionBut" title="button" value="Add task">
              <input class="actionBut" title="button" value="Add note">
              <p><input class="checkbox" id="actionButNote" title="checkbox">Note contact</p>
              <p><input class="checkbox" id="actionButDeal" title="checkbox">Note deal</p>
            </div>

            <!--Modal window task-->
            <div id="modalTask" class="modalDialog modalTask">
              <div>
                <header>
                  <div class="wrapper__modal1Title">
                    <div><i class="fa fa-tasks"></i></div>
                    <h3>Add task</h3>
                  </div>
                </header>

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
                  <input class="clockpicker" value="Choose time" data-default="20:48">
                </div>
                <p>Type:
                  <select>
                    <option>Choose from the list</option>
                    <option>Follow-up</option>
                    <option>meet</option>
                    <option>other</option>
                  </select>
                </p>
                <p>Description:<textarea class="modalTextArea" rows="5" cols="42" name="text"></textarea></p>
                <input class="modalBut" title="button" value="Save contact">
                <input class="modalBut cancel" onclick="location.href='#close'" title="button"
                       value="Cancel">
              </div>
            </div>
            <!--End-->
          </div>


        </div>
      </div>
    </div>
  </div>
  <script src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
  <script title="text/javascript" src="js/jquery-clockpicker.js"></script>
  </body>
</html>
