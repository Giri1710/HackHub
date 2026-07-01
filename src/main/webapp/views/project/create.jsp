<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <title>Create Project</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
              rel="stylesheet">
        <link rel="stylesheet"
              href="<%= request.getContextPath()%>/css/style.css">
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

            font-family:'Segoe UI',sans-serif;
        }

        /* Form Container */

        .form-container{

            width:100%;

            min-height:calc(100vh - 70px);

            display:flex;

            justify-content:center;

            align-items:center;

            padding:40px 20px;
        }

        /* Glass Card */

        .form-card{

            width:650px;

            max-width:92%;

            position:relative;

            overflow:hidden;

            background:rgba(255,255,255,.05);

            backdrop-filter:blur(16px);

            border:1px solid rgba(255,255,255,.12);

            border-radius:22px;

            padding:35px;

            box-shadow:0 18px 40px rgba(0,0,0,.45);

            transition:.35s;
        }

        /* Animated Rainbow Border */

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

        .form-card:hover{

            transform:translateY(-6px);

            box-shadow:0 24px 45px rgba(114,9,183,.35);

        }

        /* Titles */

        .form-title{

            text-align:center;

            font-size:34px;

            font-weight:800;

            color:#f72585;

            margin-bottom:8px;
        }

        .form-subtitle{

            text-align:center;

            color:#9fb2d4;

            margin-bottom:28px;

            font-size:15px;
        }

        /* Form Fields */

        .form-group{

            margin-bottom:20px;
        }

        .form-group label{

            display:block;

            margin-bottom:8px;

            font-size:12px;

            text-transform:uppercase;

            letter-spacing:1px;

            color:#c7d2fe;

            font-weight:700;
        }

        .form-group input,
        .form-group textarea,
        .form-group select{

            width:100%;

            padding:12px 15px;

            border-radius:12px;

            border:1px solid #252d4a;

            background:#10131f;

            color:white;

            transition:.3s;
        }

        .form-group textarea{

            resize:none;

            min-height:110px;
        }

        .form-group input::placeholder,
        .form-group textarea::placeholder{

            color:#7d8aa8;
        }

        .form-group input:focus,
        .form-group textarea:focus,
        .form-group select:focus{

            outline:none;

            border-color:#4cc9f0;

            box-shadow:0 0 18px rgba(76,201,240,.35);

        }

        .form-group select option{

            background:#10131f;

            color:white;
        }

        /* Button */

        .btn-create{

            width:100%;

            height:50px;

            margin-top:25px;

            border:none;

            border-radius:12px;

            background:linear-gradient(
                90deg,
                #f72585,
                #7209b7
                );

            color:white;

            font-size:17px;

            font-weight:700;

            transition:.3s;
        }

        .btn-create:hover{

            transform:translateY(-2px);

            box-shadow:0 12px 24px rgba(247,37,133,.35);

        }

        /* Back Link */

        .back-link{

            margin-top:22px;

            text-align:center;
        }

        .back-link a{

            color:#4cc9f0;

            text-decoration:none;

            font-weight:600;

            transition:.3s;
        }

        .back-link a:hover{

            color:#06d6a0;
        }

        /* Responsive */

        @media(max-width:768px){

            .form-card{

                width:95%;

                padding:25px;

            }

        }
    </style>

    <body>
        <jsp:include page="/views/common/navbar.jsp" />


        <div class="form-container">

            <div class="form-card">

                <h2 class="form-title">

                    💻 Create Project

                </h2>

                <p class="form-subtitle">

                    Share your innovative idea with the HackHub community

                </p>

                <form action="${pageContext.request.contextPath}/createProject"
                      method="post">

                    <div class="form-group">
                        <label>Title:</label>
                        <input type="text"
                               name="title"
                               required>
                    </div>

                    <div class="form-group">
                        <label>Description:</label>
                        <textarea name="description"
                                  rows="4"
                                  required></textarea>
                    </div>

                    <div class="form-group">
                        <label>Domain:</label>
                        <input type="text"
                               name="domain"
                               required>
                    </div>

                    <div class="form-group">
                        <label>College:</label>
                        <input type="text"
                               name="college"
                               required>
                    </div>

                    <div class="form-group">
                        <label>Region:</label>
                        <input type="text"
                               name="region"
                               required>
                    </div>

                    <div class="form-group">
                        <label>Status:</label>

                        <select name="status">
                            <option value="Idea">Idea</option>
                            <option value="In Progress">In Progress</option>
                            <option value="Completed">Completed</option>
                        </select>
                    </div>

                    <div class="form-group-btn">

                        <button
                            type="submit"
                            class="btn-create">

                            🚀 Create Project

                        </button>
                    </div>

                </form>
                <div class="back-link">

                    <a href="<%=request.getContextPath()%>/projects">

                        ← Back to Projects

                    </a>

                </div>

            </div>

        </div>
    </form>

</body>
</html>