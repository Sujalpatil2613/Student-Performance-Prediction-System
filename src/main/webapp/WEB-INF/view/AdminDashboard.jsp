<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

<style>

body{
    margin:0;
    font-family:'Poppins',sans-serif;
}

/* ===== SIDEBAR ===== */
.sidebar{
    height:100vh;
    width:250px;
    position:fixed;
    top:0;
    left:0;
    background:rgba(20,30,48,0.9);
    backdrop-filter:blur(10px);
    color:white;
    padding-top:20px;
    transition:0.3s;
    z-index:1000;
}

.sidebar h3{
    text-align:center;
    margin-bottom:40px;
}

.sidebar a{
    display:flex;
    align-items:center;
    gap:10px;
    padding:15px 25px;
    color:#ccc;
    text-decoration:none;
    transition:0.3s;
    border-left:4px solid transparent;
}

.sidebar a:hover{
    background:rgba(255,255,255,0.08);
    color:#fff;
    border-left:4px solid #00c6ff;
}

/* ACTIVE */
.sidebar a.active{
    background:rgba(0,198,255,0.15);
    border-left:4px solid #00c6ff;
    color:#fff;
}

/* ===== OVERLAY ===== */
.overlay{
    position:fixed;
    top:0;
    left:0;
    width:100%;
    height:100%;
    background:rgba(0,0,0,0.6);
    display:none;
    z-index:999;
}

.overlay.active{
    display:block;
}

/* ===== TOPBAR ===== */
.topbar{
    margin-left:250px;
    height:65px;
    display:flex;
    align-items:center;
    padding:0 20px;
    background:rgba(255,255,255,0.9);
    backdrop-filter:blur(10px);
    box-shadow:0 2px 10px rgba(0,0,0,0.1);
}

.menu-btn{
    display:none;
}

/* ===== MAIN ===== */
.main-content{
    margin-left:250px;
    height:calc(100vh - 65px);
    overflow-y:auto;
}

/* HERO */
.header-image{
    height:100%;
    background:
    linear-gradient(rgba(0,0,0,0.6),rgba(0,0,0,0.7)),
    url('https://images.unsplash.com/photo-1523240795612-9a054b0db644');

    background-size:cover;
    background-position:center;
    display:flex;
    align-items:center;
    justify-content:center;
    text-align:center;
}

.header-text h1{
    font-size:50px;
    color:#fff;
    font-weight:700;
}

.header-text p{
    font-size:20px;
    color:#ddd;
}

/* ===== MOBILE ===== */
@media(max-width:768px){

    .sidebar{
        left:-250px;
    }

    .sidebar.show{
        left:0;
    }

    .topbar{
        margin-left:0;
        justify-content:space-between;
    }

    .main-content{
        margin-left:0;
    }

    .menu-btn{
        display:block;
    }
}

</style>
</head>

<body>

<div class="overlay" onclick="toggleSidebar()"></div>

<!-- SIDEBAR -->
<div class="sidebar">
    <h3><i class="bi bi-speedometer2"></i> Admin</h3>

    <a class="active"><i class="bi bi-house-door"></i> Dashboard</a>
    <a href="<c:url value='/admin/addUser'/>"><i class="bi bi-person-plus"></i> Add User</a>
    <a href="<c:url value='/admin/viewUsers/TEACHER'/>"><i class="bi bi-person-video3"></i> Teachers</a>
    <a href="<c:url value='/admin/viewUsers/STUDENT'/>"><i class="bi bi-mortarboard"></i> Students</a>
    <a href="<%=request.getContextPath()%>/logout"><i class="bi bi-box-arrow-right"></i> Logout</a>
</div>

<!-- TOPBAR -->
<div class="topbar">
    <button class="btn btn-dark menu-btn" onclick="toggleSidebar()">
        <i class="bi bi-list"></i>
    </button>

    <h5 class="m-0 fw-bold">Admin Dashboard</h5>
</div>

<!-- MAIN -->
<div class="main-content">
    <div class="header-image">
        <div class="header-text">
            <h1>Welcome Admin</h1>
            <p>Manage Users, Teachers & Students Easily</p>
        </div>
    </div>
</div>

<script>
function toggleSidebar(){
    document.querySelector(".sidebar").classList.toggle("show");
    document.querySelector(".overlay").classList.toggle("active");
}
</script>

</body>
</html>