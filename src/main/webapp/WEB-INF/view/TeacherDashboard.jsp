<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Teacher Dashboard</title>

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
    width:250px;
    height:100vh;
    position:fixed;
    top:0;
    left:0;
    background:linear-gradient(180deg,#1e293b,#0f172a);
    padding-top:20px;
    transition:0.3s;
    z-index:1000;
}

/* HIDDEN (MOBILE DEFAULT) */
@media(max-width:768px){
    .sidebar{
        left:-250px;
    }
}

/* SHOW SIDEBAR */
.sidebar.show{
    left:0;
}

.sidebar h3{
    text-align:center;
    margin-bottom:30px;
}

.sidebar a{
    display:flex;
    align-items:center;
    gap:10px;
    padding:12px 20px;
    color:#cbd5f5;
    text-decoration:none;
}

.sidebar a:hover{
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
    justify-content:space-between;
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

/* CARDS */
.card{
    border:none;
    border-radius:18px;
    background:rgba(255,255,255,0.05);
    backdrop-filter:blur(12px);
    color:white;
    transition:0.3s;
}

.card:hover{
    transform:translateY(-6px);
}

/* ICON */
.icon-box{
    font-size:30px;
    margin-bottom:10px;
}

/* BUTTON */
.btn-custom{
    border-radius:25px;
}

</style>

</head>
<body>

<!-- OVERLAY -->
<div class="overlay" onclick="toggleSidebar()"></div>

<!-- SIDEBAR -->
<div class="sidebar">
    <h3>🎓 Teacher</h3>

    <a href="<%=request.getContextPath()%>/teacher/addPerformance">
        <i class="fa-solid fa-chart-line"></i> Add Prediction
    </a>

    <a href="<%=request.getContextPath()%>/teacher/viewPerformance">
        <i class="fa-solid fa-users"></i> View Students
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

    <h5>Dashboard</h5>

</div>

<!-- MAIN -->
<div class="main">

    <h2 class="mb-4">Welcome Teacher 👋</h2>

    <div class="row g-4">

        <div class="col-12 col-sm-6 col-md-4">
            <div class="card p-4 text-center">
                <div class="icon-box text-warning">
                    <i class="fa-solid fa-plus"></i>
                </div>
                <h4>Add Student</h4>
                <p>Create new student record</p>
                <a href="<%=request.getContextPath()%>/teacher/addPerformance" class="btn btn-warning btn-custom">Open</a>
            </div>
        </div>

        <div class="col-12 col-sm-6 col-md-4">
            <div class="card p-4 text-center">
                <div class="icon-box text-info">
                    <i class="fa-solid fa-eye"></i>
                </div>
                <h4>View Students</h4>
                <p>See all records</p>
                <a href="<%=request.getContextPath()%>/teacher/viewPerformance" class="btn btn-info btn-custom">Open</a>
            </div>
        </div>

        <div class="col-12 col-sm-6 col-md-4">
            <div class="card p-4 text-center">
                <div class="icon-box text-secondary">
                    <i class="fa-solid fa-comments"></i>
                </div>
                <h4>Enquiry</h4>
                <p>Student messages</p>
                <a href="<%=request.getContextPath()%>/teacher/enquiry" class="btn btn-secondary btn-custom">Open</a>
            </div>
        </div>

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