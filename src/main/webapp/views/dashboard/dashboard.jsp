<%@page contentType="text/html"%>

<html>
<head>
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">
    <link rel="stylesheet"
      href="<%= request.getContextPath() %>/css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
        
</head>
<style>
    .dashboard-grid{
    display:flex;
    gap:20px;
    flex-wrap:wrap;
}

.dashboard-card{
    width:250px;
    height:130px;

    background:white;

    border-radius:15px;

    box-shadow:0 4px 10px rgba(0,0,0,0.15);

    padding:20px;

    transition:0.3s;
}

.dashboard-card:hover{
    transform:translateY(-5px);
}

.dashboard-card h4{
    color:#666;
    margin-bottom:15px;
}

.dashboard-card h1{
    color:#0d6efd;
    font-size:38px;
}
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

<jsp:include page="/views/common/navbar.jsp" />

<div class="container">

    <h1 class="page-title">
        HackHub Dashboard
    </h1>

    <div class="dashboard-grid">

    <div class="dashboard-card">
        <h4>Total Users</h4>
        <h1><%= request.getAttribute("userCount") %></h1>
    </div>

    <div class="dashboard-card">
        <h4>Total Teams</h4>
        <h1><%= request.getAttribute("teamCount") %></h1>
    </div>

    <div class="dashboard-card">
        <h4>Total Projects</h4>
        <h1><%= request.getAttribute("projectCount") %></h1>
    </div>

    <div class="dashboard-card">
        <h4>Total Requests</h4>
        <h1><%= request.getAttribute("requestCount") %></h1>
    </div>

</div>

</div>

</body>
</html>