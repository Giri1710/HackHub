<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

    <title>HackHub Admin Login</title>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1">

    <!-- Bootstrap -->

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- Bootstrap Icons -->

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <style>

       /* ===========================
   BODY
=========================== */

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

    overflow:hidden;

    font-family:'Segoe UI',sans-serif;

    color:white;

}

/* ===========================
   Floating Background
=========================== */

.bg-circle{

    position:fixed;

    border-radius:50%;

    filter:blur(90px);

    opacity:.18;

    z-index:-1;

    animation:float 8s ease-in-out infinite;

}

.circle1{

    width:280px;

    height:280px;

    background:#f72585;

    top:-80px;

    left:-80px;

}

.circle2{

    width:350px;

    height:350px;

    background:#4361ee;

    bottom:-100px;

    right:-100px;

    animation-delay:2s;

}

.circle3{

    width:220px;

    height:220px;

    background:#06d6a0;

    top:45%;

    left:55%;

    animation-delay:4s;

}

@keyframes float{

    0%{

        transform:translateY(0px);

    }

    50%{

        transform:translateY(-25px);

    }

    100%{

        transform:translateY(0px);

    }

}

/* ===========================
   LOGIN WRAPPER
=========================== */

.login-wrapper{

    width:100%;

    display:flex;

    justify-content:center;

    align-items:center;

    padding:25px;

}

/* ===========================
   LOGIN CARD
=========================== */

.login-card{

    position:relative;

    overflow:hidden;

    width:470px;

    max-width:95%;

    background:rgba(255,255,255,.05);

    backdrop-filter:blur(18px);

    border:1px solid rgba(255,255,255,.12);

    border-radius:24px;

    padding:38px;

    box-shadow:0 20px 45px rgba(0,0,0,.45);

    animation:fadeUp .8s ease;

}

.login-card:hover{

    transform:translateY(-6px);

    transition:.35s;

    box-shadow:0 30px 60px rgba(114,9,183,.35);

}

/* ===========================
   Rainbow Border
=========================== */

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

@keyframes fadeUp{

    from{

        opacity:0;

        transform:translateY(35px);

    }

    to{

        opacity:1;

        transform:translateY(0);

    }

}
/* ===========================
   LOGO
=========================== */

.logo{

    text-align:center;

    margin-bottom:28px;

    position:relative;

}

.logo::before{

    content:"";

    position:absolute;

    width:140px;

    height:140px;

    background:#7209b7;

    border-radius:50%;

    filter:blur(70px);

    opacity:.25;

    left:50%;

    top:-30px;

    transform:translateX(-50%);

    z-index:-1;

}

.logo i{

    font-size:70px;

    color:#4cc9f0;

    text-shadow:0 0 25px rgba(76,201,240,.8);

}

.logo h2{

    margin-top:10px;

    margin-bottom:10px;

    font-size:44px;

    font-weight:800;

    background:linear-gradient(
        90deg,
        #f72585,
        #7209b7,
        #4361ee
    );

    -webkit-background-clip:text;

    -webkit-text-fill-color:transparent;

}

.admin-badge{

    display:inline-block;

    padding:8px 22px;

    border-radius:25px;

    background:rgba(247,37,133,.12);

    border:1px solid rgba(247,37,133,.30);

    color:#f72585;

    font-size:12px;

    font-weight:700;

    letter-spacing:1px;

    margin-top:8px;

}

.subtitle{

    text-align:center;

    color:#94a3b8;

    margin-bottom:30px;

    font-size:15px;

}

/* ===========================
   LABELS
=========================== */

.form-label{

    color:#cbd5e1;

    font-size:12px;

    text-transform:uppercase;

    font-weight:700;

    letter-spacing:1px;

    margin-bottom:8px;

}

/* ===========================
   INPUT GROUP
=========================== */

.input-group{

    margin-top:8px;

}

.input-group-text{

    background:#10131f;

    color:#4cc9f0;

    border:1px solid #2b3350;

    border-right:none;

    border-radius:14px 0 0 14px;

    width:55px;

    justify-content:center;

}

.form-control{

    height:52px;

    background:#10131f;

    color:white;

    border:1px solid #2b3350;

    border-left:none;

    border-radius:0;

}

