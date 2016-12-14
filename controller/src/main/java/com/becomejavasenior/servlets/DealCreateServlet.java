package com.becomejavasenior.servlets;

import com.becomejavasenior.DAO.DaoException;
import com.becomejavasenior.bean.*;
import com.becomejavasenior.service.*;
import com.becomejavasenior.service.impl.*;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(name = "dealCreateServlet", urlPatterns = "/dealCreate")
@MultipartConfig(maxFileSize = 102400)
@Controller("dealCreateServlet")
public class DealCreateServlet extends HttpServlet{

    public static Logger log = Logger.getLogger(DealCreateServlet.class);

    @Autowired
    @Qualifier("dealService")
    private DealService dealService;

    @Autowired
    @Qualifier("contactService")
    ContactService contactService;

    @Autowired
    @Qualifier("periodInDaysTypeService")
    PeriodInDaysTypeService periodService;

    @Autowired
    @Qualifier("taskTypeService")
    TaskTypeService taskTypeService;


    @Autowired
    @Qualifier("userService")
    UserService userService;

    @Autowired
    @Qualifier("taskService")
    TaskService taskService;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        SpringBeanAutowiringSupport.processInjectionBasedOnServletContext(this, config.getServletContext());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<TaskType> TaskTypeList = null;
        List<PeriodInDaysType> PeriodInDaysTypeList = null;

        List<Contact> contactList = null;

        try {
            contactList = contactService.getAll();
            log.trace("get contactList in DealCreateServlet");
            TaskTypeList = taskTypeService.getAll();
            log.trace("get TaskTypeList in DealCreateServlet");
            PeriodInDaysTypeList = periodService.getAll();
            log.trace("get PeriodInDaysTypeList in DealCreateServlet");
        } catch (DaoException e) {
            log.warn("DaoException in DealCreateServlet");
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            log.warn("ClassNotFoundException in DealCreateServlet");
            e.printStackTrace();
        }

        session.setAttribute("TaskTypeList", TaskTypeList);
        session.setAttribute("PeriodInDaysTypeList", PeriodInDaysTypeList);
        session.setAttribute("contactList", contactList);
        request.getRequestDispatcher("/pages/deal_add.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");

        Deal deal = getDealFromRequest(request);
        Contact contact = getContactFromRequest(request);
        Task task = getTaskFromRequest(request);
        Company company = getCompanyFromRequest(request);
        Note note = getNoteFromRequest(request, deal);
//        File attachedFile = getFileFromRequest(request);

        try {
            dealService.createNewDeal(deal, contact, task, company, note);
        } catch (DaoException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        response.sendRedirect("/deal");
    }

    private Note getNoteFromRequest(HttpServletRequest request, Deal deal) {
        Note note = new Note();

        String noteContent = request.getParameter("noteDeal");
        if (!noteContent.isEmpty()) {
            note.setNoteText(noteContent);
            note.setDeleted(false);

            note.setDateCreate(new Date());
            User creator = new User();
            creator.setId(1); //TODO: change to user under which the logged in
            note.setCreatedUser(creator);
            note.setDeal(deal);
            Company company = new Company();
            company.setId(1); //TODO: change to company under which the logged in
            note.setCompany(company);
            Contact contact = new Contact();
            contact.setId(1); //TODO: change to contact under which the logged in

            note.setContact(contact);

        } else {
            note.setNoteText("");
        }
        return note;
    }
    private Deal getDealFromRequest(HttpServletRequest request) {
        Deal deal = new Deal();

        deal.setTitle(request.getParameter("dealName"));


        User user = new User();
        user.setlName(request.getParameter("responsibleUser"));
        deal.setResponsibleUser(user);

        deal.setCreateDate(new Date());
        deal.setDeleted(false);

        if (!request.getParameter("dealBudget").isEmpty()) {
            deal.setBudget(new Integer(request.getParameter("dealBudget")));
        }
        return deal;
    }
    private Contact getContactFromRequest(HttpServletRequest request) {
        Contact contact = new Contact();
        return contact;
    }
    private Task getTaskFromRequest(HttpServletRequest request) {
        Task task = new Task();
        if(request.getParameter("Title").isEmpty()) {
            task.setTitle("");
            return task;
        }

        TaskType taskType = new TaskType();
        User user = new User();
        PeriodInDaysType periodInDaysType = new PeriodInDaysType();

        SimpleDateFormat format = new SimpleDateFormat();
        format.applyPattern("dd.MM.yyyy HH:mm");
        Date date = null;

        try {
            user = userService.getById(parseString(request.getParameter("ResponsibleUserTask")));
            taskType = taskTypeService.getById(parseString(request.getParameter("TaskType")));
            if(!request.getParameter("DeadlineDate").isEmpty()) {
                date = format.parse(request.getParameter("DeadlineDate"));
            }
            periodInDaysType = periodService.getById(parseString(request.getParameter("PeriodInDaysType")));
        }catch ( ParseException e){
            e.printStackTrace();
        }catch (DaoException e){
            e.printStackTrace();
        }
        task.setTitle(request.getParameter("Title"));
        task.setTaskType(taskType);
        task.setDescription(request.getParameter("Description"));
        task.setDeadlineDate(date);
        task.setPeriodInDaysType(periodInDaysType);
        task.setPeriodInMinutes((int) date.getTime());
        task.setResponsibleUser(user);
        task.setFinished(false);
        task.setDeleted(false);
        return task;
    }

    private Company getCompanyFromRequest(HttpServletRequest request) {
        Company company = new Company();
        company.setTitle(request.getParameter("companyDeal"));
        System.out.println("company = " + company.getTitle());
        return company;
    }
    private File getFileFromRequest(HttpServletRequest request) {
        File attachedFile = new File();
        return attachedFile;
    }
    private int parseString(String text){
        int id = Integer.parseInt(text);
        return id;
    }
}