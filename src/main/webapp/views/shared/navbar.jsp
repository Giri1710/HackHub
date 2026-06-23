<%-- 
    Document   : navbar
    Created on : 14 Jun 2026, 8:20:52 pm
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">
        <link rel="stylesheet"
      href="<%= request.getContextPath() %>/css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
        
    </head>
    <body>
        <jsp:include page="/views/common/navbar.jsp" />
        <a href="${pageContext.request.contextPath}/hackathons" class="nav-btn" style="
        display:inline-block;
        padding:10px 18px;
        background:#0d6efd;
        color:white;
        text-decoration:none;
        border-radius:6px;
        margin-right:10px;
        font-weight:bold;">
    Hackathons
</a>

<a href="${pageContext.request.contextPath}/views/student/profile.jsp" class="btn btn-primary">
    Profile
</a>

<a href="${pageContext.request.contextPath}/logout" class="btn btn-primary">
    Logout
</a>
    <a href="${pageContext.request.contextPath}/views/hackathon/create.jsp" class="btn btn-primary">
    Add Hackathon
</a>

<br><br>

<a href="${pageContext.request.contextPath}/hackathons" class="btn btn-primary">
    View Hackathons
</a><script src="<%= request.getContextPath() %>/css/app.js"></script>
    </body>
</html>
