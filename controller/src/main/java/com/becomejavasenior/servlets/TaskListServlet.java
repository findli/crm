package com.becomejavasenior.servlets;



import com.becomejavasenior.DAO.DaoException;
import com.becomejavasenior.bean.Task;
import com.becomejavasenior.service.impl.TaskServiceImpl;
import com.becomejavasenior.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

@WebServlet(name = "TaskListServlet", urlPatterns = "/taskList")
@Controller("taskListServlet")
public class TaskListServlet extends HttpServlet {

    @Autowired
    @Qualifier("taskService")
    TaskService taskService;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        SpringBeanAutowiringSupport.processInjectionBasedOnServletContext(this, config.getServletContext());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        HttpSession session = request.getSession();
        List<Task> listTasks = null;
        try {
            listTasks = taskService.getAll();
        }catch (DaoException e){
          e.printStackTrace();
        }catch (ClassNotFoundException e){
            e.printStackTrace();
        }
        session.setAttribute("listTasks", listTasks);
        request.getRequestDispatcher("/pages/taskList.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");

        Enumeration listParameters =  request.getParameterNames();
        while(listParameters.hasMoreElements()){
            String paramName = (String)listParameters.nextElement();
                 try {
                     taskService.delete(Integer.parseInt(paramName));
                 }catch (DaoException e){
                     e.printStackTrace();
                 }
        }
        //request.getRequestDispatcher("/pages/taskList.jsp").forward(request, response);
        response.sendRedirect("/taskList");
    }
}
