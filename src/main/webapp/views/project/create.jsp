<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Create Project</title>
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
    min-height:85vh;
}

.form-card{
    width:600px;
    background:white;
    color:black;
    padding:30px;
    border-radius:20px;
    border:2px solid black;
    box-shadow:0px 5px 20px rgba(0,0,0,0.3);
}

.form-title{
    text-align:center;
    margin-bottom:25px;
    font-weight:bold;
}

.form-group{
    display:flex;
    align-items:center;
    margin-bottom:15px;
}

.form-group label{
    width:150px;
    font-weight:bold;
}

.form-group input,
.form-group select,
.form-group textarea{
    flex:1;
    padding:10px;
    border:1px solid #ccc;
    border-radius:8px;
}

.form-group textarea{
    resize:none;
}

.form-group-btn{
    text-align:center;
    margin-top:20px;
}

</style>
<body>
<body>
<jsp:include page="/views/common/navbar.jsp" />
<h2>Create Project</h2>

<form action="<%= request.getContextPath() %>/createProject"
      method="post">

    <div class="form-container">

    <div class="form-card">

        <h2 class="form-title">
            Create Project
        </h2>

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

                <button type="submit"
                        class="btn btn-primary">
                    Create Project
                </button>

            </div>

        </form>

    </div>

</div>
</form>

</body>
</html>