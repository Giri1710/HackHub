package com.hackhub.servlet.admin;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/adminLogout")
public class AdminLogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws IOException {

        request.getSession().removeAttribute("admin");

        response.sendRedirect(
                request.getContextPath()
                + "/dashboard");
    }
}