package com.hackhub.servlet.team;

import com.hackhub.dao.TeamDAO;
import com.hackhub.model.Team;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/teams")
public class TeamListServlet
        extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        TeamDAO dao =
                new TeamDAO();

        List<Team> teams =
                dao.getAllTeams();

        request.setAttribute(
                "teams",
                teams);

        request.getRequestDispatcher(
                "/views/team/list.jsp")
                .forward(
                        request,
                        response);
    }
}