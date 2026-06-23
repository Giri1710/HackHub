package com.hackhub.servlet.project;

import com.hackhub.dao.ProjectDAO;
import com.hackhub.model.Project;
import com.hackhub.model.User;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/createProject")
public class ProjectCreateServlet
        extends HttpServlet {

    @Override
protected void doPost(
        HttpServletRequest request,
        HttpServletResponse response)
        throws IOException {

    User user =
            (User) request.getSession()
                          .getAttribute("loggedUser");

    if(user == null){

        response.sendRedirect(
                request.getContextPath()
                + "/views/auth/login.jsp");

        return;
    }

    Project project =
            new Project();

    project.setTitle(
            request.getParameter("title"));

    project.setDescription(
            request.getParameter("description"));

    project.setDomain(
            request.getParameter("domain"));

    project.setCollege(
            request.getParameter("college"));

    project.setRegion(
            request.getParameter("region"));

    project.setStatus(
            request.getParameter("status"));

    project.setCreatedBy(
            user.getUserId());

    ProjectDAO dao =
            new ProjectDAO();

    dao.createProject(project);

    response.sendRedirect(
            request.getContextPath()
            + "/projects");
}
}