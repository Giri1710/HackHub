package com.hackhub.servlet.team;

import com.hackhub.dao.TeamRequestDAO;
import com.hackhub.model.TeamRequest;
import com.hackhub.model.User;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/teamRequests")
public class TeamRequestsServlet
        extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        User user =
                (User) request.getSession()
                        .getAttribute("loggedUser");

        if(user == null){

            response.sendRedirect(
                    request.getContextPath()
                    + "/views/auth/login.jsp");

            return;
        }

        TeamRequestDAO dao =
                new TeamRequestDAO();

        List<TeamRequest> requests =
                dao.getRequestsByReceiver(
                        user.getUserId());

        System.out.println(
                "Requests Found = "
                + requests.size());

        request.setAttribute(
                "requests",
                requests);

        request.getRequestDispatcher(
                "/views/team/teamRequests.jsp")
                .forward(
                        request,
                        response);
    }
}