<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Simplest Contact Form</title>
    <link rel="stylesheet" href="../CSS/support.css">
</head>
<body>
<div class="container">
    <h1>Simplest</h1>
    <h2>We're here to help! Contact us if you have any question or issues</h2>

    <form id="contactForm" action="contact" method="post">
        <div class="form-group">
            <label for="firstName">First Name</label>
            <input type="text" id="firstName" name="firstName">
        </div>

        <div class="form-group">
            <label for="lastName">Last Name</label>
            <input type="text" id="lastName" name="lastName">
        </div>

        <div class="form-group">
            <label for="email">Email (required)</label>
            <input type="email" id="email" name="email" required>
        </div>

        <div class="form-group">
            <label for="message">Message (required)</label>
            <textarea id="message" name="message" rows="4" required></textarea>
        </div>

        <hr>

        <button><a href="contact.jsp" type="submit" class="submit-btn">SEND MESSAGE</a></button>
    </form>
</div>

<script src="../JS/support.js"></script>
</body>
</html>