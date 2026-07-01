package com.hackhub.servlet.team;

import com.hackhub.dao.HackathonDAO;
import com.hackhub.model.Hackathon;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/teamForm")
public class TeamFormServlet
        extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HackathonDAO dao =
                new HackathonDAO();

        List<Hackathon> hackathons =
                dao.getAllHackathons();
        System.out.println("Total Hackathons = " + hackathons.size());

for (Hackathon h : hackathons) {
    System.out.println(h.getHackathonId() + " : " + h.getTitle());
}

        request.setAttribute(
                "hackathons",
                hackathons);

        request.getRequestDispatcher(
                "/views/team/create.jsp")
                .forward(
                        request,
                        response);
    }
}