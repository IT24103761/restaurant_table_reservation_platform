<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Amali Restaurant - Reservation</title>
    <link rel="stylesheet" href="../../Home/Css/reservation.css">
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
                <li class="current"><a href="reservation.jsp">Reservations</a></li>
            </ul>
        </nav>
    </div>
</header>

<section id="reservation-form">
    <div class="container">
        <h2>Complete Your Reservation</h2>
        <form action="confirmation.jsp" method="post">
            <div class="form-group">
                <label for="fullname">Full Name:</label>
                <input type="text" id="fullname" name="fullname" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="phone">Phone Number:</label>
                <input type="tel" id="phone" name="phone" required>
            </div>
            <div class="form-group">
                <label for="res-date">Reservation Date:</label>
                <input type="date" id="res-date" name="res-date" value="${param.date}" required>
            </div>
            <div class="form-group">
                <label for="res-time">Reservation Time:</label>
                <input type="time" id="res-time" name="res-time" value="${param.time}" required>
            </div>
            <div class="form-group">
                <label for="res-guests">Number of Guests:</label>
                <select id="res-guests" name="res-guests" required>
                    <option value="1" ${param.guests == '1' ? 'selected' : ''}>1 Person</option>
                    <option value="2" ${param.guests == '2' ? 'selected' : ''}>2 People</option>
                    <option value="3" ${param.guests == '3' ? 'selected' : ''}>3 People</option>
                    <option value="4" ${param.guests == '4' ? 'selected' : ''}>4 People</option>
                    <option value="5" ${param.guests == '5' ? 'selected' : ''}>5 People</option>
                    <option value="6" ${param.guests == '6' ? 'selected' : ''}>6 People</option>
                    <option value="7" ${param.guests == '7' ? 'selected' : ''}>7 People</option>
                    <option value="8" ${param.guests == '8' ? 'selected' : ''}>8 People</option>
                    <option value="9" ${param.guests == '9' ? 'selected' : ''}>9+ People</option>
                </select>
            </div>
            <div class="form-group">
                <label for="special-requests">Special Requests:</label>
                <textarea id="special-requests" name="special-requests" rows="4"></textarea>
            </div>
            <button type="submit" class="button">Confirm Reservation</button>
        </form>
    </div>
</section>

<footer>
    <div class="container">
        <p>Amali Restaurant &copy; 2023 | <a href="privacy.jsp">Privacy Policy</a></p>
    </div>
</footer>
</body>
</html>