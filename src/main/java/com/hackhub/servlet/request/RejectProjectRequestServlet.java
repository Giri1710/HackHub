package com.hackhub.servlet.request;

import com.hackhub.dao.RequestDAO;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/rejectProjectRequest")
public class RejectProjectRequestServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws IOException {

        int requestId =
                Integer.parseInt(
                        request.getParameter("requestId"));

        RequestDAO dao = new RequestDAO();

        dao.rejectRequest(requestId);

        response.sendRedirect(
                request.getContextPath()
                + "/projectRequests");
    }
}