.form-control::placeholder{

    color:#94a3b8;

}

.form-control:focus{

    background:#10131f;

    color:white;

    border-color:#4cc9f0;

    box-shadow:0 0 15px rgba(76,201,240,.35);

}

.eye-btn{

    width:55px;

    background:#10131f;

    border:1px solid #2b3350;

    border-left:none;

    color:#94a3b8;

    border-radius:0 14px 14px 0;

}

.eye-btn:hover{

    color:#4cc9f0;

}

/* ===========================
   LOGIN BUTTON
=========================== */

.btn-login{

    width:100%;

    height:54px;

    margin-top:10px;

    border:none;

    border-radius:15px;

    background:linear-gradient(
        90deg,
        #f72585,
        #7209b7,
        #4361ee
    );

    color:white;

    font-size:18px;

    font-weight:700;

    transition:.35s;

    box-shadow:0 12px 28px rgba(114,9,183,.35);

}

.btn-login:hover{

    transform:translateY(-3px);

    box-shadow:0 20px 35px rgba(114,9,183,.50);

}

/* ===========================
   ALERT
=========================== */

.alert{

    border-radius:12px;

    border:none;

}

/* ===========================
   FOOTER
=========================== */

.bottom-text{

    text-align:center;

    margin-top:25px;

    color:#94a3b8;

}

.bottom-text a{

    color:#4cc9f0;

    text-decoration:none;

    font-weight:700;

}

.bottom-text a:hover{

    color:#f72585;

}

/* ===========================
   MOBILE
=========================== */

@media(max-width:576px){

    .login-card{

        padding:28px;

    }

    .logo h2{

        font-size:34px;

    }

}

    </style>

</head>

<body>

    <!-- Floating Background -->
    <div class="bg-circle circle1"></div>
    <div class="bg-circle circle2"></div>
    <div class="bg-circle circle3"></div>

    <div class="login-wrapper">

        <div class="login-card">

            <!-- Logo -->

            <div class="logo">

                <i class="bi bi-lightning-charge-fill"></i>

                <h2>HackHub</h2>

                <div class="admin-badge">

                    ADMINISTRATOR PORTAL

                </div>

            </div>

            <p class="subtitle">

                Secure access for HackHub administrators

            </p>

            <!-- Login Form -->

            <form action="<%=request.getContextPath()%>/adminLogin"
                  method="post">

                <!-- Username -->

                <div class="mb-4">

                    <label class="form-label">

                        Username

                    </label>

                    <div class="input-group">

                        <span class="input-group-text">

                            <i class="bi bi-person-fill"></i>

                        </span>

                        <input
                            type="text"
                            class="form-control"
                            name="username"
                            placeholder="Enter admin username"
                            autocomplete="username"
                            required>

                    </div>

                </div>

                <!-- Password -->

                <div class="mb-4">

                    <label class="form-label">

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
                            placeholder="Enter password"
                            autocomplete="current-password"
                            required>

                        <button
                            type="button"
                            class="btn eye-btn"
                            onclick="togglePassword()">

                            <i class="bi bi-eye-fill"
                               id="eyeIcon"></i>

                        </button>

                    </div>

                </div>

                <% if(request.getParameter("error") != null){ %>

                <div class="alert alert-danger text-center">

                    <i class="bi bi-exclamation-triangle-fill"></i>

                    Invalid username or password

                </div>

                <% } %>

                <button
                    type="submit"
                    class="btn-login">

                    <i class="bi bi-shield-lock-fill"></i>

                    Secure Login

                </button>

            </form>

            <div class="bottom-text">

                <a href="<%=request.getContextPath()%>/dashboard">

                    <i class="bi bi-arrow-left-circle-fill"></i>

                    Return to Dashboard

                </a>

            </div>

        </div>

    </div>

    <script>

        function togglePassword(){

            let password=document.getElementById("password");

            let eye=document.getElementById("eyeIcon");

            if(password.type==="password"){

                password.type="text";

                eye.className="bi bi-eye-slash-fill";

            }else{

                password.type="password";

                eye.className="bi bi-eye-fill";

            }

        }

    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>