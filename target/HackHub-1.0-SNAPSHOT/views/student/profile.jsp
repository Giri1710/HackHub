<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.hackhub.model.User" %>
<%@ page import="com.hackhub.model.User" %>

<%@ page import="com.hackhub.model.User" %>

<%
    User user
            = (User) session.getAttribute("loggedUser");

    if (user == null) {

        response.sendRedirect(
                request.getContextPath()
                + "/views/auth/login.jsp"
        );

        return;
    }
%>
<%
    out.println(
            "loggedUser = "
            + session.getAttribute("loggedUser")
    );
%>

<!DOCTYPE html>
<html>
    <head>
        <title>My Profile</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
              rel="stylesheet">
        <link rel="stylesheet"
              href="<%= request.getContextPath()%>/css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>

    </head>
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

    color:white;

    font-family:'Segoe UI',sans-serif;
}

/* Profile Container */

.profile-container{

    width:700px;

    max-width:92%;

    margin:40px auto;
}

/* Heading */

.page-title{

    font-size:40px;

    font-weight:800;

    color:#f72585;

}

.page-subtitle{

    color:#9fb2d4;

    margin-bottom:35px;

}

/* Glass Card */

.profile-card{

    position:relative;

    overflow:hidden;

    background:rgba(255,255,255,.05);

    backdrop-filter:blur(16px);

    border:1px solid rgba(255,255,255,.12);

    border-radius:22px;

    padding:35px;

    box-shadow:0 18px 40px rgba(0,0,0,.45);

    transition:.35s;

}

.profile-card::before{

    content:"";

    position:absolute;

    left:0;

    top:0;

    width:100%;

    height:4px;

    background:linear-gradient(
        90deg,
        #f72585,
        #7209b7,
        #4361ee,
        #4cc9f0,
        #06d6a0,
        #f72585
    );

    background-size:200% 100%;

    animation:gradShift 4s linear infinite;

}

.profile-card:hover{

    transform:translateY(-6px);

    box-shadow:0 25px 45px rgba(114,9,183,.35);

}

/* Rainbow Animation */

@keyframes gradShift{

0%{background-position:0% 50%;}

100%{background-position:200% 50%;}

}

/* Avatar */

.avatar{

    width:90px;

    height:90px;

    border-radius:18px;

    background:linear-gradient(
        135deg,
        #f72585,
        #7209b7
    );

    display:flex;

    justify-content:center;

    align-items:center;

    font-size:38px;

    font-weight:800;

    color:white;

    margin:auto;

    margin-bottom:18px;

}

/* User */

.user-name{

    text-align:center;

    font-size:30px;

    font-weight:700;

    color:white;

}

.user-email{

    text-align:center;

    color:#4cc9f0;

    margin-bottom:30px;

}

/* Grid */

.info-grid{

    display:grid;

    grid-template-columns:1fr 1fr;

    gap:20px;

}

/* Information Box */

.info-grid>div{

    background:rgba(255,255,255,.04);

    border-radius:14px;

    padding:15px;

    border-left:4px solid #4cc9f0;

}

/* Labels */

.profile-label{

    font-size:11px;

    text-transform:uppercase;

    letter-spacing:1px;

    color:#9fb2d4;

    margin-bottom:6px;

}

/* Values */

.profile-value{

    font-size:17px;

    font-weight:600;

    color:white;

}

/* Skill Badges */

.badge-custom{

    display:inline-block;

    background:linear-gradient(
        90deg,
        #4361ee,
        #7209b7
    );

    color:white;

    padding:8px 18px;

    border-radius:50px;

    margin:6px;

    font-size:14px;

    font-weight:700;

}

/* Buttons */

.btn-purple{

    background:linear-gradient(
        90deg,
        #f72585,
        #7209b7
    );

    border:none;

    color:white;

    border-radius:12px;

    padding:12px 22px;

    font-weight:700;

    transition:.3s;

}

.btn-purple:hover{

    transform:translateY(-2px);

    box-shadow:0 12px 24px rgba(247,37,133,.35);

}

.btn-dark2{

    background:rgba(255,255,255,.06);

    border:1px solid rgba(255,255,255,.15);

    color:white;

    border-radius:12px;

    padding:12px 22px;

}

