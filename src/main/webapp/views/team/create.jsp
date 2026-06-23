<%@ page import="com.hackhub.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.hackhub.model.Hackathon" %>
<%
User user =
(User) session.getAttribute("loggedUser");

if(user == null){


response.sendRedirect(
    request.getContextPath()
    + "/views/auth/login.jsp");

return;


}
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>


<title>Create Team</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<style>

    body{
        margin:0;
        min-height:100vh;

        background:linear-gradient(
            135deg,
            #000000,
            #0a0f2c,
            #1e40af
        );

        background-attachment:fixed;
    }

    .form-container{
        display:flex;
        justify-content:center;
        align-items:center;
        min-height:85vh;
    }

    .form-card{
        width:550px;
        background:white;
        color:black;
        padding:30px;
        border-radius:20px;
        border:2px solid black;
        box-shadow:0px 5px 20px rgba(0,0,0,0.3);
    }

    .form-title{
        text-align:center;
        margin-bottom:25px;
        font-weight:bold;
    }

    .form-group{
        display:flex;
        align-items:center;
        margin-bottom:15px;
    }

    .form-group label{
        width:170px;
        font-weight:bold;
    }

    .form-group input,
    .form-group select{
        flex:1;
        padding:10px;
        border:1px solid #ccc;
        border-radius:8px;
    }

    .form-group-btn{
        text-align:center;
        margin-top:20px;
    }

</style>


</head>

<body>

<jsp:include page="/views/common/navbar.jsp" />

<div class="form-container">

    <div class="form-card">

        <h2 class="form-title">
            Create Team
        </h2>

        <form action="${pageContext.request.contextPath}/createTeam"
              method="post">

            <div class="form-group">

                <label>Team Name:</label>

                <input type="text"
                       name="teamName"
                       required>

            </div>

            <div class="form-group">

                <label>Select Hackathon:</label>

                <select name="hackathonId" required>

                <%
                List<Hackathon> hackathons =
                        (List<Hackathon>)
                        request.getAttribute(
                                "hackathons");

                if(hackathons != null){

                    for(Hackathon h : hackathons){
                %>

                    <option value="<%= h.getHackathonId() %>">
                        <%= h.getTitle() %>
                    </option>

                <%
                    }
                }
                %>

                </select>

            </div>

            <div class="form-group">

                <label>Leader Name:</label>

                <input type="text"
                       value="<%= user.getName() %>"
                       readonly>

            </div>

            <div class="form-group-btn">

                <button type="submit"
                        class="btn btn-primary">
                    Create Team
                </button>

            </div>

        </form>

    </div>

</div>

</body>

</html>
