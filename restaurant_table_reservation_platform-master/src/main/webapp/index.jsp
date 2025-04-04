<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Restaurant Table Booking</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            text-align: center;
            margin: 0;
            background-image: url("back_pic.jpg");
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
        }

        header {
            background-color: #000000;
            color: white;
            padding: 25px 0;
        }

        .container {
            width: 90%;
            max-width: 400px;
            margin: 30px auto;
            padding: 45px;
            background: rgba(31, 84, 97, 0.9);
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            color: white;
        }

        h1 {
            margin: 0;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-top: 10px;
            font-weight: bold;
            text-align: left;
            color: white;
        }

        input, button, select {
            margin-top: 5px;
            padding: 10px;
            font-size: 16px;
            width: 100%;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        button {
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
            margin-top: 20px;
        }

        button:hover {
            background-color: #218838;
        }

        #confirmationMessage {
            margin-top: 15px;
            font-weight: bold;
            color: #28a745;
        }

        .error {
            color: #dc3545;
        }
    </style>
</head>
<body>
    <header>
        <h1>Restaurant Table Booking</h1>
    </header>
    
    <div class="container">
        <form action="reserve" method="post">
            <label for="name">Full Name:</label>
            <input type="text" id="name" name="name" required>
            
            <label for="phone">Phone Number:</label>
            <input type="tel" id="phone" name="phone" required>
            
            <label for="guests">Number of Guests:</label>
            <input type="number" id="guests" name="guests" min="1" max="20" required>
            
            <label for="date">Reservation Date:</label>
            <input type="date" id="date" name="date" required>
            
            <label for="time">Reservation Time:</label>
            <input type="time" id="time" name="time" required>
            
            <button type="submit">Book Table</button>
        </form>
        
        <% if (request.getAttribute("message") != null) { %>
            <div id="confirmationMessage">
                <%= request.getAttribute("message") %>
            </div>
        <% } %>
    </div>

    <script>
        // Set min date to today
        document.getElementById('date').min = new Date().toISOString().split('T')[0];
    </script>
</body>
</html>
<div style="margin-top: 20px;">
    <a href="view-reservations" style="color: white;">View All Bookings</a>
</div>