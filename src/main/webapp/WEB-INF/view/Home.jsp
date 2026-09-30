<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<title>GradeSense | Student Performance Prediction</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>

/* BODY */
body{
margin:0;
font-family:'Segoe UI',sans-serif;
background:#f8fafc;
color:#1e293b;
}

/* NAVBAR */
.navbar{
background:#ffffff !important;
border-bottom:1px solid #e2e8f0;
}

.navbar-brand{
font-size:22px;
}

/* FIX TOGGLE ICON */
.navbar-toggler{
border:1px solid #0f172a;
}

.navbar-toggler-icon{
background-image:url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='%230f172a' viewBox='0 0 30 30'%3e%3cpath stroke='rgba(15,23,42,0.9)' stroke-width='2' d='M4 7h22M4 15h22M4 23h22'/%3e%3c/svg%3e");
}

/* CAROUSEL */
.carousel-item img{
height:85vh;
object-fit:cover;
filter:brightness(60%);
}

.carousel-caption{
bottom:25%;
}

.carousel-caption h1{
font-size:42px;
}

.carousel-caption p{
font-size:18px;
}

/* SECTION */
section{
padding:70px 0;
}

/* CARD */
.card{
border:1px solid #e2e8f0;
border-radius:12px;
transition:0.3s;
}

.card:hover{
transform:translateY(-5px);
box-shadow:0 10px 25px rgba(0,0,0,0.1);
}

/* CONTACT */
.contact-box{
background:white;
padding:25px;
border-radius:12px;
border:1px solid #e2e8f0;
}

/* FOOTER */
footer{
background:#0f172a;
}

/* ================= MOBILE ================= */
@media(max-width:768px){

.navbar-brand{
font-size:18px;
}

.carousel-item img{
height:60vh;
}

.carousel-caption{
bottom:20%;
padding:0 10px;
}

.carousel-caption h1{
font-size:22px;
}

.carousel-caption p{
font-size:14px;
}

section{
padding:40px 15px;
}

#about .row{
flex-direction:column-reverse;
text-align:center;
}

#about img{
margin-bottom:20px;
}

#contact .row{
flex-direction:column;
}

#contact img{
height:250px !important;
}

.btn{
width:100%;
}

footer{
font-size:13px;
}

}

</style>

</head>

<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg sticky-top">
<div class="container">

<a class="navbar-brand fw-bold">GradeSense</a>

<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#menu">
<span class="navbar-toggler-icon"></span>
</button>

<div class="collapse navbar-collapse" id="menu">
<ul class="navbar-nav ms-auto">

<li class="nav-item"><a class="nav-link" href="#home">Home</a></li>
<li class="nav-item"><a class="nav-link" href="#about">About</a></li>
<li class="nav-item"><a class="nav-link" href="#feature">Features</a></li>
<li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>

<li class="nav-item ms-lg-3 mt-2 mt-lg-0">
<a href="login" class="btn btn-dark btn-sm">Login</a>
</li>

</ul>
</div>

</div>
</nav>

<!-- SLIDER -->
<div id="home" class="carousel slide carousel-fade" data-bs-ride="carousel">

<div class="carousel-inner">

<div class="carousel-item active">
<img src="https://images.unsplash.com/photo-1523240795612-9a054b0db644" class="d-block w-100">
<div class="carousel-caption">
<h1>Student Performance Prediction</h1>
<p>Smart insights for better academic results</p>
</div>
</div>

<div class="carousel-item">
<img src="https://images.unsplash.com/photo-1509062522246-3755977927d7" class="d-block w-100">
<div class="carousel-caption">
<h1>Track & Improve Student Growth</h1>
<p>Analyze performance easily</p>
</div>
</div>

</div>

</div>

<!-- ABOUT -->
<section id="about" class="container">
<div class="row align-items-center">

<div class="col-md-6">
<h2 class="fw-bold mb-3">About System</h2>
<p>This system helps teachers analyze student data and predict performance.</p>
</div>

<div class="col-md-6">
<img src="https://images.unsplash.com/photo-1588072432836-e10032774350"
class="img-fluid rounded shadow">
</div>

</div>
</section>

<!-- FEATURES -->
<section id="feature" class="container text-center">

<h2 class="fw-bold mb-5">Features</h2>

<div class="row g-4">

<div class="col-md-4 col-sm-6">
<div class="card p-4">
<i class="fa-solid fa-chart-line fa-2x mb-3 text-dark"></i>
<h5>Performance Analysis</h5>
</div>
</div>

<div class="col-md-4 col-sm-6">
<div class="card p-4">
<i class="fa-solid fa-brain fa-2x mb-3 text-dark"></i>
<h5>Smart Prediction</h5>
</div>
</div>

<div class="col-md-4 col-sm-6">
<div class="card p-4">
<i class="fa-solid fa-user-graduate fa-2x mb-3 text-dark"></i>
<h5>Dashboard</h5>
</div>
</div>

</div>

</section>

<!-- CONTACT -->
<section id="contact" class="container">

<h2 class="text-center fw-bold mb-5">Contact Us</h2>

<div class="row align-items-center">

<div class="col-md-6 mb-4">
<img src="https://images.unsplash.com/photo-1521791136064-7986c2920216"
class="img-fluid rounded shadow w-100" style="height:420px; object-fit:cover;">
</div>

<div class="col-md-6">
<div class="contact-box">

<form action="<%=request.getContextPath()%>/saveContact" method="post">

<input type="text" name="name" placeholder="Full Name" class="form-control mb-3" required>
<input type="email" name="email" placeholder="Email Address" class="form-control mb-3" required>
<input type="text" name="phone" placeholder="Phone Number" class="form-control mb-3" required>

<textarea name="message" placeholder="Your Message" class="form-control mb-3" rows="4" required></textarea>

<button class="btn btn-dark">
<i class="fa-solid fa-paper-plane"></i> Send Message
</button>

</form>

</div>
</div>

</div>

</section>

<!-- FOOTER -->
<footer class="text-white text-center p-3 mt-5">
<p class="mb-0">© 2026 GradeSense | All Rights Reserved</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>