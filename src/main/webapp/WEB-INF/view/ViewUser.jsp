<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>View Users</title>

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

/* ===== MENU BUTTON (HIDE DESKTOP) ===== */
.menu-btn{
    display:none;
}

/* ===== MAIN ===== */
.main{
    margin-left:240px;
    min-height:calc(100vh - 60px);
    overflow-y:auto;

    background:
    linear-gradient(rgba(0,0,0,0.6),rgba(0,0,0,0.7)),
    url('https://images.unsplash.com/photo-1523240795612-9a054b0db644');

    background-size:cover;
    display:flex;
    justify-content:center;
    align-items:center;
    padding:20px;
}

/* ===== CARD ===== */
.card-box{
    width:95%;
    max-width:1000px;
    padding:25px;
    border-radius:20px;
    background:rgba(255,255,255,0.08);
    backdrop-filter:blur(15px);
    box-shadow:0 10px 30px rgba(0,0,0,0.4);
    color:white;
}

/* SEARCH */
.search-box input{
    border-radius:25px;
    padding:10px 20px;
    background:transparent;
    border:1px solid rgba(255,255,255,0.5);
    color:white;
    width:100%;
}

.search-box input::placeholder{
    color:#ddd;
}

/* TABLE */
.table{
    margin-top:15px;
    color:white;
}

.table thead{
    background:rgba(255,255,255,0.2);
}

.table tbody tr:hover{
    background:rgba(255,255,255,0.15);
}

/* BUTTON */
.btn-warning{ background:#facc15; border:none; }
.btn-danger{ background:#ef4444; border:none; }

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

    .main{
        margin-left:0;
        padding:10px;
    }

    .card-box{
        width:100%;
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
    <a href="<c:url value='/admin/addUser'/>"><i class="bi bi-person-plus"></i> Add User</a>
    <a href="<c:url value='/admin/viewUsers/TEACHER'/>"><i class="bi bi-person-video3"></i> Teachers</a>
    <a href="<c:url value='/admin/viewUsers/STUDENT'/>"><i class="bi bi-mortarboard"></i> Students</a>
</div>

<!-- TOPBAR -->
<div class="topbar">
    <button class="btn btn-dark me-2 menu-btn" onclick="toggleSidebar()">
        <i class="bi bi-list"></i>
    </button>
    <h5 class="fw-bold mb-0">User</h5>
</div>

<!-- MAIN -->
<div class="main">
<div class="card-box">

<h4 class="mb-3">View ${role}s</h4>

<div class="search-box mb-3">
    <input type="text" id="searchInput" class="form-control"
           placeholder="Search by name or email..." onkeyup="searchUser()">
</div>

<div class="table-responsive">
<table class="table table-bordered text-center align-middle">

<thead>
<tr>
<th>#</th><th>Name</th><th>Email</th><th>Phone</th><th>Role</th><th>Edit</th><th>Delete</th>
</tr>
</thead>

<tbody id="userTable">
<c:forEach var="u" items="${user}" varStatus="status">
<tr>
<td>${status.index + 1}</td>
<td>${u.name}</td>
<td>${u.email}</td>
<td>${u.phone}</td>
<td>${u.role}</td>

<td>
<button class="btn btn-warning btn-sm"
data-id="${u.id}" data-name="${u.name}"
data-email="${u.email}" data-phone="${u.phone}"
data-role="${u.role}"
onclick="openEditModal(this)">
<i class="bi bi-pencil"></i>
</button>
</td>

<td>
<a href="<c:url value='/admin/deleteUser/${u.id}?role=${u.role}'/>"
class="btn btn-danger btn-sm"
onclick="return confirm('Delete this user?')">
<i class="bi bi-trash"></i>
</a>
</td>

</tr>
</c:forEach>
</tbody>

</table>
</div>

</div>
</div>

<!-- MODAL -->
<div class="modal fade" id="editModal">
<div class="modal-dialog">
<div class="modal-content">

<div class="modal-header">
<h5>Update User</h5>
<button class="btn-close" data-bs-dismiss="modal"></button>
</div>

<div class="modal-body">
<form action="<c:url value='/admin/updateUser'/>" method="post">

<input type="hidden" id="id" name="id">
<input type="text" id="name" name="name" class="form-control mb-2" required>
<input type="email" id="email" name="email" class="form-control mb-2" required>
<input type="text" id="phone" name="phone" class="form-control mb-2" required>
<input type="password" name="password" class="form-control mb-2" placeholder="New Password">
<input type="hidden" id="role" name="role">

<button class="btn btn-success w-100">Update</button>

</form>
</div>

</div>
</div>
</div>

<script>
function searchUser(){
    let input=document.getElementById("searchInput").value.toLowerCase();
    document.querySelectorAll("#userTable tr").forEach(row=>{
        let name=row.children[1].innerText.toLowerCase();
        let email=row.children[2].innerText.toLowerCase();
        row.style.display=(name.includes(input)||email.includes(input))?"":"none";
    });
}

function toggleSidebar(){
    document.querySelector(".sidebar").classList.toggle("active");
}

function openEditModal(btn){
    document.getElementById("id").value=btn.dataset.id;
    document.getElementById("name").value=btn.dataset.name;
    document.getElementById("email").value=btn.dataset.email;
    document.getElementById("phone").value=btn.dataset.phone;
    document.getElementById("role").value=btn.dataset.role;

    new bootstrap.Modal(document.getElementById('editModal')).show();
}
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>