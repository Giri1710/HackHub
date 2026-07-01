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

                font-family:'Segoe UI',sans-serif;
            }

            /* Page */

            .members-container{

                max-width:950px;

                margin:40px auto;

                padding:20px;

            }

            /* Glass Card */

            .card{

                position:relative;

                overflow:hidden;

                background:rgba(255,255,255,.05);

                backdrop-filter:blur(16px);

                border:1px solid rgba(255,255,255,.12);

                border-radius:22px;

                box-shadow:0 18px 40px rgba(0,0,0,.45);

                transition:.35s;

            }

            .card::before{

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

            .card:hover{

                transform:translateY(-6px);

                box-shadow:0 24px 45px rgba(114,9,183,.35);

            }

            /* Animation */

            @keyframes gradShift{

                0%{

                    background-position:0% 50%;

                }

                100%{

                    background-position:200% 50%;

                }

            }

            /* Header */

            .card-header{

                background:transparent;

                border-bottom:1px solid rgba(255,255,255,.08);

                color:#f72585;

                font-size:28px;

                font-weight:800;

                padding:22px;

            }

            /* Body */

            .card-body{

                color:white;

                padding:25px;

            }

            /* Table */

            .table{

                color:white;

                margin-bottom:0;

            }

            .table th{

                background:rgba(255,255,255,.08);

                color:#4cc9f0;

                text-transform:uppercase;

                font-size:12px;

                letter-spacing:1px;

                border:none;

            }

            .table td{

                background:transparent;

                border-color:rgba(255,255,255,.08);

                vertical-align:middle;

            }

            .table tbody tr{

                transition:.3s;

            }

            .table tbody tr:hover{

                background:rgba(255,255,255,.05);

            }

            /* Avatar */

            .member-avatar{

                width:48px;

                height:48px;

                border-radius:14px;

                display:flex;

                justify-content:center;

                align-items:center;

                font-weight:700;

                color:white;

                background:linear-gradient(
                    135deg,
                    #f72585,
                    #7209b7
                    );

            }

            /* Button */

            .btn-back{

                background:linear-gradient(
                    90deg,
                    #4361ee,
                    #7209b7
                    );

                color:white;

                border:none;

                border-radius:12px;

                padding:10px 22px;

                font-weight:700;

                transition:.3s;

            }

            .btn-back:hover{

                transform:translateY(-2px);

                box-shadow:0 12px 24px rgba(67,97,238,.35);

            }
        </style>


    </head>

    <body>

        <jsp:include page="/views/common/navbar.jsp" />

        <%
            List<TeamMember> members
                    = (List<TeamMember>) request.getAttribute("members");
        %>

        <div class="container mt-4">

            <%
                if (members == null || members.isEmpty()) {
            %>

            <div class="card shadow-lg">


                <div class="card-body">

                    <h3>No Members Found</h3>

                </div>


            </div>

            <%
            } else {
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
                                for (TeamMember member : members) {
                            %>

                            <tr>


                                <td>
                                    <%= member.getName()%>
                                </td>

                                <td>
                                    <%= member.getEmail()%>
                                </td>

                                <td>
                                    <%= member.getCollege()%>
                                </td>

                                <td>


                                    <%
                                        if ("Leader".equalsIgnoreCase(member.getRole())) {
                                    %>

                                    <span class="badge bg-danger">
                                        Leader
                                    </span>

                                    <%
                                    } else {
                                    %>

                                    <span class="badge bg-success">
                                        Member
                                    </span>

                                    <%
                                        }
                                    %>


                                </td>

                                <td>

                                    <a href="mailto:<%= member.getEmail()%>"
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

            <a href="<%= request.getContextPath()%>/teams"
               class="btn btn-light">


                Back To Teams


            </a>

        </div>

    </body>

</html>
