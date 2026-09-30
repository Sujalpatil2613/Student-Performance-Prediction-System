<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Performance</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>

body{margin:0;font-family:'Segoe UI',sans-serif;background:#0f172a;color:white;}

/* SIDEBAR */
.sidebar{
    height:100vh;
    width:240px;
    position:fixed;
    top:0;
    left:0;
    background:linear-gradient(180deg,#1e293b,#0f172a);
    transition:0.3s;
    z-index:1000;
}

/* MOBILE HIDE */
@media(max-width:768px){
    .sidebar{left:-240px;}
}

/* SHOW */
.sidebar.show{left:0;}

.sidebar h3{text-align:center;padding:20px;}

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
.overlay.active{display:block;}

/* TOPBAR */
.topbar{
    margin-left:240px;
    height:60px;
    display:flex;
    align-items:center;
    gap:10px;
    padding:0 20px;
    background:#1e293b;
}

@media(max-width:768px){
    .topbar{margin-left:0;}
}

/* MAIN */
.main{margin-left:240px;padding:30px;}

@media(max-width:768px){
    .main{margin-left:0;padding:15px;}
}

/* CARD */
.table-card{
    background:rgba(255,255,255,0.05);
    backdrop-filter:blur(12px);
    padding:20px;
    border-radius:18px;
}

/* TABLE */
.table{color:white;font-size:14px;}
.table thead{background:#1e293b;}
.table-hover tbody tr:hover{background:#1d4ed8;}

/* SEARCH */
.search-box{position:relative;width:250px;}
.search-box input{
    padding-left:35px;
    border-radius:20px;
    border:none;
}
.search-box i{
    position:absolute;
    top:10px;
    left:10px;
    color:gray;
}

@media(max-width:768px){
    .search-box{
        width:100%;
        margin-top:10px;
    }
}

/* BUTTON */
.btn-sm{border-radius:15px;}

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

    <a href="<%=request.getContextPath()%>/teacher/addPerformance">
        <i class="fa-solid fa-plus"></i> Add Performance
    </a>

    <a href="#" class="active">
        <i class="fa-solid fa-table"></i> View Performance
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
    <h5>Performance</h5>
</div>

<!-- MAIN -->
<div class="main">

<div class="d-flex justify-content-between align-items-center mb-4 flex-wrap">
    <h3>📊 Student Performance</h3>

    <div class="search-box">
        <i class="fa fa-search"></i>
        <input type="text" id="searchInput" placeholder="Search..." class="form-control">
    </div>
</div>

<div class="table-card">
<div class="table-responsive">

<table class="table table-hover text-center align-middle" id="studentTable">

<thead>
<tr>
<th>Name</th>
<th>Attendance</th>
<th>Marks</th>
<th>Study</th>
<th>Participation</th>
<th>Predicted</th>
<th>Readiness</th>
<th>Actions</th>
</tr>
</thead>

<tbody>

<c:forEach var="p" items="${list}">
<tr>
<td>${p.studentName}</td>
<td>${p.attendance}</td>
<td>${p.marks}</td>
<td>${p.studyHours}</td>
<td>${p.participation}</td>
<td>${p.predictedPerformance}</td>

<td>
<c:choose>
<c:when test="${p.readiness == 'Excellent'}">
<span class="badge bg-success">Excellent</span>
</c:when>
<c:when test="${p.readiness == 'Average'}">
<span class="badge bg-warning text-dark">Average</span>
</c:when>
<c:otherwise>
<span class="badge bg-danger">Poor</span>
</c:otherwise>
</c:choose>
</td>

<td>
<button class="btn btn-warning btn-sm"
data-bs-toggle="modal"
data-bs-target="#editModal${p.id}">
<i class="fa fa-pen"></i>
</button>

<a href="<%=request.getContextPath()%>/teacher/deletePerformance?id=${p.id}"
class="btn btn-danger btn-sm"
onclick="return confirm('Delete this record?')">
<i class="fa fa-trash"></i>
</a>
</td>

</tr>
</c:forEach>

</tbody>
</table>

</div>
</div>

</div>

<!-- MODALS -->
<c:forEach var="p" items="${list}">
<div class="modal fade" id="editModal${p.id}">
<div class="modal-dialog modal-dialog-centered">
<div class="modal-content bg-dark text-white">

<form action="<%=request.getContextPath()%>/teacher/updatePerformance" method="post">

<div class="modal-header">
<h5>Edit Performance</h5>
<button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
</div>

<div class="modal-body">
<input type="hidden" name="id" value="${p.id}">

<input type="text" name="studentName" value="${p.studentName}" class="form-control mb-2">
<input type="number" name="attendance" value="${p.attendance}" class="form-control mb-2">
<input type="number" name="marks" value="${p.marks}" class="form-control mb-2">
<input type="number" name="studyHours" value="${p.studyHours}" class="form-control mb-2">
<input type="number" name="participation" value="${p.participation}" class="form-control mb-2">
</div>

<div class="modal-footer">
<button type="submit" class="btn btn-success w-100">Update</button>
</div>

</form>

</div>
</div>
</div>
</c:forEach>

<!-- JS -->
<script>
function toggleSidebar(){
    document.querySelector(".sidebar").classList.toggle("show");
    document.querySelector(".overlay").classList.toggle("active");
}

/* SEARCH */
document.getElementById("searchInput").addEventListener("keyup", function() {
let value = this.value.toLowerCase();
let rows = document.querySelectorAll("#studentTable tbody tr");

rows.forEach(row => {
row.style.display = row.innerText.toLowerCase().includes(value) ? "" : "none";
});
});
</script>

</body>
</html>