<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Register - HackHub</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">
    <link rel="stylesheet"
      href="<%= request.getContextPath() %>/css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
        
</head>
<style>
    
    .form-container{
    display:flex;
    justify-content:center;
    align-items:center;
    min-height:80vh;
}

form{
    width:500px;
    background:white;
    padding:30px;

    border:3px solid black;

    border-radius:20px;

    box-shadow:0 5px 15px rgba(0,0,0,0.1);
}

.form-group{
    display:flex;
    align-items:center;
    margin-bottom:15px;
}

.form-group label{
    width:120px;
    font-weight:bold;
}

.form-group input{
    width:250px;
    padding:8px;
    border:1px solid #ccc;
    border-radius:8px;
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

<div class="form-container">
<form action="${pageContext.request.contextPath}/register"
      method="post">


<h2 class="form-title">
    Register Form
</h2>

<div class="form-group">
    <label>Name:</label>
    <input type="text" name="name">
</div>

<div class="form-group">
    <label>Email:</label>
    <input type="email" name="email">
</div>

<div class="form-group">
    <label>Password:</label>
    <input type="password" name="password">
</div>

<div class="form-group">
    <label>College:</label>
    <input type="text" name="college">
</div>

<div class="form-group">
    <label>Region:</label>
    <input type="text" name="region">
</div>

<div class="form-group">
    <label>Skills:</label>
    <input type="text" name="skills">
</div>

<div class="form-group">
    <label>Interest in which domain:</label>
    <input type="text" name="interests">
</div>

<div class="form-group">
    <label>Availability (yes/no):</label>
    <input type="text" name="availability">
</div>

<div class="form-group-btn">
    <button type="submit" class="btn btn-primary">
        Register
    </button>
</div>

</form>

</div>

</body>
</html>