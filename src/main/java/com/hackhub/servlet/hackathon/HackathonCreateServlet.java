package com.hackhub.servlet.hackathon;

import com.hackhub.dao.HackathonDAO;
import com.hackhub.model.Hackathon;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/addHackathon")
public class HackathonCreateServlet
        extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        Hackathon hackathon
                = new Hackathon();

        hackathon.setTitle(
                request.getParameter("title"));

        hackathon.setDescription(
                request.getParameter("description"));

        hackathon.setOrganizer(
                request.getParameter("organizer"));

        hackathon.setLocation(
                request.getParameter("location"));
        String region
                = request.getParameter("region");

        hackathon.setStartDate(
                Date.valueOf(
                        request.getParameter("startDate")));

        hackathon.setEndDate(
                Date.valueOf(
                        request.getParameter("endDate")));
        Date registrationDeadline
                = Date.valueOf(
                        request.getParameter(
                                "registrationDeadline"));
        hackathon.setStatus(
                request.getParameter("status"));
        
        hackathon.setRegistrationLink(
                request.getParameter("registrationLink"));
        
        hackathon.setRegion(region);

        hackathon.setRegistrationDeadline(
                registrationDeadline);

        HackathonDAO dao
                = new HackathonDAO();

        boolean success
                = dao.addHackathon(hackathon);

        if (success) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/hackathons");

        } else {

            response.getWriter().println(
                    "Failed to Add Hackathon");
        }
    }
}
