package com.hackhub.servlet.team;

import com.hackhub.dao.TeamRequestDAO;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/rejectTeamRequest")
public class RejectTeamRequestServlet
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

        TeamRequestDAO dao =
                new TeamRequestDAO();

        dao.rejectRequest(
                requestId);

        response.sendRedirect(
                request.getContextPath()
                + "/teamRequests");
    }
}