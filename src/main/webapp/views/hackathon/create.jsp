<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
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

.form-container{
    display:flex;
    justify-content:center;
    align-items:center;
    min-height:85vh;
}

.form-card{
    width:550px;
    background:white;
    color:black;
    padding:30px;
    border:2px solid black;
    border-radius:20px;
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
    width:170px;
    font-weight:bold;
}

.form-group input,
.form-group textarea,
.form-group select{
    flex:1;
    padding:10px;
    border:1px solid #ccc;
    border-radius:8px;
}

.form-group textarea{
    height:80px;
    resize:none;
}

.form-group-btn{
    text-align:center;
    margin-top:20px;
}
    </style>
    <body>
        <jsp:include page="/views/common/navbar.jsp" />
        <h2>Add New Hackathon</h2>

        <div class="form-container">

    <div class="form-card">

        <h2 class="form-title">
            Add New Hackathon
        </h2>

        <form action="${pageContext.request.contextPath}/addHackathon"
              method="post">

            <div class="form-group">
                <label>Title:</label>
                <input type="text" name="title" required>
            </div>

            <div class="form-group">
                <label>Description:</label>
                <textarea name="description"></textarea>
            </div>

            <div class="form-group">
                <label>Organizer:</label>
                <input type="text" name="organizer" required>
            </div>

            <div class="form-group">
                <label>Location(district):</label>
                <input type="text" name="location" required>
            </div>

            <div class="form-group">
                <label>Start Date:</label>
                <input type="date" name="startDate" required>
            </div>

            <div class="form-group">
                <label>End Date:</label>
                <input type="date" name="endDate" required>
            </div>

            <div class="form-group">
                <label>Region(state):</label>
                <input type="text" name="region">
            </div>

            <div class="form-group">
                <label>Registration Deadline:</label>
                <input type="date" name="registrationDeadline">
            </div>

            <div class="form-group">
                <label>Status:</label>
                <select name="status">
                    <option value="Upcoming">Upcoming</option>
                    <option value="Ongoing">Ongoing</option>
                    <option value="Completed">Completed</option>
                </select>
            </div>

            <div class="form-group-btn">
                <button type="submit"
                        class="btn btn-primary">
                    Add Hackathon
                </button>
            </div>

        </form>

    </div>

</div>

    </body>
</html>