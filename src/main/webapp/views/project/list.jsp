<%@page contentType="text/html"%>
<%@page import="java.util.List"%>
<%@page import="com.hackhub.model.Project"%>

<html>
<head>
    <title>Projects</title>
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
<h2>All Projects</h2>

<%
List<Project> projects =
        (List<Project>)
        request.getAttribute("projects");

if(projects == null || projects.isEmpty()){
%>

<h3>No Projects Found</h3>

<%
}else{
%>

<table class="table table-striped table-bordered">

<tr>
    <th>Project ID</th>
    <th>Title</th>
    <th>Description</th>
    <th>Domain</th>
    <th>College</th>
    <th>Region</th>
    <th>Status</th>
    <th>Action</th>
</tr>

<%
for(Project project : projects){
%>

<tr>
    <td><%= project.getProjectId() %></td>
    <td><%= project.getTitle() %></td>
    <td><%= project.getDescription() %></td>
    <td><%= project.getDomain() %></td>
    <td><%= project.getCollege() %></td>
    <td><%= project.getRegion() %></td>
    <td><%= project.getStatus() %></td>

    <td>
        <a href="<%= request.getContextPath() %>/sendRequest?projectId=<%= project.getProjectId() %>" class="btn btn-primary">
            Request Collaboration
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

<a href="<%= request.getContextPath() %>/views/project/create.jsp" class="btn btn-primary">
    Create Project
</a>

</body>
</html>