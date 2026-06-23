<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
              rel="stylesheet">
        <link rel="stylesheet"
              href="<%= request.getContextPath()%>/css/style.css">
    </head>
    <style>
        .form-group{
            display:flex;
            align-items:center;
            margin-bottom:18px;
        }

        .form-group label{
            width:100px;
            font-weight:bold;
        }

        .form-group input{
            width:250px;

            padding:10px;

            border:1px solid #ccc;

            border-radius:8px;
        }

        .form-group-btn{
            text-align:center;
            margin-top:20px;
        }
        .auth-page{
            min-height:100vh;

            display:flex;

            justify-content:center;

            align-items:center;
        }

        .form-card{

            width:450px;

            background:white;

            padding:30px;

            border:2px solid black;

            border-radius:20px;

            box-shadow:0px 5px 15px rgba(0,0,0,0.2);
        }
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
    </style>
    <body>
        <jsp:include page="/views/common/navbar.jsp" />


        <div class="auth-page">

            <div class="form-card">

                <h2 class="form-title">
                    Login
                </h2>

                <form action="${pageContext.request.contextPath}/login"
                      method="post">

                    ```
                    <div class="form-group">

                        <label>Email:</label>

                        <input type="email"
                               name="email"
                               required>

                    </div>

                    <div class="form-group">

                        <label>Password:</label>

                        <input type="password"
                               name="password"
                               required>

                    </div>

                    <div class="form-group-btn">

                        <button type="submit"
                                class="btn btn-primary">

                            Login

                        </button>

                    </div>
                    ```

                </form>

                </form>

            </div>

        </div>



    </body>
</html>