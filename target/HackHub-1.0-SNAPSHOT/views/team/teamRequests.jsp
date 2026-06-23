<%@page contentType="text/html"%>
<%@page import="java.util.List"%>
<%@page import="com.hackhub.model.TeamRequest"%>

<html>
<head>
    <title>Team Join Requests</title>

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

        .container-box{
            background:white;
            color:black;
            padding:20px;
            margin:30px;
            border-radius:20px;
        }
    </style>
</head>

<body>

<jsp:include page="/views/common/navbar.jsp" />

<div class="container-box">

<h2>Team Join Requests</h2>

<%
List<TeamRequest> requests =
        (List<TeamRequest>)
        request.getAttribute("requests");

if(requests == null || requests.isEmpty()){
%>

<h3>No Team Requests Found</h3>

<%
}else{
%>

<table class="table table-bordered table-striped">

<tr>
    <th>Request ID</th>
    <th>Team ID</th>
    <th>Sender ID</th>
    <th>Status</th>
    <th>Action</th>
</tr>

<%
for(TeamRequest req : requests){
%>

<tr>
    <td><%= req.getRequestId() %></td>
    <td><%= req.getTeamId() %></td>
    <td><%= req.getSenderId() %></td>
    <td>
    <%= req.getStatus() %>
</td>

<td>

<%
if("Pending".equals(
        req.getStatus())){
%>

<a href="<%= request.getContextPath() %>/acceptTeamRequest?requestId=<%= req.getRequestId() %>"
   class="btn btn-success btn-sm">
    Accept
</a>

<a href="<%= request.getContextPath() %>/rejectTeamRequest?requestId=<%= req.getRequestId() %>"
   class="btn btn-danger btn-sm">
    Reject
</a>

<%
}else{
%>

-

<%
}
%>

</td>
</tr>

<%
}
%>

</table>

<%
}
%>

</div>

</body>
</html>