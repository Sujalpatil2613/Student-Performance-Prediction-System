<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Dashboard</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

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
    width:240px;
    height:100vh;
    position:fixed;
    background:linear-gradient(180deg,#1e293b,#0f172a);
    transition:0.3s;
    z-index:1000;
}

.sidebar.hide{
    transform:translateX(-100%);
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

.sidebar a:hover,
.sidebar a.active{
    background:#1d4ed8;
    color:white;
    border-radius:8px;
}

/* TOPBAR */

.topbar{
    margin-left:240px;
    height:60px;
    background:#1e293b;
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:0 20px;
    box-shadow:0 5px 15px rgba(0,0,0,0.3);
    flex-wrap:wrap;
}

/* MAIN */

.main{
    margin-left:240px;
    padding:30px;
}

/* CARD */

.card{
    background:rgba(255,255,255,0.05);
    backdrop-filter:blur(12px);
    border:none;
    border-radius:18px;
    color:white;
    box-shadow:0 10px 30px rgba(0,0,0,0.4);
    transition:0.4s;
}

.card:hover{
    transform:translateY(-5px);
}

/* PROFILE */

.profile-box{
    display:flex;
    align-items:center;
    gap:20px;
}

.profile-icon{
    font-size:50px;
}

/* STAT */

.stat-card{
    text-align:center;
    padding:20px;
}

/* TABLE */

.table{
    color:white;
}

/* MOBILE */

@media(max-width:768px){

    .sidebar{
        transform:translateX(-100%);
    }

    .topbar,
    .main{
        margin-left:0;
    }

    .profile-box{
        flex-direction:column;
        text-align:center;
    }

    .main{
        padding:15px;
    }

    h2{
        font-size:18px;
    }
}

/* PRINT */

@media print {

    body{
        background:white !important;
        color:black !important;
    }

    .sidebar,
    .topbar,
    .print-btn{
        display:none !important;
    }

    .main{
        margin:0 !important;
        padding:20px !important;
    }

    .card{
        color:black !important;
        box-shadow:none !important;
        border:1px solid #ccc;
    }

    .table{
        color:black !important;
    }

    canvas{
        max-width:100% !important;
    }
}

</style>

</head>

<body>

<!-- SIDEBAR -->

<div class="sidebar">

    <h3>🎓 Student</h3>

    <a href="#" class="active">
        <i class="fa fa-user"></i>
        Profile
    </a>

    <a href="#prediction">
        <i class="fa fa-robot"></i>
        Prediction
    </a>

    <a href="#performance">
        <i class="fa fa-chart-line"></i>
        Performance
    </a>

    <a href="<%=request.getContextPath()%>/logout">
        <i class="fa fa-sign-out-alt"></i>
        Logout
    </a>

</div>

<!-- TOPBAR -->

<div class="topbar">

    <button class="btn btn-primary d-md-none"
            onclick="toggleSidebar()">

        <i class="fa fa-bars"></i>

    </button>

    <h5>Dashboard</h5>

    <div>
        <i class="fa fa-user-circle fa-lg"></i>
    </div>

</div>

<!-- MAIN -->

<div class="main">

    <h2 class="mb-4">
        Welcome, ${sessionScope.studentName} 👋
    </h2>

    <!-- PROFILE -->

    <div class="card p-4 mb-4">

        <div class="profile-box">

            <div class="profile-icon">
                <i class="fa fa-user-circle"></i>
            </div>

            <div>
                <h5>${sessionScope.user.name}</h5>

                <p>${sessionScope.user.email}</p>

                <small>${sessionScope.user.phone}</small>
            </div>

        </div>

    </div>

    <c:choose>

        <c:when test="${not empty performanceList}">

            <c:set var="latest"
                   value="${performanceList[0]}" />

            <!-- STATS -->

            <div class="row g-4 mb-4">

                <div class="col-6 col-md-3">

                    <div class="card stat-card">

                        <h3>${latest.attendance}%</h3>

                        <p>Attendance</p>

                    </div>

                </div>

                <div class="col-6 col-md-3">

                    <div class="card stat-card">

                        <h3>${latest.marks}</h3>

                        <p>Marks</p>

                    </div>

                </div>

                <div class="col-6 col-md-3">

                    <div class="card stat-card">

                        <h3>${latest.studyHours}</h3>

                        <p>Study Hours</p>

                    </div>

                </div>

                <div class="col-6 col-md-3">

                    <div class="card stat-card">

                        <h3>${latest.predictedPerformance}</h3>

                        <p>Prediction</p>

                    </div>

                </div>

            </div>

            <!-- PRINT BUTTON -->

            <div class="mb-4 text-end print-btn">

                <button onclick="printDashboard()"
                        class="btn btn-success btn-lg">

                    <i class="fa fa-print"></i>

                    Print Full Report

                </button>

            </div>

            <!-- TABLE -->

            <div id="performance"
                 class="card p-4 mb-4">

                <h4 class="mb-3">
                    Performance History
                </h4>

                <div class="table-responsive">

                    <table class="table table-hover text-center">

                        <thead>

                            <tr>
                                <th>Attendance</th>
                                <th>Marks</th>
                                <th>Study</th>
                                <th>Participation</th>
                                <th>Prediction</th>
                            </tr>

                        </thead>

                        <tbody>

                            <c:forEach var="p"
                                       items="${performanceList}">

                                <tr>

                                    <td>${p.attendance}</td>

                                    <td>${p.marks}</td>

                                    <td>${p.studyHours}</td>

                                    <td>${p.participation}</td>

                                    <td>${p.predictedPerformance}</td>

                                </tr>

                            </c:forEach>

                        </tbody>

                    </table>

                </div>

            </div>

            <!-- GRAPH -->

            <div id="prediction"
                 class="card p-4">

                <h4 class="text-center mb-3">
                    📊 Performance Graph
                </h4>

                <canvas id="chart"
                        style="max-height:300px;">
                </canvas>

            </div>

        </c:when>

        <c:otherwise>

            <div class="card p-4 text-center">

                No performance data available

            </div>

        </c:otherwise>

    </c:choose>

</div>

<!-- JS -->

<script>

function toggleSidebar(){

    document.querySelector(".sidebar")
            .classList.toggle("hide");
}

</script>

<!-- PRINT -->

<script>

function printDashboard(){

    window.print();
}

</script>

<!-- CHART -->

<script>

<c:if test="${not empty performanceList}">

const ctx =
    document.getElementById('chart');

new Chart(ctx, {

    type: 'bar',

    data: {

        labels: [
            'Attendance',
            'Marks',
            'Study',
            'Participation'
        ],

        datasets: [{

            label: 'Performance',

            data: [

                ${performanceList[0].attendance},

                ${performanceList[0].marks},

                ${performanceList[0].studyHours},

                ${performanceList[0].participation}

            ]

        }]
    }
});

</c:if>

</script>

</body>
</html>