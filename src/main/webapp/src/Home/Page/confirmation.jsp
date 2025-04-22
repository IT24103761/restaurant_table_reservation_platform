<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Amali Restaurant - Reservation Confirmation</title>
    <link rel="stylesheet" href="../../Home/Css/Style.css">
</head>
<body>
<header>
    <div class="container">
        <div id="branding">
            <h1><span class="highlight">Amali</span> Restaurant</h1>
        </div>
        <nav>
            <ul>
                <li><a href="../../../index.jsp">Home</a></li>
                <li><a href="about.jsp">About</a></li>
                <li><a href="reservation.jsp">Reservations</a></li>
            </ul>
        </nav>
    </div>
</header>

<section id="confirmation">
    <div class="container">
        <h2>Reservation Confirmed!</h2>
        <div class="confirmation-details">
            <p><strong>Name:</strong> ${param.fullname}</p>
            <p><strong>Email:</strong> ${param.email}</p>
            <p><strong>Phone:</strong> ${param.phone}</p>
            <p><strong>Date:</strong> ${param['res-date']}</p>
            <p><strong>Time:</strong> ${param['res-time']}</p>
            <p><strong>Number of Guests:</strong> ${param['res-guests']}</p>
            <p><strong>Special Requests:</strong> ${param['special-requests']}</p>
        </div>
        <p>Thank you for choosing Amali Restaurant. We look forward to serving you!</p>
        <p>A confirmation email has been sent to ${param.email}.</p>
        <a href="../../../index.jsp" class="button">Return to Home</a>
    </div>
</section>

<footer>
    <div class="container">
        <p>Amali Restaurant &copy; 2023 | <a href="privacy.jsp">Privacy Policy</a></p>
    </div>
</footer>
</body>
</html>