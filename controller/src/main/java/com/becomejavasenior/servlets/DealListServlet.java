package com.becomejavasenior.servlets;

import com.becomejavasenior.DAO.DaoException;
import com.becomejavasenior.bean.*;
import com.becomejavasenior.service.*;
import com.becomejavasenior.service.impl.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.persistence.SecondaryTables;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "dealListServlet", urlPatterns = "/deal")
@Controller("dealServlet")
public class DealListServlet extends HttpServlet {
    private ApplicationContext context;

    @Autowired
    @Qualifier("dealService")
    private DealService dealService;

    @Autowired
    @Qualifier("companyService")
    CompanyService companyService;

    @Override
    public void init(ServletConfig config) throws ServletException {
                super.init(config);
                SpringBeanAutowiringSupport.processInjectionBasedOnServletContext(this, config.getServletContext());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        TaskTypeService taskTypesService = new TaskTypeServiceImpl();
        UserService userService = new UserServiceImpl();

        List<Deal> dealList = dealService.getDealsForList();
        List<TaskType> taskTypeList = null;
        List<User> users = null;
        List<Company> companyList = null;
        try {
            taskTypeList = taskTypesService.getAll();
            users = userService.getAll();
            companyList = companyService.getAll();
        } catch (DaoException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        session.setAttribute("companyList", companyList);
        session.setAttribute("users", users);
        session.setAttribute("taskTypeList", taskTypeList);
        session.setAttribute("dealList", dealList);
//        response.sendRedirect("/pages/deal.jsp");
        request.getRequestDispatcher("/pages/deal.jsp").forward(request, response);
    }

}