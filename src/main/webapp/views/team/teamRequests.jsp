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

                font-family:'Segoe UI',sans-serif;

            }

            .page-container{

                max-width:1100px;

                margin:40px auto;

                padding:20px;

            }

            .page-title{

                font-size:38px;

                font-weight:800;

                color:#f72585;

                text-align:center;

                margin-bottom:30px;

            }

            .request-card{

                position:relative;

                overflow:hidden;

                background:rgba(255,255,255,.05);

                backdrop-filter:blur(16px);

                border:1px solid rgba(255,255,255,.12);

                border-radius:22px;

                padding:25px;

                box-shadow:0 18px 40px rgba(0,0,0,.45);

            }

            .request-card::before{

                content:"";

                position:absolute;

                top:0;

                left:0;

                width:100%;

                height:4px;

                background:linear-gradient(
                    90deg,
                    #f72585,
                    #7209b7,
                    #4361ee,
                    #4cc9f0,
                    #06d6a0,
                    #f72585
                    );

                background-size:200% 100%;

                animation:gradShift 4s linear infinite;

            }

            @keyframes gradShift{

                0%{
                    background-position:0% 50%;
                }

                100%{
                    background-position:200% 50%;
                }

            }

            .table{

                color:white !important;

                background:transparent !important;

                border-color:rgba(255,255,255,.12);

            }

            .table thead th{

                background:rgba(255,255,255,.08) !important;

                color:#4cc9f0 !important;

                border-color:rgba(255,255,255,.12) !important;

                text-transform:uppercase;

                font-weight:700;

            }

            .table tbody tr{

                background:rgba(255,255,255,.04) !important;

            }

            .table tbody tr:nth-child(even){

                background:rgba(255,255,255,.07) !important;

            }

            .table tbody tr:hover{

                background:rgba(67,97,238,.18) !important;

            }

            .table td{

                color:white !important;

                background:transparent !important;

                border-color:rgba(255,255,255,.08) !important;

                vertical-align:middle;

            }

            .table th{

                color:#4cc9f0 !important;

            }

            .btn-accept{

                background:linear-gradient(
                    90deg,
                    #06d6a0,
                    #4cc9f0
                    );

                color:#0b0d17;

                border:none;

                border-radius:10px;

                font-weight:700;

                padding:8px 18px;

            }

            .btn-accept:hover{

                transform:translateY(-2px);

                box-shadow:0 10px 20px rgba(6,214,160,.35);

            }

            .btn-reject{

                background:linear-gradient(
                    90deg,
                    #ef233c,
                    #f72585
                    );

                color:white;

                border:none;

                border-radius:10px;

                font-weight:700;

                padding:8px 18px;

            }

            .btn-reject:hover{

                transform:translateY(-2px);

                box-shadow:0 10px 20px rgba(239,35,60,.35);

            }

            .empty-state{

                text-align:center;

                padding:60px;

                color:#9fb2d4;

            }

            .empty-state i{

                font-size:60px;

                color:#4cc9f0;

                margin-bottom:15px;

            }
        </style>
    </head>

    <body>

        <jsp:include page="/views/common/navbar.jsp" />

        <div class="container-box">

            <h2>Team Join Requests</h2>

            <%
                List<TeamRequest> requests
                        = (List<TeamRequest>) request.getAttribute("requests");

                if (requests == null || requests.isEmpty()) {
            %>

            <h3>No Team Requests Found</h3>

            <%
            } else {
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
                    for (TeamRequest req : requests) {
                %>

                <tr>
                    <td><%= req.getRequestId()%></td>
                    <td><%= req.getTeamId()%></td>
                    <td><%= req.getSenderId()%></td>
                    <td>
                        <%= req.getStatus()%>
                    </td>

                    <td>

                        <%
                            if ("Pending".equals(
                                    req.getStatus())) {
                        %>

                        <a href="<%= request.getContextPath()%>/acceptTeamRequest?requestId=<%= req.getRequestId()%>"
                           class="btn btn-success btn-sm">
                            Accept
                        </a>

                        <a href="<%= request.getContextPath()%>/rejectTeamRequest?requestId=<%= req.getRequestId()%>"
                           class="btn btn-danger btn-sm">
                            Reject
                        </a>

                        <%
} else if ("Accepted".equalsIgnoreCase(req.getStatus())) {
%>

<span class="badge bg-success">
    Accepted
</span>

<%
} else if ("Rejected".equalsIgnoreCase(req.getStatus())) {
%>

<span class="badge bg-danger">
    Rejected
</span>

<%
} else {
%>

<span class="badge bg-secondary">
    <%= req.getStatus() %>
</span>

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