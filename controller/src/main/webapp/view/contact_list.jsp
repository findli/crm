<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<c:url var="basePath" value="/"/>
<div class="wrapper__aboutCompany">
    <div class="forms">

        <div class="forms--lContact--Filter">
            <form class="form-horizontal">
                <h2>Фильтры</h2><br>
                <div class="radio">
                    <label><input type="radio" name="optradio" value="0" checked> Полный список контактов</label>
                </div>
                <div class="radio">
                    <label><input type="radio" name="optradio" value="1"> Контакты без задач</label>
                </div>
                <div class="radio">
                    <label><input type="radio" name="optradio" value="2"> Контакты с просроченными задачами</label>
                </div>
                <div class="radio">
                    <label><input type="radio" name="optradio" value="3"> Удаленные</label>
                </div>
                <hr>

                <div class="form-group">
                    <label class="col-sm-3 control-label">Когда:</label>
                    <select class="col-sm-4 form-control">
                        <option value="0">за все время</option>
                        <option value="1">за сегодня</option>
                        <option value="2">за 3 дня</option>
                        <option value="3">за неделю</option>
                        <option value="4">за месяц</option>
                        <option value="5">за квартал</option>
                        <option value="6">за период</option>
                    </select>
                </div>

                <div class="form-group">
                    <input class="actionBut" type="button" value="Созданные">
                    <input class="actionBut" type="button" value="Изменённые">
                </div>

                <hr>
                <label>Этапы:</label>
                <div class="checkbox">
                    <label><input type="checkbox" value="check1">Без сделок</label>
                    <label><input type="checkbox" value="check2">Без открытых сделок</label>
                    <label><input type="checkbox" value="check3">Первичный контакт</label>
                    <label><input type="checkbox" value="check4">Переговоры</label>
                    <label><input type="checkbox" value="check5">Принимают решение</label>
                    <label><input type="checkbox" value="check6">Согласование договора</label>
                    <label><input type="checkbox" value="check7">Успешно реализован</label>
                    <label><input type="checkbox" value="check8">Закрыто и не реализовано</label>
                </div>
                <hr>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Responsible</label>
                    <div class="col-sm-9">
                        <select class="form-control">
                            <c:forEach var="user" items="${users}">
                                <option><c:out value="${user.lName}"/></option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <hr>
                <div class="form-group">
                    <label class="control-label col-sm-4">Задачи:</label>
                    <select class="col-sm-5 form-control">
                        <option value="0">не учитывать</option>
                        <option value="1">на сегодня</option>
                        <option value="2">на завтра</option>
                        <option value="3">на этой неделе</option>
                        <option value="4">в этом месяце</option>
                        <option value="5">в этом квартале</option>
                        <option value="6">нет задач</option>
                        <option value="7">просрочены</option>
                    </select>
                </div>
                <hr>
                <div class="form-group">
                    <label class="control-label col-sm-4" for="contactTag">Теги:</label>
                    <select class="col-sm-5 form-control" id="contactTag" name="contactTag">
                        <option value="0">в работе</option>
                        <option value="1">не в работе</option>
                        <option value="2">завтра</option>
                    </select>
                </div>
                <hr>
                <input class="formAddBut" type="button" value="Применить">
                <input class="formAddBut" type="button" value="Очистить">
            </form>
        </div>

        <div class="forms--lContact">
            <h2>List contacts</h2>
            <div class="row">
                <div class="col-sm-6">
                    <a class="btn btn-info btn-sm" href="#" role="button">Contact ???</a>
                    <a class="btn btn-info btn-sm" href="${basePath}company" role="button">Company</a>
                    <a class="btn btn-info btn-sm" href="#" role="button">All ???</a>
                </div>
                <div class="col-sm-3">

                </div>
                <div class="col-sm-3">
                    <a class="btn btn-primary btn-md" href="${basePath}contactAdd" role="button">Add contact</a>
                </div>
            </div>
            <br>

            <div class="wrapper__deals">
                <form action="${basePath}/contactEdit" method="post">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th>Имя</th>
                            <th>Компания</th>
                            <th>Телефон</th>
                            <th>Email</th>
                        </tr>
                        </thead>
                        <tbody id="t_contacts">
                        <c:forEach var="contact" items="${contactList}">
                            <%--<tr class="rowlink" onclick="window.location.href='/contactEdit?idContact=${contact.getId()}'; return false">--%>
                            <tr data-href="/contactEdit?idContact=${contact.getId()}">
                                <td class="item"><c:out value="${contact.getlName()}"/></td>
                                <td><c:out value="${contact.getCompany().getTitle()}"/></td>
                                <td><c:out value="${contact.getlName()}"/></td>
                                <td><c:out value="${contact.getEmail()}"/></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </form>
            </div>

        </div>
    </div>
</div>
<!-- <script src="https://code.jquery.com/jquery-2.0.0.min.js"></script> -->
<script type="text/javascript" src="${basePath}/js/script.js"></script>
