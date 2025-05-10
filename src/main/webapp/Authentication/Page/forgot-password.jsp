<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Forgot Password - Amali Restaurant</title>
    <link rel="stylesheet" href="../CSS/auth.css">
</head>
<body>
<div class="main-title"><span class="highlight">Amali</span> Restaurant</div>

<div class="auth-box">
    <h2>Reset Password</h2>
    <form action="ResetPasswordServlet" method="post" onsubmit="return validateReset()">
        <div class="form-group">
            <label for="email">Registered Email:</label>
            <input type="email" id="email" name="email" required>
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
        <div class="form-group">
            <label for="newPassword">New Password:</label>
            <input type="password" id="newPassword" name="newPassword" required>
        </div>
        <div class="form-group">
            <label for="confirmPassword">Confirm New Password:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required>
        </div>
        <button type="submit" class="button">Reset Password</button>
    </form>
    <div class="link">
        <p><a href="../../login.jsp">Back to Login</a></p>
    </div>
</div>

<script>
    function validateReset() {
        const newPass = document.getElementById("newPassword").value;
        const confirm = document.getElementById("confirmPassword").value;
        if (newPass !== confirm) {
            alert("Passwords do not match.");
            return false;
        }
        return true;
    }
</script>
</body>
</html>
