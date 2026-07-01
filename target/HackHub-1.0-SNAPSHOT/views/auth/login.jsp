<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>

    <head>

        <title>HackHub - Login</title>

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

            /* Login Card */

            .login-card{

                position:relative;

                overflow:hidden;

                width:430px;

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

            .login-card::before{

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

            .login-card:hover{

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

                font-size:36px;

                font-weight:800;

                margin-top:10px;

            }

            /* Subtitle */

            .subtitle{

                text-align:center;

                color:#9fb2d4;

                margin-bottom:28px;

                font-size:15px;

            }

            /* Labels */

            .form-label{

                font-size:12px;

                text-transform:uppercase;

                letter-spacing:1px;

                color:#c7d2fe;

                font-weight:700;

            }

            /* Input Group */

            .input-group{

                margin-bottom:20px;

            }

            .input-group-text{

                background:#10131f;

                color:#4cc9f0;

                border:1px solid #252d4a;

                border-right:none;

            }

            .form-control{

                height:48px;

                background:#10131f;

                color:white;

                border:1px solid #252d4a;

                border-left:none;

                border-radius:0 12px 12px 0;

            }

            .form-control::placeholder{

                color:#7d8aa8;

            }

            .form-control:focus{

                background:#10131f;

                color:white;

                border-color:#4cc9f0;

                box-shadow:0 0 18px rgba(76,201,240,.35);

            }

            /* Button */

            .btn-login{

                width:100%;

                height:50px;

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

            .btn-login:hover{

                transform:translateY(-2px);

                box-shadow:0 12px 24px rgba(247,37,133,.35);

            }

            /* Register Link */

            .register-link{

                margin-top:22px;

                text-align:center;

            }

            .register-link a{

                color:#4cc9f0;

                text-decoration:none;

                font-weight:600;

                transition:.3s;

            }

            .register-link a:hover{

                color:#06d6a0;

            }

        </style>

    </head>
<body>

    <div class="login-card">

        <div class="logo">

            <i class="bi bi-lightning-charge-fill"></i>

            <h2>HackHub</h2>

        </div>

        <p class="subtitle">
            Welcome Back! Login to continue.
        </p>

        <form action="${pageContext.request.contextPath}/login"
              method="post">

            <!-- Email -->

            <div class="mb-3">

                <label class="form-label">

                    <i class="bi bi-envelope-fill"></i>

                    Email Address

                </label>

                <div class="input-group">

                    <span class="input-group-text">

                        <i class="bi bi-envelope-fill"></i>

                    </span>

                    <input
                        type="email"
                        class="form-control"
                        name="email"
                        placeholder="Enter your email"
                        autocomplete="email"
                        required>

                </div>

            </div>

            <!-- Password -->

            <div class="mb-3">

                <label class="form-label">

                    <i class="bi bi-lock-fill"></i>

                    Password

                </label>

                <div class="input-group">

                    <span class="input-group-text">

                        <i class="bi bi-lock-fill"></i>

                    </span>

                    <input
                        type="password"
                        class="form-control"
                        id="password"
                        name="password"
                        placeholder="Enter your password"
                        autocomplete="current-password"
                        required>

                    <button
                        class="btn input-group-text"
                        type="button"
                        style="border-left:none;background:#10131f;color:#4cc9f0;"
                        onclick="togglePassword()">

                        <i class="bi bi-eye-fill"
                           id="eyeIcon"></i>

                    </button>

                </div>

            </div>

            <!-- Remember -->

            <div class="form-check mb-4">

                <input
                    class="form-check-input"
                    type="checkbox"
                    id="rememberMe">

                <label
                    class="form-check-label"
                    for="rememberMe">

                    Remember Me

                </label>

            </div>

            <!-- Login Button -->

            <button
                type="submit"
                class="btn-login"
                style="
                    width:100%;
                    height:52px;
                    border:none;
                    border-radius:14px;
                    background:linear-gradient(90deg,#f72585,#7209b7,#4361ee);
                    color:white;
                    font-size:18px;
                    font-weight:700;
                    box-shadow:0 8px 20px rgba(114,9,183,.35);">

                <i class="bi bi-box-arrow-in-right"></i>

                Login

            </button>

        </form>

        <div class="register-link">

            Don't have an account?

            <a href="<%=request.getContextPath()%>/views/auth/register.jsp">

                Register Here

            </a>

        </div>

    </div>

    <script>

        function togglePassword() {

            let password = document.getElementById("password");

            let eye = document.getElementById("eyeIcon");

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