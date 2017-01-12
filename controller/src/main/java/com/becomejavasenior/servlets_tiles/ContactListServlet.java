package com.becomejavasenior.servlets_tiles;

import com.becomejavasenior.DAO.DaoException;
import com.becomejavasenior.bean.Contact;
import com.becomejavasenior.bean.User;
import com.becomejavasenior.service.ContactService;
import com.becomejavasenior.service.UserService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "contactListServlet")
@Controller("contactListServlet")
public class ContactListServlet {
    @Autowired
    @Qualifier("contactService")
    ContactService contactService;
    @Autowired
    @Qualifier("userService")
    UserService userService;
    private Logger logger = LogManager.getLogger(ContactListServlet.class);

    @RequestMapping(value = "/contact", method = RequestMethod.GET)
    protected String doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        List<Contact> contactList = null;
        List<User> users = null;

        logger.debug("This is a debug message");
        logger.info("This is an info message");
        logger.warn("This is a warn message");
        logger.error("This is an error message");
        String s = "This is a fatal message";
        logger.fatal(s);
        System.out.println(s);
        try {
            contactList = contactService.getAll();
            logger.trace(contactList);
            for (Contact contact : contactList) {

            }
            users = userService.getAll();
        } catch (DaoException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        session.setAttribute("users", users);
        session.setAttribute("contactList", contactList);

        return "app.homepage";
    }

}
