<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Login</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>

body{
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:linear-gradient(rgba(0,0,0,0.6),rgba(0,0,0,0.6)),
    url('https://images.unsplash.com/photo-1523240795612-9a054b0db644?auto=format&fit=crop&w=1600&q=80') no-repeat center/cover;
    font-family:'Segoe UI',sans-serif;
}

/* Login Card */
.login-box{
    width:360px;
    padding:35px;
    border-radius:18px;
    backdrop-filter:blur(15px);
    background:rgba(255,255,255,0.12);
    box-shadow:0 10px 40px rgba(0,0,0,0.4);
    color:white;
}

/* Title */
.login-box h3{
    font-weight:600;
}

/* Input group */
.input-group-text{
    background:rgba(255,255,255,0.2);
    border:none;
    color:white;
}

.form-control{
    background:rgba(255,255,255,0.2) !important;
    border:none !important;
    color:white !important;
}

.form-control::placeholder{
    color:#ddd;
}

/* Select */
select{
    background:rgba(255,255,255,0.2) !important;
    color:white !important;
    border:none !important;
}

select option{
    color:black;
}

/* Button */
.login-btn{
    background:#facc15;
    border:none;
    font-weight:500;
    transition:0.3s;
}

.login-btn:hover{
    background:#eab308;
    transform:translateY(-2px);
}

/* Bottom links */
.bottom-links a{
    color:#fff;
    text-decoration:none;
    font-size:14px;
}

.bottom-links a:hover{
    text-decoration:underline;
}

/* Responsive */
@media(max-width:500px){
    .login-box{
        width:90%;
        padding:25px;
    }
}

</style>

</head>

<body>

<div class="login-box">

    <h3 class="text-center mb-4">Login</h3>

    <!-- OPTIONAL ERROR -->
    <%-- <div class="alert alert-danger">Invalid credentials</div> --%>

    <form action="doLogin" method="post">

        <!-- EMAIL -->
        <div class="input-group mb-3">
            <span class="input-group-text">
                <i class="fa-solid fa-envelope"></i>
            </span>
            <input type="email" name="email" placeholder="Enter Email"
            class="form-control" required>
        </div>

        <!-- PASSWORD -->
        <div class="input-group mb-3">
            <span class="input-group-text">
                <i class="fa-solid fa-lock"></i>
            </span>
            <input type="password" id="password" name="password"
            placeholder="Enter Password" class="form-control" required>

            <!-- SHOW PASSWORD -->
            <span class="input-group-text" onclick="togglePassword()" style="cursor:pointer;">
                <i class="fa-solid fa-eye"></i>
            </span>
        </div>

        <!-- ROLE -->
        <select name="role" class="form-control mb-3" required>
            <option value="">Select Role</option>
            <option value="TEACHER">Teacher</option>
            <option value="STUDENT">Student</option>
        </select>

        <!-- LOGIN BUTTON -->
        <button class="btn login-btn w-100 mb-3">Login</button>

    </form>

    <!-- LINKS -->
    <div class="bottom-links text-center">

        

        <div class="mt-2">
            <a href="<%=request.getContextPath()%>/">← Back to Home</a>
        </div>

    </div>

</div>

<!-- JS -->
<script>
function togglePassword(){
    var x = document.getElementById("password");
    if(x.type === "password"){
        x.type = "text";
    } else {
        x.type = "password";
    }
}
</script>

</body>
</html>