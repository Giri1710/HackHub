package com.hackhub.servlet.request;

import com.hackhub.dao.RequestDAO;
import com.hackhub.model.Request;
import com.hackhub.model.User;
import com.hackhub.dao.ProjectDAO;
import com.hackhub.model.Project;
import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/sendRequest")
public class SendRequestServlet
        extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        User user
                = (User) request.getSession()
                        .getAttribute("loggedUser");

        if (user == null) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/views/auth/login.jsp");

            return;
        }

        int projectId
                = Integer.parseInt(
                        request.getParameter(
                                "projectId"));

        Request req
                = new Request();

        req.setSenderId(
                user.getUserId());

        ProjectDAO projectDAO
                = new ProjectDAO();

        Project project
                = projectDAO.getProjectById(
                        projectId);

        req.setReceiverId(
                project.getCreatedBy());

        req.setRequestType(
                "PROJECT_JOIN");

        req.setTeamId(9);

        req.setProjectId(
                projectId);

        req.setMessage(
                "I would like to collaborate.");

        req.setStatus(
                "Pending");

        RequestDAO dao
                = new RequestDAO();

        dao.sendRequest(req);

        response.sendRedirect(
                request.getContextPath()
                + "/projects");
    }
}
