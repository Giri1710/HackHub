package com.hackhub.servlet.hackathon;

import com.hackhub.dao.HackathonDAO;
import com.hackhub.model.Hackathon;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/hackathons")
public class HackathonListServlet
        extends HttpServlet {

    @Override
protected void doGet(
HttpServletRequest request,
HttpServletResponse response)
throws ServletException, IOException {

String location =
        request.getParameter(
                "location");

String status =
        request.getParameter(
                "status");

HackathonDAO dao =
        new HackathonDAO();

List<Hackathon> hackathons;

if(location != null ||
   status != null){

    if(location == null)
        location = "";

    if(status == null)
        status = "";

    hackathons =
            dao.filterHackathons(
                    location,
                    status);

} else {

    hackathons =
            dao.getAllHackathons();
}

request.setAttribute(
        "hackathons",
        hackathons);

request.getRequestDispatcher(
        "/views/hackathon/list.jsp")
        .forward(
                request,
                response);


}

}