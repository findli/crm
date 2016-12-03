package com.becomejavasenior.servlets;

import com.becomejavasenior.DAO.DaoException;
import com.becomejavasenior.bean.*;
import com.becomejavasenior.service.*;
import com.becomejavasenior.service.impl.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;


@WebServlet(name = "companyDetailServlet", urlPatterns="/companyDetail")
public class CompanyDetailServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        int idCompany = 0;
        if (request.getParameter("idCompany") != null) {
            idCompany = Integer.parseInt(request.getParameter("idCompany"));
        }

        ContactService contactService = new ContactServiceImpl();
        DealService dealService = new DealServiceImpl();
        TaskService taskService = new TaskServiceImpl();
        FileService fileService = new FileServiceImpl();
        NoteService noteService = new NoteServiceImpl();
        CompanyService companyService = new CompanyServiceImpl();


        List<Contact> contactList = contactService.getContactsForList(idCompany);
        List<Deal> dealList = dealService.getDealsForList(idCompany);
        List<Task> taskList = taskService.getTasksForList(idCompany);
     /*   List<File> fileList = fileService.getFilesForList();*/
        List<Note> noteList = noteService.getNotesForList(idCompany);
        Company company = null;
        try {
            company = companyService.getById(idCompany);
        } catch (DaoException e) {
            e.printStackTrace();
        }


        session.setAttribute("contactList", contactList);
        session.setAttribute("dealList", dealList);
        session.setAttribute("taskList", taskList);
        session.setAttribute("noteList", noteList);
        session.setAttribute("company", company);
   /*     session.setAttribute("fileList", fileList);*/

        response.sendRedirect("/pages/companyDetail.jsp");
    }
}