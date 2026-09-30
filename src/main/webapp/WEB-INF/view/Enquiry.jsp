<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Enquiry</title>

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

/* CARD */
.table-card{
    background:rgba(255,255,255,0.05);
    backdrop-filter:blur(12px);
    padding:20px;
    border-radius:18px;
}

/* TABLE */
.table{
    color:white;
    font-size:14px;
}

.table thead{
    background:#1e293b;
}

.table-hover tbody tr:hover{
    background:#1d4ed8;
}

/* SEARCH */
.search-box{
    position:relative;
    width:250px;
}

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

    <a href="<%=request.getContextPath()%>/teacher/viewPerformance">
        <i class="fa-solid fa-table"></i> View Performance
    </a>

    <a href="#" class="active">
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
    <h5>Enquiries</h5>
</div>

<!-- MAIN -->
<div class="main">

    <!-- HEADER -->
    <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap">
        <h3>📩 Student Enquiries</h3>

        <div class="search-box">
            <i class="fa fa-search"></i>
            <input type="text" id="searchInput" placeholder="Search..." class="form-control">
        </div>
    </div>

    <!-- TABLE -->
    <div class="table-card">
        <div class="table-responsive">
            <table class="table table-hover text-center align-middle" id="enquiryTable">

                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Message</th>
                    </tr>
                </thead>

                <tbody>
                <c:forEach var="c" items="${contacts}">
                    <tr>
                        <td>${c.id}</td>
                        <td>${c.name}</td>
                        <td>${c.email}</td>
                        <td>${c.phone}</td>
                        <td style="max-width:200px; white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">
                            ${c.message}
                        </td>
                    </tr>
                </c:forEach>
                </tbody>

            </table>
        </div>
    </div>

</div>

<!-- JS -->
<script>
function toggleSidebar(){
    document.querySelector(".sidebar").classList.toggle("show");
    document.querySelector(".overlay").classList.toggle("active");
}

/* SEARCH */
document.getElementById("searchInput").addEventListener("keyup", function() {
    let value = this.value.toLowerCase();
    let rows = document.querySelectorAll("#enquiryTable tbody tr");

    rows.forEach(row => {
        row.style.display = row.innerText.toLowerCase().includes(value) ? "" : "none";
    });
});
</script>

</body>
</html>