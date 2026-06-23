package com.hackhub.servlet.auth;

import com.hackhub.dao.UserDAO;
import com.hackhub.model.User;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String email =
                request.getParameter("email");

        String password =
                request.getParameter("password");

        UserDAO dao =
                new UserDAO();

        User user =
                dao.loginUser(email, password);

        if (user != null) {

            HttpSession session =
                    request.getSession();

            session.setAttribute(
                    "loggedUser",
                    user
            );
            
            System.out.println(
    "Session User = " +
    session.getAttribute("loggedUser")
);

            response.sendRedirect(
                    "views/student/profile.jsp"
            );

        } else {

            response.getWriter().println(
                    "Invalid Email or Password!"
            );
        }
    }
}