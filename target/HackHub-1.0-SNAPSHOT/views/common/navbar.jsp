<%-- 
    Document   : navbar
    Created on : 16 Jun 2026, 10:19:26 am
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet"
              href="<%= request.getContextPath()%>/css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="navbar">

            <div class="logo">

            </div>

            <div class="nav-links">

                <a href="${pageContext.request.contextPath}/views/auth/register.jsp"
                   class="nav-btn" style="
                   display:inline-block;
                   padding:8px 16px;
                   border:1px solid #0d6efd;
                   color:#0d6efd;
                   background:white;
                   text-decoration:none;
                   border-radius:6px;
                   margin-right:10px;
                   font-weight:500;"
                   onmouseover="this.style.background = '#0d6efd';this.style.color = 'white';"
                   onmouseout="this.style.background = 'white';this.style.color = '#0d6efd';">
                    Register
                </a>

                <a class="nav-btn"
                   href="${pageContext.request.contextPath}/dashboard" style="
                   display:inline-block;
                   padding:8px 16px;
                   border:1px solid #0d6efd;
                   color:#0d6efd;
                   background:white;
                   text-decoration:none;
                   border-radius:6px;
                   margin-right:10px;
                   font-weight:500;"
                   onmouseover="this.style.background = '#0d6efd';this.style.color = 'white';"
                   onmouseout="this.style.background = 'white';this.style.color = '#0d6efd';">
                    Dashboard
                </a>

                <a class="nav-btn"
                   href="${pageContext.request.contextPath}/teams" style="
                   display:inline-block;
                   padding:8px 16px;
                   border:1px solid #0d6efd;
                   color:#0d6efd;
                   background:white;
                   text-decoration:none;
                   border-radius:6px;
                   margin-right:10px;
                   font-weight:500;"
                   onmouseover="this.style.background = '#0d6efd';this.style.color = 'white';"
                   onmouseout="this.style.background = 'white';this.style.color = '#0d6efd';">
                    Teams
                </a>

                <a class="nav-btn"
                   href="${pageContext.request.contextPath}/projects" style="
                   display:inline-block;
                   padding:8px 16px;
                   border:1px solid #0d6efd;
                   color:#0d6efd;
                   background:white;
                   text-decoration:none;
                   border-radius:6px;
                   margin-right:10px;
                   font-weight:500;"
                   onmouseover="this.style.background = '#0d6efd';this.style.color = 'white';"
                   onmouseout="this.style.background = 'white';this.style.color = '#0d6efd';">
                    Projects
                </a>

                <a class="nav-btn"
                   href="${pageContext.request.contextPath}/requests" style="
                   display:inline-block;
                   padding:8px 16px;
                   border:1px solid #0d6efd;
                   color:#0d6efd;
                   background:white;
                   text-decoration:none;
                   border-radius:6px;
                   margin-right:10px;
                   font-weight:500;"
                   onmouseover="this.style.background = '#0d6efd';this.style.color = 'white';"
                   onmouseout="this.style.background = 'white';this.style.color = '#0d6efd';">
                    Requests
                </a>

                <a class="nav-btn"
                   href="${pageContext.request.contextPath}/myRequests" style="
                   display:inline-block;
                   padding:8px 16px;
                   border:1px solid #0d6efd;
                   color:#0d6efd;
                   background:white;
                   text-decoration:none;
                   border-radius:6px;
                   margin-right:10px;
                   font-weight:500;"
                   onmouseover="this.style.background = '#0d6efd';this.style.color = 'white';"
                   onmouseout="this.style.background = 'white';
                           this.style.color = '#0d6efd';">
                    My Requests
                </a>

                <a class="nav-btn"
                   href="${pageContext.request.contextPath}/views/student/profile.jsp" style="
                   display:inline-block;
                   padding:8px 16px;
                   border:1px solid #0d6efd;
                   color:#0d6efd;
                   background:white;
                   text-decoration:none;
                   border-radius:6px;
                   margin-right:10px;
                   font-weight:500;"
                   onmouseover="this.style.background = '#0d6efd';
                           this.style.color = 'white';"
                   onmouseout="this.style.background = 'white';
                           this.style.color = '#0d6efd';">
                    Profile
                </a>

                <a class="nav-btn logout-btn"
                   href="${pageContext.request.contextPath}/logout" style="
                   display:inline-block;
                   padding:8px 16px;
                   border:1px solid #0d6efd;
                   color:#0d6efd;
                   background:white;
                   text-decoration:none;
                   border-radius:6px;
                   margin-right:10px;
                   font-weight:500;"
                   onmouseover="this.style.background = '#0d6efd';
                           this.style.color = 'white';"
                   onmouseout="this.style.background = 'white';
                           this.style.color = '#0d6efd';">
                    Logout
                </a>

                <a href="${pageContext.request.contextPath}/views/hackathon/create.jsp"
                   class="nav-btn logout-btn" style="
                   display:inline-block;
                   padding:8px 16px;
                   border:1px solid #0d6efd;
                   color:#0d6efd;
                   background:white;
                   text-decoration:none;
                   border-radius:6px;
                   margin-right:10px;
                   font-weight:500;"
                   onmouseover="this.style.background = '#0d6efd';
                           this.style.color = 'white';"
                   onmouseout="this.style.background = 'white';
                           this.style.color = '#0d6efd';">
                    Add Hackathon
                </a>
                <a href="${pageContext.request.contextPath}/hackathons"
                   class="nav-btn logout-btn" style="
                   display:inline-block;
                   padding:8px 16px;
                   border:1px solid #0d6efd;
                   color:#0d6efd;
                   background:white;
                   text-decoration:none;
                   border-radius:6px;
                   margin-right:10px;
                   font-weight:500;"
                   onmouseover="this.style.background = '#0d6efd';
                           this.style.color = 'white';"
                   onmouseout="this.style.background = 'white';
                           this.style.color = '#0d6efd';">
                    View Hackathons
                </a>

                <a href="${pageContext.request.contextPath}/teamForm"
                   class="nav-btn" style="
                   display:inline-block;
                   padding:8px 16px;
                   border:1px solid #0d6efd;
                   color:#0d6efd;
                   background:white;
                   text-decoration:none;
                   border-radius:6px;
                   margin-right:10px;
                   font-weight:500;"
                   onmouseover="this.style.background = '#0d6efd';
                           this.style.color = 'white';"
                   onmouseout="this.style.background = 'white';
                           this.style.color = '#0d6efd';">
                    create team for hackathon
                </a>
                <a href="${pageContext.request.contextPath}/teamRequests"
                   class="btn btn-outline-warning" style="
                   display:inline-block;
                   padding:8px 16px;
                   border:1px solid #0d6efd;
                   color:#0d6efd;
                   background:white;
                   text-decoration:none;
                   border-radius:6px;
                   margin-right:10px;
                   font-weight:500;"
                   onmouseover="this.style.background = '#0d6efd';
                           this.style.color = 'white';"
                   onmouseout="this.style.background = 'white';
                           this.style.color = '#0d6efd';">
                    Team Requests
                </a>
            </div>

        </div>
        <script src="<%= request.getContextPath()%>/css/app.js"></script>
    </body>
</html>
