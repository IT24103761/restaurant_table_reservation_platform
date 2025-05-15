<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login - Amali Restaurant</title>
    <link rel="stylesheet" href="Authentication/CSS/auth.css">
</head>
<body>
<div class="main-title"><span class="highlight">Amali</span> Restaurant</div>

<div class="auth-box">
    <h2>Login</h2>
    <form action="${pageContext.request.contextPath}/LoginServlet" method="post">
        <div class="form-group">
            <label for="username">Username or Email:</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <button type="submit" class="button">Login</button>
    </form>
    <div class="link">
        <p><a href="Authentication/Page/forgot-password.jsp">Forgot password?</a></p>
        <p>Don't have an account? <a href="Authentication/Page/signup.jsp">Sign up</a></p>
    </div>
</div>

<div class="content-wrapper">
    <!-- everything except the footer goes here -->
    <!-- header, form, etc. -->
</div>
</body>
</html>
