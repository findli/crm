package com.becomejavasenior.servlets;

import com.becomejavasenior.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "userValidatorServlet")
@Controller("userValidatorServlet")
public class UserValidatorServlet extends HttpServlet {

    @Autowired
    @Qualifier("userService")
    UserService userService;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        SpringBeanAutowiringSupport.processInjectionBasedOnServletContext(this, config.getServletContext());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd;
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        boolean isAuthorised = false;
        try {
            isAuthorised = userService.checkAuthorisation(email, password);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Contact administrator.", e);
        }

        if (!isAuthorised) {
            rd = request.getRequestDispatcher("/view/loginError.jsp");
        } else {
            HttpSession session = request.getSession();
            try {
                session.setAttribute("user", userService.getByEmail(email));
            } catch (SQLException e) {
                e.printStackTrace();
                throw new ServletException("Contact administrator.");
            }
            rd = request.getRequestDispatcher("/view/loginSuccess.jsp");
        }
        // TODO: 1/12/2017 todo )
//        session.setParameter("fastMessage", "You login successfully!");
        rd.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("/view/login.jsp");
        requestDispatcher.forward(request, response);
    }
}
