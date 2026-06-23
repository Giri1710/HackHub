<%@page contentType="text/html"%>
<%@page import="java.util.List"%>
<%@page import="com.hackhub.model.Request"%>

<html>
<head>
    <title>My Requests</title>
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
<h2>My Sent Requests</h2>

<%
List<Request> sentRequests =
        (List<Request>)
        request.getAttribute(
                "sentRequests");

if(sentRequests == null
        || sentRequests.isEmpty()){
%>

<h3>No Sent Requests</h3>

<%
}else{
%>

<table class="table table-striped table-bordered">

<tr>
    <th>Request ID</th>
    <th>Receiver ID</th>
    <th>Request Type</th>
    <th>Status</th>
    <th>Contact Email</th>
</tr>

<%
for(Request req : sentRequests){
%>

<tr>
    <td><%= req.getRequestId() %></td>
    <td><%= req.getReceiverId() %></td>
    <td><%= req.getRequestType() %></td>
    <td><%= req.getStatus() %></td>
    <td>

<%
if("Accepted".equals(
        req.getStatus())){
%>

<%= req.getContactEmail() %>

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

<hr>

<h2>My Received Requests</h2>

<%
List<Request> receivedRequests =
        (List<Request>)
        request.getAttribute(
                "receivedRequests");

if(receivedRequests == null
        || receivedRequests.isEmpty()){
%>

<h3>No Received Requests</h3>

<%
}else{
%>

<table class="table table-striped table-bordered">

<tr>
    <th>Request ID</th>
    <th>Sender ID</th>
    <th>Request Type</th>
    <th>Status</th>
    <th>Contact Email</th>
</tr>

<%
for(Request req : receivedRequests){
%>

<tr>
    <td><%= req.getRequestId() %></td>
    <td><%= req.getSenderId() %></td>
    <td><%= req.getRequestType() %></td>
    <td><%= req.getStatus() %></td>
    <td>
    <%= req.getContactEmail() == null
            ? "-"
            : req.getContactEmail() %>
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

<a href="<%= request.getContextPath() %>/dashboard" class="btn btn-primary">
    Back to Dashboard
</a>

</body>
</html>