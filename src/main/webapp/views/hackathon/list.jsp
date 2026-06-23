<%@page contentType="text/html"%>
<%@page import="java.util.List"%>
<%@page import="com.hackhub.model.Hackathon"%>

<html>
<head>
    <title>Hackathons</title>

```
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<link rel="stylesheet"
      href="<%= request.getContextPath() %>/css/style.css">

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

    .filter-box{
        background:white;
        color:black;

        padding:20px;

        border-radius:15px;

        margin-bottom:20px;

        box-shadow:0px 4px 10px rgba(0,0,0,0.2);
    }

    .table-container{
        background:white;

        padding:20px;

        border-radius:15px;

        box-shadow:0px 4px 10px rgba(0,0,0,0.2);
    }

    h2{
        color:white;
        margin-bottom:20px;
    }

</style>
```

</head>

<body>

<jsp:include page="/views/common/navbar.jsp" />

<div class="container mt-4">

<h2>All Hackathons</h2>

<div class="filter-box">

<form action="${pageContext.request.contextPath}/hackathons"
      method="get">

```
<div class="row">

    <div class="col-md-4">

        <label>
            Region
        </label>

        <select name="region"
                class="form-select">

            <option value="">
                All Regions
            </option>

            <option value="Tamil Nadu">
                Tamil Nadu
            </option>

            <option value="Karnataka">
                Karnataka
            </option>

            <option value="Kerala">
                Kerala
            </option>

        </select>

    </div>

    <div class="col-md-4">

        <label>
            Status
        </label>

        <select name="status"
                class="form-select">

            <option value="">
                All Status
            </option>

            <option value="Upcoming">
                Upcoming
            </option>

            <option value="Ongoing">
                Ongoing
            </option>

            <option value="Completed">
                Completed
            </option>

        </select>

    </div>

    <div class="col-md-4 d-flex align-items-end">

        <button type="submit"
                class="btn btn-primary">

            Filter Hackathons

        </button>

    </div>

</div>
```

</form>

</div>

<%

List<Hackathon> hackathons =
(List<Hackathon>)
request.getAttribute(
"hackathons");

if(hackathons == null
|| hackathons.isEmpty()){
%>

<div class="alert alert-warning">

```
No Hackathons Found
```

</div>

<%

}else{
%>

<div class="table-container">

<table class="table table-striped table-bordered">

<tr>
    <th>Title</th>
    <th>Organizer</th>
    <th>Location</th>
    <th>Region</th>
    <th>Start Date</th>
    <th>Status</th>
</tr>

<%

for(Hackathon h : hackathons){
%>

<tr>

```
<td>
    <%= h.getTitle() %>
</td>

<td>
    <%= h.getOrganizer() %>
</td>

<td>
    <%= h.getLocation() %>
</td>

<td>
    <%= h.getRegion() %>
</td>

<td>
    <%= h.getStartDate() %>
</td>

<td>
    <%= h.getStatus() %>
</td>
```

</tr>

<%
}
%>

</table>

</div>

<%
}
%>

</div>

</body>
</html>
