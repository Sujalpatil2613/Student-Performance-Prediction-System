<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>Add User</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

<style>

/* ===== GLOBAL ===== */
body{
    margin:0;
    font-family:'Poppins',sans-serif;
}

/* ===== SIDEBAR ===== */
.sidebar{
    width:240px;
    height:100vh;
    position:fixed;
    left:0;
    background:linear-gradient(180deg,#0f2027,#203a43,#2c5364);
    color:#fff;
    padding-top:20px;
    transition:0.3s;
    z-index:1000;
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
    margin:5px 10px;
    color:#ccc;
    text-decoration:none;
    border-radius:8px;
}

.sidebar a:hover{
    background:rgba(255,255,255,0.15);
    color:#fff;
}

.sidebar a.active{
    background:rgba(0,198,255,0.2);
    color:#fff;
}

/* ===== TOPBAR ===== */
.topbar{
    margin-left:240px;
    height:60px;
    display:flex;
    align-items:center;
    padding:0 20px;
    background:#fff;
    box-shadow:0 2px 10px rgba(0,0,0,0.1);
}

/* MENU BUTTON */
.menu-btn{
    display:none;
}

/* ===== MAIN ===== */
.main-content{
    margin-left:240px;
    min-height:calc(100vh - 60px);
    display:flex;
    justify-content:center;
    align-items:center;

    background:
    linear-gradient(rgba(0,0,0,0.6),rgba(0,0,0,0.7)),
    url('https://images.unsplash.com/photo-1523240795612-9a054b0db644');

    background-size:cover;
    padding:20px;
}

/* ===== FORM ===== */
.form-container{
    width:100%;
    max-width:450px;
    padding:30px;
    border-radius:20px;
    background:rgba(255,255,255,0.08);
    backdrop-filter:blur(20px);
    color:#fff;
}

.form-container h2{
    text-align:center;
    margin-bottom:20px;
}

.input-group-text{
    background:transparent;
    border:1px solid rgba(255,255,255,0.5);
    color:#fff;
}

.form-control,
.form-select{
    background:transparent;
    border:1px solid rgba(255,255,255,0.5);
    color:#fff;
}

.form-control::placeholder{
    color:#ddd;
}

/* BUTTON */
.btn-primary{
    background:linear-gradient(45deg,#00c6ff,#0072ff);
    border:none;
}

/* ===== MOBILE ===== */
@media(max-width:768px){

    .menu-btn{
        display:block;
    }

    .sidebar{
        left:-240px;
    }

    .sidebar.active{
        left:0;
    }

    .topbar{
        margin-left:0;
    }

    .main-content{
        margin-left:0;
        padding:15px;
    }
}

</style>
</head>

<body>

<!-- SIDEBAR -->
<div class="sidebar">
    <h3><i class="bi bi-speedometer2"></i> Admin</h3>

    <a href="<c:url value='/admin/dashboard'/>"><i class="bi bi-house"></i> Dashboard</a>
    <a class="active"><i class="bi bi-person-plus"></i> Add User</a>
    <a href="<c:url value='/admin/viewUsers/TEACHER'/>"><i class="bi bi-person-video3"></i> Teachers</a>
    <a href="<c:url value='/admin/viewUsers/STUDENT'/>"><i class="bi bi-mortarboard"></i> Students</a>
</div>

<!-- TOPBAR -->
<div class="topbar">
    <button class="btn btn-dark me-2 menu-btn" onclick="toggleSidebar()">
        <i class="bi bi-list"></i>
    </button>
    <h5 class="fw-bold m-0">Add User</h5>
</div>

<!-- MAIN -->
<div class="main-content">

<div class="form-container">

<h2>Add User</h2>

<c:if test="${not empty success}">
    <div class="alert alert-success">${success}</div>
</c:if>

<c:if test="${not empty error}">
    <div class="alert alert-danger">${error}</div>
</c:if>

<form action="<c:url value='/admin/addUser'/>" method="post">

<div class="mb-3 input-group">
<span class="input-group-text"><i class="bi bi-person"></i></span>
<input type="text" name="name" class="form-control" placeholder="Full Name" required>
</div>

<div class="mb-3 input-group">
<span class="input-group-text"><i class="bi bi-envelope"></i></span>
<input type="email" name="email" class="form-control" placeholder="Email Address" required>
</div>

<div class="mb-3 input-group">
<span class="input-group-text"><i class="bi bi-telephone"></i></span>
<input type="text" name="phone" class="form-control" placeholder="Phone Number">
</div>

<div class="mb-3 input-group">
<span class="input-group-text"><i class="bi bi-lock"></i></span>
<input type="password" name="password" class="form-control" placeholder="Password" required>
</div>

<div class="mb-3">
<select name="role" class="form-select">
<option value="TEACHER">Teacher</option>
<option value="STUDENT">Student</option>
</select>
</div>

<button type="submit" class="btn btn-primary w-100">
<i class="bi bi-check-circle"></i> Add User
</button>

</form>

</div>
</div>

<script>
function toggleSidebar(){
    document.querySelector(".sidebar").classList.toggle("active");
}
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>