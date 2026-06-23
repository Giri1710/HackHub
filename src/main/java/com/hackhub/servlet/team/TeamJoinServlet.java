package com.hackhub.servlet.team;

import com.hackhub.dao.TeamDAO;
import com.hackhub.dao.TeamRequestDAO;
import com.hackhub.model.Team;
import com.hackhub.model.TeamRequest;
import com.hackhub.model.User;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/joinTeam")
public class TeamJoinServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        User user
                = (User) request.getSession()
                        .getAttribute("loggedUser");

        if (user == null) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/views/auth/login.jsp");

            return;
        }

        int teamId
                = Integer.parseInt(
                        request.getParameter("teamId"));

        TeamDAO teamDAO
                = new TeamDAO();

        Team team
                = teamDAO.getTeamById(teamId);

        TeamRequest req
                = new TeamRequest();

        req.setTeamId(teamId);

        req.setSenderId(
                user.getUserId());

        req.setReceiverId(
                team.getLeaderId());

        req.setMessage(
                "I would like to join your team.");

        req.setStatus(
                "Pending");

        TeamRequestDAO requestDAO =
        new TeamRequestDAO();

boolean success =
        requestDAO.sendRequest(req);

System.out.println(
        "Inserted = " + success);

response.sendRedirect(
        request.getContextPath()
        + "/teams");
    }

}
