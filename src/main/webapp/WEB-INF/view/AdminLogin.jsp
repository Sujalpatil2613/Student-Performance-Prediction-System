<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin Login</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
<style>
*{margin:0;padding:0;box-sizing:border-box;font-family:'Poppins',sans-serif;}
body{height:100vh;display:flex;justify-content:center;align-items:center;background:linear-gradient(135deg,#141e30,#243b55);}
.login-card{width:400px;background:white;padding:40px;border-radius:10px;box-shadow:0 10px 25px rgba(0,0,0,0.3);text-align:center;}
.login-card h2{margin-bottom:25px;color:#333;}
.input-box{margin-bottom:15px;}
.input-box input{width:100%;padding:12px;border:1px solid #ccc;border-radius:5px;font-size:14px;outline:none;}
.input-box input:focus{border-color:#243b55;}
button{width:100%;padding:12px;background:#243b55;border:none;color:white;font-size:16px;border-radius:5px;cursor:pointer;transition:0.3s;}
button:hover{background:#141e30;}
.footer{margin-top:15px;font-size:12px;color:gray;}
.error-msg{color:red;margin-bottom:10px;}
</style>
</head>
<body>
<div class="login-card">
<h2>Admin Login</h2>

<% if(request.getParameter("error") != null){ %>
    <div class="error-msg">Invalid Username or Password</div>
<% } %>

<form action="login" method="post">
<div class="input-box">
<input type="text" name="username" placeholder="Enter Username" required>
</div>
<div class="input-box">
<input type="password" name="password" placeholder="Enter Password" required>
</div>
<button type="submit">Login</button>
</form>
<%
if (session.getAttribute("SPRING_SECURITY_CONTEXT") != null) {
    response.sendRedirect(request.getContextPath() + "/admin/dashboard");
}
%>

<div class="footer">
Student Performance Prediction System
</div>
</div>
</body>
</html>