<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.hackhub.model.User" %>
<%@ page import="com.hackhub.model.User" %>

<%@ page import="com.hackhub.model.User" %>

<%
User user =
    (User) session.getAttribute("loggedUser");

if(user == null){

    response.sendRedirect(
        request.getContextPath()
        + "/views/auth/login.jsp"
    );

    return;
}
%>
<%
out.println(
    "loggedUser = " +
    session.getAttribute("loggedUser")
);
%>

<!DOCTYPE html>
<html>
<head>
    <title>My Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">
    <link rel="stylesheet"
      href="<%= request.getContextPath() %>/css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
        
</head>
<style>

</style>
<body>
<body>
<jsp:include page="/views/common/navbar.jsp" />
<h1>Welcome to HackHub</h1>

<h2>User Profile</h2>

<hr>

<p>
<b>Name:</b>
<%= user.getName() %>
</p>

<p>
<b>Email:</b>
<%= user.getEmail() %>
</p>

<p>
<b>College:</b>
<%= user.getCollege() %>
</p>

<p>
<b>Region:</b>
<%= user.getRegion() %>
</p>

<p>
<b>Skills:</b>
<%= user.getSkills() %>
</p>

<p>
<b>Interests:</b>
<%= user.getInterests() %>
</p>

<p>
<b>Availability:</b>
<%= user.getAvailability() %>
</p>

<br>
<br><br>

<a href="${pageContext.request.contextPath}/views/team/create.jsp" class="btn btn-primary">
    Create Team
</a>

<br><br>

<a href="${pageContext.request.contextPath}/teams" class="btn btn-primary">
    View Teams
</a>
    
<a href="<%= request.getContextPath() %>/dashboard" class="btn btn-primary">
    Dashboard
</a>

<a href="../../logout" class="btn btn-primary">
    Logout
</a>

</body>
</html>