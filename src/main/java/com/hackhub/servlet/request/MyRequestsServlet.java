package com.hackhub.servlet.request;

import com.hackhub.dao.RequestDAO;
import com.hackhub.model.Request;
import com.hackhub.model.User;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/myRequests")
public class MyRequestsServlet
        extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        User user =
                (User) request.getSession()
                              .getAttribute(
                                      "loggedUser");

        if(user == null){

            response.sendRedirect(
                    request.getContextPath()
                    + "/views/auth/login.jsp");

            return;
        }

        RequestDAO dao =
                new RequestDAO();

        List<Request> sentRequests =
                dao.getSentRequests(
                        user.getUserId());

        List<Request> receivedRequests =
                dao.getReceivedRequests(
                        user.getUserId());

        request.setAttribute(
                "sentRequests",
                sentRequests);

        request.setAttribute(
                "receivedRequests",
                receivedRequests);

        try {

            RequestDispatcher rd =
                    request.getRequestDispatcher(
                            "/views/request/myRequests.jsp");

            rd.forward(
                    request,
                    response);

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}