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

    background:#0f1220;

    color:white;

    font-family:'Segoe UI',sans-serif;
}

.container-box{

    width:90%;

    max-width:1200px;

    margin:40px auto;
}

.section-title{

    color:#ff4db8;

    font-size:38px;

    font-weight:bold;

}

.section-subtitle{

    color:#9CA3AF;

    margin-bottom:35px;
}

.request-card{

    background:#1b2236;

    border-radius:20px;

    padding:25px;

    border:1px solid rgba(255,255,255,.08);

    box-shadow:0 12px 30px rgba(0,0,0,.30);

    margin-bottom:25px;

    transition:.3s;

    position:relative;

    overflow:hidden;
}

.request-card:hover{

    transform:translateY(-5px);
}

.request-card::before{

    content:"";

    position:absolute;

    top:0;

    left:0;

    width:100%;

    height:5px;

    background:linear-gradient(
        90deg,
        #4F6CFF,
        #33D1FF,
        #FF2EA6
    );
}

.request-title{

    color:white;

    font-size:22px;

    font-weight:bold;
}

.request-label{

    color:#94A3B8;

    font-size:13px;

    text-transform:uppercase;

    font-weight:bold;
}

.request-value{

    color:white;

    font-size:16px;

    margin-bottom:15px;
}

.status{

    padding:8px 18px;

    border-radius:30px;

    color:white;

    font-weight:bold;

    display:inline-block;
}

.pending{

    background:#2563EB;
}

.accepted{

    background:#22C55E;
}

.rejected{

    background:#EF4444;
}

.contact-box{

    background:#29324d;

    padding:10px;

    border-radius:12px;

    color:#FACC15;

    font-weight:bold;
}

.btn-dashboard{

    background:linear-gradient(
        90deg,
        #5B5FFF,
        #8B2FFF
    );

    color:white;

    border:none;

    border-radius:12px;

    padding:12px 28px;

    font-weight:bold;
}

.btn-dashboard:hover{

    color:white;
}
</style>

<body>

<jsp:include page="/views/common/navbar.jsp"/>

<div class="container-box">

<h1 class="section-title">

My Requests

</h1>

<p class="section-subtitle">

Track all collaboration requests in one place

</p>

<h3 style="color:#FACC15; margin-bottom:25px;">

My Sent Requests

</h3>

<%

List<Request> sentRequests =
(List<Request>)request.getAttribute("sentRequests");

if(sentRequests==null || sentRequests.isEmpty()){

%>

<div class="request-card">

<h4>No Sent Requests Yet</h4>

<p style="color:#94A3B8;">

Start collaborating by sending your first request.

</p>

</div>

<%

}else{

for(Request req:sentRequests){

String cls="pending";

if("Accepted".equalsIgnoreCase(req.getStatus())){

cls="accepted";

}

else if("Rejected".equalsIgnoreCase(req.getStatus())){

cls="rejected";

}

%>

<div class="request-card">

<h4 class="request-title">

Collaboration Request

</h4>

<div class="row mt-4">

<div class="col-md-6">

<div class="request-label">

Receiver ID

</div>

<div class="request-value">

<%=req.getReceiverId()%>

</div>

</div>

<div class="col-md-6">

<div class="request-label">

Request Type

</div>

<div class="request-value">

<%=req.getRequestType()%>

</div>

</div>

<div class="col-md-6">

<div class="request-label">

Status

</div>

<div class="request-value">

<span class="status <%=cls%>">

<%=req.getStatus()%>

</span>

</div>

</div>

<div class="col-md-6">

<div class="request-label">

Contact

</div>

<div class="contact-box">

<%

if("Accepted".equalsIgnoreCase(req.getStatus())){

out.print(req.getContactEmail());

}else{

out.print("Hidden until Accepted");

}

%>

</div>

</div>

</div>

</div>

<%

}

}

%>

<hr style="border-color:#2b344e;margin:45px 0;">

<h3 style="color:#33D1FF;margin-bottom:25px;">

 My Received Requests

</h3><%

List<Request> receivedRequests =
(List<Request>)request.getAttribute("receivedRequests");

if(receivedRequests==null || receivedRequests.isEmpty()){

%>

<div class="request-card">

<h4>No Received Requests</h4>

<p style="color:#94A3B8;">

No one has sent you a collaboration request yet.

</p>

</div>

<%

}else{

for(Request req:receivedRequests){

String cls="pending";

if("Accepted".equalsIgnoreCase(req.getStatus())){

cls="accepted";

}

else if("Rejected".equalsIgnoreCase(req.getStatus())){

cls="rejected";

}

%>

<div class="request-card">

<h4 class="request-title">

Incoming Collaboration

</h4>

<div class="row mt-4">

<div class="col-md-6">

<div class="request-label">

Sender ID

</div>

<div class="request-value">

<%=req.getSenderId()%>

</div>

</div>

<div class="col-md-6">

<div class="request-label">

Request Type

</div>

<div class="request-value">

<%=req.getRequestType()%>

</div>

</div>

<div class="col-md-6">

<div class="request-label">

Status

</div>

<div class="request-value">

<span class="status <%=cls%>">

<%=req.getStatus()%>

</span>

</div>

</div>

<div class="col-md-6">

<div class="request-label">

Contact Email

</div>

<div class="contact-box">

<%=req.getContactEmail()==null ?
"Not Available" :
req.getContactEmail()%>

</div>

</div>

</div>

</div>

<%

}

}

%>

<div class="text-center mt-5">

<a
href="<%=request.getContextPath()%>/dashboard"
class="btn btn-dashboard">

Back to Dashboard

</a>

</div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>