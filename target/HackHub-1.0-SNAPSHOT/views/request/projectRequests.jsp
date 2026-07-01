<%@page contentType="text/html"%>
<%@page import="java.util.List"%>
<%@page import="com.hackhub.model.Request"%>

<html>

    <head>

        <title>Project Requests</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
              rel="stylesheet">

        <link rel="stylesheet"
              href="<%=request.getContextPath()%>/assets/css/theme.css">

        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

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

            .page-container{

                max-width:1200px;

                margin:40px auto;

                padding:20px;

            }

            .page-title{

                color:#06d6a0;

                font-size:38px;

                font-weight:bold;

                margin-bottom:25px;

            }

            .request-card{

                background:rgba(255,255,255,.05);

                backdrop-filter:blur(16px);

                border-radius:20px;

                padding:25px;

                border-top:4px solid #06d6a0;

                border-bottom:4px solid #4cc9f0;

            }

            .table{

                color:white !important;

            }

            .table th{

                color:#4cc9f0;

                background:rgba(255,255,255,.08);

            }

            .table td{

                color:white;

                background:rgba(255,255,255,.03);

            }

            .table tbody tr:hover{

                background:rgba(67,97,238,.15);

            }

            .btn-accept{

                background:linear-gradient(
                    90deg,
                    #06d6a0,
                    #4cc9f0
                    );

                color:black;

                border:none;

                border-radius:10px;

                font-weight:bold;

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

                font-weight:bold;

            }

        </style>

    </head>

    <body>

        <jsp:include page="/views/common/navbar.jsp"/>

        <div class="page-container">

            <h2 class="page-title">

                <i class="bi bi-kanban-fill"></i>

                Project Collaboration Requests

            </h2>

            <div class="request-card">

                <%

                    List<Request> requests
                            = (List<Request>) request.getAttribute("requests");

                    if (requests == null || requests.isEmpty()) {

                %>

                <h4 class="text-center text-warning">

                    No Project Requests Found

                </h4>

                <%} else {

                %>

                <table class="table">

                    <tr>

                        <th>ID</th>

                        <th>Sender</th>

                        <th>Receiver</th>

                        <th>Project ID</th>

                        <th>Message</th>

                        <th>Status</th>

                        <th>Action</th>

                    </tr>

                    <%    for (Request req : requests) {

                    %>

                    <tr>

                        <td><%=req.getRequestId()%></td>

                        <td><%=req.getSenderId()%></td>

                        <td><%=req.getReceiverId()%></td>

                        <td><%=req.getProjectId()%></td>

                        <td><%=req.getMessage()%></td>

                        <td><%=req.getStatus()%></td>
                        <td>

                            <%
                                if ("Pending".equalsIgnoreCase(req.getStatus())) {
                            %>

                            <a href="<%=request.getContextPath()%>/acceptProjectRequest?requestId=<%=req.getRequestId()%>"
                               class="btn btn-accept">
                                Accept
                            </a>

                            <a href="<%=request.getContextPath()%>/rejectProjectRequest?requestId=<%=req.getRequestId()%>"
                               class="btn btn-reject">
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
                                <%= req.getStatus()%>
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

                <%    }

                %>

            </div>

        </div>

    </body>

</html>