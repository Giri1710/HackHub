package com.hackhub.servlet.request;

import com.hackhub.dao.RequestDAO;
import com.hackhub.model.Request;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/projectRequests")
public class ProjectRequestsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        RequestDAO dao = new RequestDAO();

        List<Request> requests =
                dao.getProjectRequests();

        request.setAttribute("requests", requests);

        request.getRequestDispatcher(
                "/views/request/list.jsp")
                .forward(request, response);
    }
}