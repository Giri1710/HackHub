package com.hackhub.servlet.team;

import com.hackhub.dao.TeamRequestDAO;
import com.hackhub.dao.TeamMemberDAO;
import com.hackhub.model.TeamRequest;
import com.hackhub.model.TeamMember;
import com.hackhub.model.User;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/acceptTeamRequest")
public class AcceptTeamRequestServlet
        extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        int requestId =
                Integer.parseInt(
                        request.getParameter(
                                "requestId"));

        User leader =
                (User) request.getSession()
                        .getAttribute(
                                "loggedUser");

        TeamRequestDAO requestDAO =
                new TeamRequestDAO();

        TeamRequest teamRequest =
                requestDAO.getRequestById(
                        requestId);

        requestDAO.acceptRequest(
                requestId,
                leader.getEmail());

        TeamMember member =
                new TeamMember();

        member.setTeamId(
                teamRequest.getTeamId());

        member.setUserId(
                teamRequest.getSenderId());

        member.setRole(
                "Member");

        TeamMemberDAO memberDAO =
                new TeamMemberDAO();

        memberDAO.joinTeam(member);

        response.sendRedirect(
                request.getContextPath()
                + "/teamRequests");
    }
}