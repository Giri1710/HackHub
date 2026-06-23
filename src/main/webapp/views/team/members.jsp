<%@page contentType="text/html"%>
<%@page import="java.util.List"%>
<%@page import="com.hackhub.model.TeamMember"%>

<!DOCTYPE html>

<html>

<head>


<title>Team Members</title>

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
        color:white;
    }

    .card{
        border-radius:20px;
        overflow:hidden;
    }

    .card-header{
        border-radius:20px 20px 0 0 !important;
    }

</style>


</head>

<body>

<jsp:include page="/views/common/navbar.jsp" />

<%
List<TeamMember> members =
(List<TeamMember>) request.getAttribute("members");
%>

<div class="container mt-4">

<%
if(members == null || members.isEmpty()){
%>

<div class="card shadow-lg">


<div class="card-body">

    <h3>No Members Found</h3>

</div>


</div>

<%
}else{
%>

<div class="card shadow-lg">

<div class="card-header bg-primary text-white">

    <h3 class="mb-0">
        Team Members
    </h3>

</div>

<div class="card-body">

    <table class="table table-hover table-bordered">

        <thead class="table-dark">

            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>College</th>
                <th>Role</th>
                <th>Contact</th>
            </tr>

        </thead>

        <tbody>


<%
for(TeamMember member : members){
%>

<tr>


<td>
    <%= member.getName() %>
</td>

<td>
    <%= member.getEmail() %>
</td>

<td>
    <%= member.getCollege() %>
</td>

<td>


<%
if("Leader".equalsIgnoreCase(member.getRole())){
%>

<span class="badge bg-danger">
    Leader
</span>

<%
}else{
%>

<span class="badge bg-success">
    Member
</span>

<%
}
%>


</td>

<td>

    <a href="mailto:<%= member.getEmail() %>"
       class="btn btn-primary btn-sm">

        Contact

    </a>

</td>

</tr>

<%
}
%>


        </tbody>

    </table>

</div>


</div>

<%
}
%>

<br>

<a href="<%= request.getContextPath() %>/teams"
class="btn btn-light">


Back To Teams


</a>

</div>

</body>

</html>
