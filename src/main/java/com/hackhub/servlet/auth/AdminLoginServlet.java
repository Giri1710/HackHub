package com.hackhub.servlet.auth;

import com.hackhub.dao.AdminDAO;
import com.hackhub.model.Admin;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws IOException {

        String username =
                request.getParameter("username");

        String password =
                request.getParameter("password");

        AdminDAO dao = new AdminDAO();

        Admin admin =
                dao.login(username, password);

        if (admin != null) {

            request.getSession()
                   .setAttribute("admin", admin);

            response.sendRedirect(
                    request.getContextPath()
                    + "/views/hackathon/create.jsp");

        } else {

            response.sendRedirect(
                    request.getContextPath()
                    + "/views/admin/login.jsp?error=1");

        }
    }
}