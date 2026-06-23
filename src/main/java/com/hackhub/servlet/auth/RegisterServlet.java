package com.hackhub.servlet.auth;

import com.hackhub.dao.UserDAO;
import com.hackhub.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        User user = new User();

        user.setName(request.getParameter("name"));
        System.out.println("Email received: "
                + request.getParameter("email"));
        user.setEmail(request.getParameter("email"));
        user.setPassword(request.getParameter("password"));
        user.setCollege(request.getParameter("college"));
        user.setRegion(request.getParameter("region"));
        user.setSkills(request.getParameter("skills"));
        user.setInterests(request.getParameter("interests"));
        user.setAvailability(request.getParameter("availability"));
        System.out.println("=== REGISTER STARTED ===");
        System.out.println("Name: " + request.getParameter("name"));
        System.out.println("Email: " + request.getParameter("email"));
        UserDAO dao = new UserDAO();

        boolean success = dao.registerUser(user);

        if (success) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/views/auth/login.jsp"
            );

        } else {

            response.getWriter().println(
                    "Registration Failed!"
            );
        }
    }
}
