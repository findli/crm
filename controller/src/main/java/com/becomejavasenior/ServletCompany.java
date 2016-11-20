package com.becomejavasenior;

import com.becomejavasenior.DAO.DAOException;
import com.becomejavasenior.DAO.Imp.TaskDAOImpl;
import com.becomejavasenior.DAO.TaskDAO;
import com.becomejavasenior.bean.*;

import javax.servlet.annotation.WebServlet;

/*@WebServlet("main.java.com.becomejavasenior.ServletCompany")*/
public class ServletCompany extends javax.servlet.http.HttpServlet {

    private TaskDAO<Task> taskDAO = new TaskDAOImpl();

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, java.io.IOException {
        Contact contact = new Contact();
        Company company = new Company();
        Tag tag = new Tag();
        Deal deal = new Deal();
        Task task = new Task();
/*
        company.setTitle(request.getParameter("formCompany"));
        tag.setTitle(request.getParameter("formTag"));
        company.setPhoneNumber(request.getParameter("formPhone"));
        company.setEmail(request.getParameter("formEmail"));
        company.setWebsite(request.getParameter("formWeb"));
        company.setAdress(request.getParameter("formAddress"));*/


        /*add contact*/
        if (request.getParameter("modalButContact") != null) {
            contact.setfName(request.getParameter("modalContactName"));
            contact.setlName(request.getParameter("modalContactSurname"));
            contact.setPosition(request.getParameter("modalContactPosition"));
            contact.setEmail(request.getParameter("modalContactEmail"));
            contact.setSkype(request.getParameter("modalContactSkype"));
        }

       /* add deal*/
        if (request.getParameter("modalButDeal") != null) {
            deal.setTitle(request.getParameter("modalDealTitle"));
            deal.setBudget(Integer.parseInt(request.getParameter("modalDealBudget")));
        }

        /* add task*/
        if (request.getParameter("modalButTask") != null) {
/*            task.setDeadlineDate(request.getParameter("myCalendar-1"));
            task.setDeadlineDate(request.getParameter("timeChoose"));*/
            task.setDescription(request.getParameter("modalTaskDesc"));
        }


        /*remove task*/
        int idTask = Integer.parseInt(request.getParameter("idTask"));
        if (request.getParameter("formTaskDel") != null) {
            try {
                taskDAO.delete(idTask);
            } catch (DAOException e) {
                e.printStackTrace();
            }
        }

         /*remove note*/
        int idNote = Integer.parseInt(request.getParameter("idNote"));
        if (request.getParameter("formNoteDel") != null) {
            try {
                taskDAO.delete(idNote);
            } catch (DAOException e) {
                e.printStackTrace();
            }
        }

            /*remove file*/
        int idFile = Integer.parseInt(request.getParameter("idFile"));
        if (request.getParameter("formFileDel") != null) {
            try {
                taskDAO.delete(idFile);
            } catch (DAOException e) {
                e.printStackTrace();
            }
        }


        request.getRequestDispatcher("company.jsp").forward(request, response);
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, java.io.IOException {


    }

}
