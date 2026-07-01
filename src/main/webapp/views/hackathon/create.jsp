<%@ page contentType="text/html;charset=UTF-8" %>

<%@ page import="com.hackhub.model.Admin" %>

<%
    Admin admin
            = (Admin) session.getAttribute("admin");

    if (admin == null) {

        response.sendRedirect(
                request.getContextPath()
                + "/views/admin/login.jsp");

        return;
    }
%>
<html>
    <head>
        <title>Add Hackathon</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
              rel="stylesheet">
        <link rel="stylesheet"
              href="<%= request.getContextPath()%>/css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>

    </head>
    <style>.form-card{

            width:700px;

            max-width:95%;

            background:rgba(255,255,255,.05);

            backdrop-filter:blur(16px);

            border:1px solid rgba(255,255,255,.12);

            border-radius:22px;

            padding:35px;

            box-shadow:0 18px 40px rgba(0,0,0,.45);

            position:relative;

            overflow:hidden;

        }
        .form-group{

            margin-bottom:20px;

        }
        .form-card::before{

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

            animation:rainbow 4s linear infinite;

        }

        @keyframes rainbow{

            from{

                background-position:0%;

            }

            to{

                background-position:200%;

            }

        }
        .form-group input,
        .form-group textarea,
        .form-group select{

            width:100%;

            padding:13px 15px;

            background:#20263b;

            color:white;

            border:1px solid rgba(255,255,255,.15);

            border-radius:12px;

            font-size:15px;

            transition:.3s;

            box-sizing:border-box;

        }
        .form-group textarea{

            height:120px;

            resize:none;

        }
        .form-title{

            text-align:center;

            font-size:34px;

            color:#facc15;

            margin-bottom:10px;

        }

        .form-subtitle{

            text-align:center;

            color:#94a3b8;

            margin-bottom:30px;

        }
        .btn-create{

            width:220px;

            height:52px;

            display:block;

            margin:35px auto 0;

            border:none;

            border-radius:30px;

            background:linear-gradient(
                90deg,
                #f72585,
                #7209b7
                );

            color:white;

            font-size:18px;

            font-weight:bold;

        }
        .form-group label{

            display:block;

            margin-bottom:8px;

            color:#FBBF24;

            font-size:14px;

            font-weight:600;

        }

        .form-group input,
        .form-group textarea,
        .form-group select{

            width:100%;

            padding:12px 15px;

            background:rgba(255,255,255,.08);

            border:1px solid rgba(255,255,255,.15);

            border-radius:12px;

            color:white;

            outline:none;

            transition:.3s;

            font-size:15px;

            box-sizing:border-box;

        }

        .form-group input:focus,
        .form-group textarea:focus,
        .form-group select:focus{

            border-color:#4cc9f0;

            box-shadow:0 0 15px rgba(76,201,240,.35);

        }

        .form-group textarea{

            min-height:120px;

            resize:vertical;

        }

        .form-group input::placeholder,
        .form-group textarea::placeholder{

            color:#94a3b8;

        }

        .form-group select{

            cursor:pointer;

        }

        .form-group option{

            background:#111827;

            color:white;

        }
        .form-container{

            width:100%;

            min-height:calc(100vh - 70px);

            display:flex;

            justify-content:center;

            align-items:flex-start;

            padding:50px 20px;

        }
    </style>
    <body>

        <jsp:include page="/views/common/navbar.jsp"/>

        <div class="form-container">

            <div class="form-card">

                <h2 class="form-title">

                    <i class="bi bi-trophy-fill"></i>

                    Add Hackathon

                </h2>

                <p class="form-subtitle">

                    Create a new hackathon for students.

                </p>


                <div class="form-container">

                    <div class="form-card">

                        <form action="<%=request.getContextPath()%>/addHackathon"
                              method="post">

                            <div class="form-group">

                                <label>Hackathon Title</label>

                                <input
                                    type="text"
                                    name="title"
                                    placeholder="Enter Hackathon Title"
                                    required>

                            </div>

                            <div class="form-group">

                                <label>Description</label>

                                <textarea
                                    name="description"
                                    rows="4"
                                    placeholder="Enter Description"
                                    required></textarea>

                            </div>

                            <div class="form-group">

                                <label>Organizer</label>

                                <input
                                    type="text"
                                    name="organizer"
                                    required>

                            </div>

                            <div class="form-group">

                                <label>Location</label>

                                <input
                                    type="text"
                                    name="location"
                                    required>

                            </div>

                            <div class="form-group">

                                <label>Region</label>

                                <input
                                    type="text"
                                    name="region"
                                    required>

                            </div>


                            

                            <div class="form-group">

                                <label>Start Date</label>

                                <input
                                    type="date"
                                    name="startDate"
                                    required>

                            </div>

                            <div class="form-group">

                                <label>End Date</label>

                                <input
                                    type="date"
                                    name="endDate"
                                    required>

                            </div><div class="form-group">

                                <label>Registration Deadline</label>

                                <input
                                    type="date"
                                    name="registrationDeadline"
                                    required>

                            </div>

                            <div class="form-group">

                                <label>Status</label>

                                <select name="status">

                                    <option>ongoing</option>

                                    <option>Upcoming</option>

                                    <option>Closed</option>

                                </select>

                            </div><div class="form-group">

                                <label>

                                    Registration Link

                                </label>

                                <input
                                    type="url"
                                    name="registrationLink"
                                    placeholder="https://example.com/register"
                                    required>

                            </div>

                            <button
                                type="submit"
                                class="btn-create">

                                <i class="bi bi-plus-circle-fill"></i>

                                Create Hackathon

                            </button>

                        </form>


                    </div>

                </div>

            </div>

        </div>

    </body>
</html>