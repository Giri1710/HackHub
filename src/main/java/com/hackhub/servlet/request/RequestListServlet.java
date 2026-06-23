package com.hackhub.servlet.request;

import com.hackhub.dao.RequestDAO;
import com.hackhub.model.Request;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/requests")
public class RequestListServlet
        extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        RequestDAO dao =
                new RequestDAO();

        List<Request> requests =
                dao.getAllRequests();

        request.setAttribute(
                "requests",
                requests);

        try {

            RequestDispatcher rd =
                    request.getRequestDispatcher(
                            "/views/request/list.jsp");

            rd.forward(
                    request,
                    response);

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}