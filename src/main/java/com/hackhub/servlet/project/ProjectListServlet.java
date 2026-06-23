package com.hackhub.servlet.project;

import com.hackhub.dao.ProjectDAO;
import com.hackhub.model.Project;
import com.hackhub.model.User;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/projects")
public class ProjectListServlet
        extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        
        User user =
    (User) request.getSession()
                  .getAttribute("loggedUser");

if(user == null){

    response.sendRedirect(
        request.getContextPath()
        + "/views/auth/login.jsp");

    return;
}

        ProjectDAO dao =
                new ProjectDAO();

        List<Project> projects =
                dao.getAllProjects();

        request.setAttribute(
                "projects",
                projects);

        request.getRequestDispatcher(
                "/views/project/list.jsp")
                .forward(
                        request,
                        response);
    }
}