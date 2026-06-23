package com.hackhub.servlet.team;

import com.hackhub.dao.TeamMemberDAO;
import com.hackhub.model.TeamMember;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/teamMembers")
public class TeamMemberListServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int teamId =
                Integer.parseInt(
                        request.getParameter("teamId"));

        TeamMemberDAO dao =
                new TeamMemberDAO();

        List<TeamMember> members =
                dao.getMembersByTeamId(teamId);

        request.setAttribute(
                "members",
                members);

        request.setAttribute(
                "teamId",
                teamId);

        request.getRequestDispatcher(
                "/views/team/members.jsp")
                .forward(
                        request,
                        response);
    }
}