package com.hackhub.servlet.dashboard;

import com.hackhub.dao.DashboardDAO;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/dashboard")
public class DashboardServlet
        extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        DashboardDAO dao =
                new DashboardDAO();

        request.setAttribute(
                "userCount",
                dao.getUserCount());

        request.setAttribute(
                "teamCount",
                dao.getTeamCount());

        request.setAttribute(
                "projectCount",
                dao.getProjectCount());

        request.setAttribute(
                "requestCount",
                dao.getRequestCount());

        try {

            RequestDispatcher rd =
                    request.getRequestDispatcher(
                            "/views/dashboard/dashboard.jsp");

            rd.forward(
                    request,
                    response);

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}