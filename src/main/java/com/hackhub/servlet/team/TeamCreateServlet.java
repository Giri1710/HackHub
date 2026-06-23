/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hackhub.servlet.team;

import com.hackhub.dao.TeamDAO;
import com.hackhub.model.Team;
import com.hackhub.model.User;
import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author acer
 */
@WebServlet("/createTeam")
public class TeamCreateServlet
        extends HttpServlet {

    @Override
protected void doPost(
        HttpServletRequest request,
        HttpServletResponse response)
        throws IOException {

    Team team = new Team();

    team.setTeamName(
            request.getParameter("teamName"));

    team.setHackathonId(
            Integer.parseInt(
                    request.getParameter("hackathonId")));

    User user =
            (User) request.getSession()
                          .getAttribute("loggedUser");

    if (user == null) {

        response.sendRedirect(
                request.getContextPath()
                + "/views/auth/login.jsp");

        return;
    }

    team.setLeaderId(
            user.getUserId());

    TeamDAO dao =
            new TeamDAO();

    dao.createTeam(team);

    response.sendRedirect(
            request.getContextPath()
            + "/teams");
}
}
