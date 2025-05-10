<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign Up - Amali Restaurant</title>
    <link rel="stylesheet" href="../Css/auth.css">
</head>
<body>
<div class="main-title"><span class="highlight">Amali</span> Restaurant</div>

<div class="auth-box">
    <h2>Create an Account</h2>
    <form action="SignupServlet" method="post" onsubmit="return validateSignup()">
        <div class="form-group">
            <label for="fullname">Full Name:</label>
            <input type="text" id="fullname" name="fullname" required>
        </div>
        <div class="form-group">
            <label for="email">Email Address:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div class="form-group">
            <label for="confirmPassword">Confirm Password:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required>
        </div>
        <div class="form-group">
            <label for="securityQuestion">Security Question:</label>
            <select id="securityQuestion" name="securityQuestion" required>
                <option value="">Select a question</option>
                <option value="pet">What is your pet's name?</option>
                <option value="school">What is your first school?</option>
                <option value="birthplace">Where were you born?</option>
            </select>
        </div>
        <div class="form-group">
            <label for="securityAnswer">Answer:</label>
            <input type="text" id="securityAnswer" name="securityAnswer" required>
        </div>
        <button type="submit" class="button">Sign Up</button>
    </form>
    <div class="link">
        <p>Already have an account? <a href="../../../login.jsp">Login</a></p>
    </div>
</div>

<script>
    function validateSignup() {
        const password = document.getElementById("password").value;
        const confirm = document.getElementById("confirmPassword").value;
        if (password !== confirm) {
            alert("Passwords do not match.");
            return false;
        }
        return true;
    }
</script>
</body>
</html>
