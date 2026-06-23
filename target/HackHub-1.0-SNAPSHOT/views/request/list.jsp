<%@page contentType="text/html"%>
<%@page import="java.util.List"%>
<%@page import="com.hackhub.model.Request"%>

<html>
<head>
    <title>Requests</title>
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
<h2>All Requests</h2>

<%
List<Request> requests =
        (List<Request>)
        request.getAttribute("requests");

if(requests == null || requests.isEmpty()){
%>

<h3>No Requests Found</h3>

<%
}else{
%>

<table class="table table-striped table-bordered">

<tr>
    <th>Request ID</th>
    <th>Sender ID</th>
    <th>Receiver ID</th>
    <th>Request Type</th>
    <th>Team ID</th>
    <th>Project ID</th>
    <th>Message</th>
    <th>Status</th>
    <th>Action</th>
</tr>

<%
for(Request req : requests){
%>

<tr>
    <td><%= req.getRequestId() %></td>
    <td><%= req.getSenderId() %></td>
    <td><%= req.getReceiverId() %></td>
    <td><%= req.getRequestType() %></td>
    <td><%= req.getTeamId() %></td>
    <td><%= req.getProjectId() %></td>
    <td><%= req.getMessage() %></td>
    <td><%= req.getStatus() %></td>
    <td>

    <a href="<%= request.getContextPath() %>/acceptRequest?requestId=<%= req.getRequestId() %>" class="btn btn-primary">
        Accept
    </a>

    |

    <a href="<%= request.getContextPath() %>/rejectRequest?requestId=<%= req.getRequestId() %>" class="btn btn-primary">
        Reject
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

<a href="<%= request.getContextPath() %>/projects">
    Back to Projects
</a>

</body>
</html>