.btn-dark2:hover{

    background:rgba(255,255,255,.12);

    color:white;

}

/* Responsive */

@media(max-width:768px){

.info-grid{

grid-template-columns:1fr;

}

.profile-container{

width:95%;

}

.profile-card{

padding:25px;

}

}
    </style>

    <body>

        <jsp:include page="/views/common/navbar.jsp"/>

        <div class="profile-container">

            <h1 class="page-title">

                My Profile

            </h1>

            <p class="page-subtitle">

                Welcome back! Manage your HackHub profile.

            </p>

            <div class="profile-card">

                <div class="text-center">

                    <div class="avatar">

                        <%= user.getName().substring(0, 1).toUpperCase()%>

                    </div>

                    <h2 class="user-name">

                        <%= user.getName()%>

                    </h2>

                    <p class="user-email">

                        <%= user.getEmail()%>

                    </p>

                </div>

                <hr style="border-color:rgba(255,255,255,.08);">

                <div class="info-grid">

                    <div>

                        <div class="profile-label">

                            College

                        </div>

                        <div class="profile-value">

                            <%= user.getCollege()%>

                        </div>

                    </div>

                    <div>

                        <div class="profile-label">

                            Region

                        </div>

                        <div class="profile-value">

                            <%= user.getRegion()%>

                        </div>

                    </div>

                    <div>

                        <div class="profile-label">

                            Availability

                        </div>

                        <div class="profile-value">

                            <%= user.getAvailability()%>

                        </div>

                    </div>

                    <div>

                        <div class="profile-label">

                            Email

                        </div>

                        <div class="profile-value">

                            <%= user.getEmail()%>

                        </div>

                    </div>

                </div>

                <hr style="border-color:rgba(255,255,255,.08);">

                <h4 style="color:#FACC15;">

                    Skills

                </h4>

                <div class="mt-3">

                    <span class="badge-custom">

                        <%= user.getSkills()%>

                    </span>

                </div>

                <br>

                <h4 style="color:#EC4899;">

                    Interests

                </h4>

                <div class="mt-3">

                    <span class="badge-custom">

                        <%= user.getInterests()%>

                    </span>

                </div>

                <br>
                <div class="row mt-4">

                    <div class="col-md-4">

                        <div class="card text-center p-4"
                             style="background:#20273c;border:none;border-radius:20px;">

                            <h2 style="color:#60A5FA;">1</h2>

                            <p class="text-light">

                                Teams Joined

                            </p>

                        </div>

                    </div>

                    <div class="col-md-4">

                        <div class="card text-center p-4"
                             style="background:#20273c;border:none;border-radius:20px;">

                            <h2 style="color:#FACC15;">0</h2>

                            <p class="text-light">

                                Projects

                            </p>

                        </div>

                    </div>

                    <div class="col-md-4">

                        <div class="card text-center p-4"
                             style="background:#20273c;border:none;border-radius:20px;">

                            <h2 style="color:#EC4899;">0</h2>

                            <p class="text-light">

                                Hackathons

                            </p>

                        </div>

                    </div>

                </div>

                <hr style="border-color:rgba(255,255,255,.08);" class="my-4">

                <div class="d-flex justify-content-center flex-wrap gap-3">

                    <a
                        href="<%=request.getContextPath()%>/dashboard"
                        class="btn btn-primary">

                        <i class="bi bi-speedometer2"></i>

                        Dashboard

                    </a>

                    <a
                        href="<%=request.getContextPath()%>/teams"
                        class="btn btn-success">

                        <i class="bi bi-people-fill"></i>

                        Teams

                    </a>

                    <a
                        href="<%=request.getContextPath()%>/teamForm"
                        class="btn btn-warning text-dark">

                        <i class="bi bi-plus-circle-fill"></i>

                        Create Team

                    </a>

                    <a
                        href="<%=request.getContextPath()%>/logout"
                        class="btn btn-danger">

                        <i class="bi bi-box-arrow-right"></i>

                        Logout

                    </a>

                </div>

            </div>

        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    </body>

</html>