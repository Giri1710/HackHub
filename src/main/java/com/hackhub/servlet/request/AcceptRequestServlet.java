package com.hackhub.servlet.request;

import com.hackhub.dao.RequestDAO;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/acceptRequest")
public class AcceptRequestServlet
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

        RequestDAO dao =
                new RequestDAO();

        dao.acceptRequest(
        requestId,
        "alpha.team@hackhub.com");

        response.sendRedirect(
                request.getContextPath()
                + "/requests");
    }
}