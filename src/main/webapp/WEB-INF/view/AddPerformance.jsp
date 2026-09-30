<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Performance</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>

/* GLOBAL */
body{
    margin:0;
    font-family:'Segoe UI',sans-serif;
    background:#0f172a;
    color:white;
}

/* SIDEBAR */
.sidebar{
    height:100vh;
    width:250px;
    position:fixed;
    top:0;
    left:0;
    background:linear-gradient(180deg,#1e293b,#0f172a);
    transition:0.3s;
    z-index:1000;
}

/* MOBILE HIDE */
@media(max-width:768px){
    .sidebar{
        left:-250px;
    }
}

/* SHOW */
.sidebar.show{
    left:0;
}

.sidebar h3{
    text-align:center;
    padding:20px;
}

.sidebar a{
    display:flex;
    align-items:center;
    gap:10px;
    padding:12px 20px;
    color:#cbd5f5;
    text-decoration:none;
}

.sidebar a:hover,.sidebar a.active{
    background:#1d4ed8;
    color:white;
    border-radius:8px;
}

/* OVERLAY */
.overlay{
    position:fixed;
    width:100%;
    height:100%;
    background:rgba(0,0,0,0.5);
    display:none;
    z-index:999;
}

.overlay.active{
    display:block;
}

/* TOPBAR */
.topbar{
    margin-left:250px;
    height:60px;
    display:flex;
    align-items:center;
    gap:10px;
    padding:0 20px;
    background:#1e293b;
}

@media(max-width:768px){
    .topbar{
        margin-left:0;
    }
}

/* MAIN */
.main{
    margin-left:250px;
    padding:30px;
}

@media(max-width:768px){
    .main{
        margin-left:0;
        padding:15px;
    }
}

/* FORM CARD */
.form-container{
    max-width:520px;
    margin:auto;
    padding:25px;
    border-radius:18px;
    background:rgba(255,255,255,0.05);
    backdrop-filter:blur(12px);
}

/* INPUT */
.input-group-text{
    background:rgba(255,255,255,0.1);
    border:none;
    color:white;
}

.form-control{
    background:rgba(255,255,255,0.1) !important;
    border:none !important;
    color:white !important;
}

/* BUTTON */
.btn-custom{
    border-radius:25px;
}

/* TITLE */
.page-title{
    text-align:center;
    margin-bottom:20px;
}

</style>

</head>

<body>

<!-- OVERLAY -->
<div class="overlay" onclick="toggleSidebar()"></div>

<!-- SIDEBAR -->
<div class="sidebar">
    <h3>🎓 Teacher</h3>

    <a href="<%=request.getContextPath()%>/teacher/dashboard">
        <i class="fa-solid fa-house"></i> Dashboard
    </a>

    <a href="#" class="active">
        <i class="fa-solid fa-plus"></i> Add Performance
    </a>

    <a href="<%=request.getContextPath()%>/teacher/viewPerformance">
        <i class="fa-solid fa-table"></i> View Performance
    </a>

    <a href="<%=request.getContextPath()%>/teacher/enquiry">
        <i class="fa-solid fa-envelope"></i> Enquiry
    </a>

    <a href="<%=request.getContextPath()%>/logout">
        <i class="fa-solid fa-right-from-bracket"></i> Logout
    </a>
</div>

<!-- TOPBAR -->
<div class="topbar">
    <button class="btn btn-primary d-md-none" onclick="toggleSidebar()">
        <i class="fa fa-bars"></i>
    </button>
    <h5>Add Performance</h5>
</div>

<!-- MAIN -->
<div class="main">

    <h2 class="page-title">📊 Add Student Performance</h2>

    <div class="form-container">

        <form action="<%=request.getContextPath()%>/teacher/savePerformance" method="post">

            <div class="input-group mb-3">
                <span class="input-group-text"><i class="fa fa-user"></i></span>
                <input type="text" name="studentName" class="form-control" placeholder="Student Name" required>
            </div>

            <div class="input-group mb-3">
                <span class="input-group-text"><i class="fa fa-calendar-check"></i></span>
                <input type="number" name="attendance" class="form-control" placeholder="Attendance %" required>
            </div>

            <div class="input-group mb-3">
                <span class="input-group-text"><i class="fa fa-chart-bar"></i></span>
                <input type="number" name="marks" class="form-control" placeholder="Previous Marks" required>
            </div>

            <div class="input-group mb-3">
                <span class="input-group-text"><i class="fa fa-clock"></i></span>
                <input type="number" name="studyHours" class="form-control" placeholder="Study Hours" required>
            </div>

            <div class="input-group mb-4">
                <span class="input-group-text"><i class="fa fa-users"></i></span>
                <input type="number" name="participation" class="form-control" placeholder="Participation" required>
            </div>

            <button type="submit" class="btn btn-success w-100 btn-custom">
                <i class="fa fa-save"></i> Save Performance
            </button>

        </form>

    </div>

</div>

<!-- JS -->
<script>
function toggleSidebar(){
    document.querySelector(".sidebar").classList.toggle("show");
    document.querySelector(".overlay").classList.toggle("active");
}
</script>

</body>
</html>