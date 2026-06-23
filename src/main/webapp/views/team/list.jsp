<%@page contentType="text/html"%>
<%@page import="java.util.List"%>
<%@page import="com.hackhub.model.Team"%>

<html>
<head>
    <title>Teams</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">
    <link rel="stylesheet"
      href="<%= request.getContextPath() %>/css/style.css">
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
}
</style>
<body>
<body>
<jsp:include page="/views/common/navbar.jsp" />
<h2>All Teams</h2>

<%
List<Team> teams =
        (List<Team>) request.getAttribute("teams");

if (teams == null || teams.isEmpty()) {
%>

<h3>No Teams Found</h3>

<%
} else {
%>

<table class="table table-striped table-bordered">

<tr>
    <th>Team ID</th>
    <th>Team Name</th>
    <th>Hackathon Name</th>
    <th>Leader Name</th>
    <th>Action</th>
    <th>Members</th>
</tr>

<%
for (Team team : teams) {
%>

<tr>
    <td><%= team.getTeamId() %></td>
    <td><%= team.getTeamName() %></td>
    <td><%= team.getHackathonName() %></td>
    <td><%= team.getLeaderName() %></td>

    <td>
        <a href="<%= request.getContextPath() %>/joinTeam?teamId=<%= team.getTeamId() %>" class="btn btn-primary">
            Join Team
        </a>
    </td>
    <td>
    <a href="<%= request.getContextPath() %>/teamMembers?teamId=<%= team.getTeamId() %>" class="btn btn-primary">
        View Members
    </a>
    </td>
</tr>

<%
}
%>

</table>

<%
}
%>

<br><br>

<a href="<%= request.getContextPath() %>/views/team/create.jsp">
    Create Team
</a>

<br><br>

<a href="<%= request.getContextPath() %>/views/student/profile.jsp">
    Back to Profile
</a>

</body>
</html>