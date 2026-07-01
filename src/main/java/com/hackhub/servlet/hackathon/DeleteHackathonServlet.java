package com.hackhub.servlet.hackathon;

import com.hackhub.dao.HackathonDAO;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/deleteHackathon")
public class DeleteHackathonServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession(false);

        if(session == null ||
           session.getAttribute("admin") == null){

            response.sendRedirect(
                    request.getContextPath()
                    + "/views/admin/login.jsp");

            return;

        }

        int hackathonId =
                Integer.parseInt(
                        request.getParameter("hackathonId"));

        HackathonDAO dao =
                new HackathonDAO();

        dao.deleteHackathon(hackathonId);

        response.sendRedirect(
                request.getContextPath()
                + "/hackathons");

    }

}