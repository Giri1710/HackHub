<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>

<html>

    <head>

        <title>HackHub - Register</title>

        <meta charset="UTF-8">

        <meta name="viewport"
              content="width=device-width, initial-scale=1">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
              rel="stylesheet">

        <link rel="stylesheet"
              href="<%=request.getContextPath()%>/css/theme.css">

        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

        <style>

            body{

                margin:0;

                min-height:100vh;

                display:flex;

                justify-content:center;

                align-items:center;

                padding:40px 20px;

                background:linear-gradient(
                    135deg,
                    #000000,
                    #0a0f2c,
                    #1e40af
                    );

                background-attachment:fixed;

                font-family:'Segoe UI',sans-serif;

                color:white;

            }

            /* Register Card */

            .register-card{

                position:relative;

                overflow:hidden;

                width:720px;

                max-width:92%;

                background:rgba(255,255,255,.05);

                backdrop-filter:blur(16px);

                border:1px solid rgba(255,255,255,.12);

                border-radius:22px;

                padding:35px;

                box-shadow:0 20px 45px rgba(0,0,0,.45);

                transition:.35s;

            }

            /* Animated Rainbow Border */

            .register-card::before{

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

            .register-card:hover{

                transform:translateY(-6px);

                box-shadow:0 25px 45px rgba(114,9,183,.35);

            }

            /* Logo */

            .logo{

                text-align:center;

                margin-bottom:18px;

            }

            .logo i{

                font-size:60px;

                color:#4cc9f0;

            }

            .logo h2{

                color:#f72585;

                font-size:38px;

                font-weight:800;

                margin-top:10px;

            }

            .subtitle{

                text-align:center;

                color:#9fb2d4;

                font-size:15px;

                margin-bottom:30px;

            }

            /* Labels */

            .form-label{

                font-size:12px;

                text-transform:uppercase;

                letter-spacing:1px;

                color:#c7d2fe;

                font-weight:700;

            }

            /* Inputs */

            .form-control,
            .form-select{

                background:#10131f;

                border:1px solid #252d4a;

                border-radius:12px;

                color:white;

                padding:12px;

                transition:.3s;

            }

            .form-control::placeholder{

                color:#7d8aa8;

            }

            .form-control:focus,
            .form-select:focus{

                background:#10131f;

                color:white;

                border-color:#4cc9f0;

                box-shadow:0 0 18px rgba(76,201,240,.35);

            }

            .form-select option{

                background:#10131f;

                color:white;

            }

            /* Register Button */

            .btn-register{

                width:100%;

                height:50px;

                margin-top:10px;

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

            .btn-register:hover{

                transform:translateY(-2px);

                box-shadow:0 12px 24px rgba(247,37,133,.35);

            }

            /* Login Link */

            .login-link{

                text-align:center;

                margin-top:22px;

            }

            .login-link a{

                color:#4cc9f0;

                text-decoration:none;

                font-weight:600;

                transition:.3s;

            }

            .login-link a:hover{

                color:#06d6a0;

            }

            /* Secondary Button */

            .btn-outline-light{

                background:rgba(255,255,255,.06);

                border:1px solid rgba(255,255,255,.15);

                color:white;

                border-radius:12px;

                transition:.3s;

            }

            .btn-outline-light:hover{

                background:rgba(255,255,255,.12);

                color:white;

            }

            /* Responsive */

            @media(max-width:768px){

                .register-card{

                    width:95%;

                    padding:25px;

                }

            }
        </style>

    </head>
    <body>

        <div class="register-card">

            <div class="logo">

                <i class="bi bi-lightning-charge-fill"></i>

                <h2>HackHub</h2>

            </div>

            <p class="subtitle">

                Create your account and start collaborating with developers.

            </p>

            <form action="<%=request.getContextPath()%>/register"

                  method="post">

                <div class="row">

                    <div class="col-md-6">

                        <div class="mb-3">

                            <label class="form-label">

                                Full Name

                            </label>

                            <input

                                type="text"

                                name="name"

                                class="form-control"

                                placeholder="Enter your full name"

                                required>

                        </div>

                    </div>

                    <div class="col-md-6">

                        <div class="mb-3">

                            <label class="form-label">

                                Email

                            </label>

                            <input

                                type="email"

                                name="email"

                                class="form-control"

                                placeholder="Enter email"

                                required>

                        </div>

                    </div>

                    <div class="col-md-6">

                        <div class="mb-3">

                            <label class="form-label">

                                Password

                            </label>

                            <div class="input-group">

                                <input

                                    type="password"

                                    id="password"

                                    name="password"

                                    class="form-control"

                                    placeholder="Password"

                                    required>

                                <button

                                    class="btn btn-outline-light"

                                    type="button"

                                    onclick="togglePassword()">

                                    <i class="bi bi-eye-fill"

                                       id="eyeIcon"></i>

                                </button>

                            </div>

                        </div>

                    </div>

                    <div class="col-md-6">

                        <div class="mb-3">

                            <label class="form-label">

                                College

                            </label>

                            <input

                                type="text"

                                name="college"

                                class="form-control"

                                placeholder="College Name"

                                required>

                        </div>

                    </div>

                    <div class="col-md-6">

                        <div class="mb-3">

                            <label class="form-label">

                                Region

                            </label>

                            <select

                                name="region"

                                class="form-select">

                                <option>Tamil Nadu</option>

                                <option>Karnataka</option>

                                <option>Kerala</option>

                                <option>Andhra Pradesh</option>

                                <option>Telangana</option>

                                <option>Maharashtra</option>

                            </select>

                        </div>

                    </div>

                    <div class="col-md-6">

                        <div class="mb-3">

                            <label class="form-label">

                                Availability

                            </label>

                            <select

                                name="availability"

                                class="form-select">

                                <option>Available</option>

                                <option>Busy</option>

                                <option>Weekends Only</option>

                            </select>

                        </div>

                    </div>

                    <div class="col-md-6">

                        <div class="mb-3">

                            <label class="form-label">

                                Skills

                            </label>

                            <input

                                type="text"

                                name="skills"

                                class="form-control"

                                placeholder="Java, Python, React...">

                        </div>

                    </div>

                    <div class="col-md-6">

                        <div class="mb-3">

                            <label class="form-label">

                                Interested Domain

                            </label>

                            <input

                                type="text"

                                name="interests"

                                class="form-control"

                                placeholder="AI, Cloud, Web...">

                        </div>

                    </div>

                </div>
                <div class="col-12">

                    <button

                        type="submit"

                        class="btn btn-primary btn-register">

                        <i class="bi bi-person-plus-fill"></i>

                        Create Account

                    </button>
                    <div class="login-link">

                        Already have an account?

                        <a href="<%=request.getContextPath()%>/views/auth/login.jsp">

                            Login Here

                        </a>

                    </div>
                </div>

        </div>

    </form>



</div>

<script>

    function togglePassword() {

        var password = document.getElementById("password");

        var eye = document.getElementById("eyeIcon");

        if (password.type === "password") {

            password.type = "text";

            eye.className = "bi bi-eye-slash-fill";

        } else {

            password.type = "password";

            eye.className = "bi bi-eye-fill";

        }

    }

</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>