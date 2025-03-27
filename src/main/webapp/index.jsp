<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Restaurant Table Reservation</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        /* CSS code for styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            text-align: center;
            margin: 0;
            background-image: url('css/back_pic.jpg');
            background-size: cover;
            background-position: center;
        }

        header {
            background-color: #000000;
            color: white;
            padding: 15px 0;
        }

        .container {
            width: 90%;
            max-width: 400px;
            margin: 30px auto;
            padding: 45px;
            background: #d6d8df;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
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
        }

        input, button {
            margin-top: 5px;
            padding: 10px;
            font-size: 16px;
            width: 100%;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            background-color: #478e23;
            color: white;
            border: none;
            cursor: pointer;
            margin-top: 20px;
        }

        button:hover {
            background-color: #dd2d7c;
        }

        #confirmationMessage {
            margin-top: 15px;
            font-weight: bold;
            color: green;
        }
    </style>
</head>
<body>
<header>
    <h1>Amali Rest Inn</h1>
</header>



<div class="container">
    <form id="reservationForm">
        <center><h1>BOOK YOUR TABLE</h1></center>
        <label for="name">Full Name:</label>
        <input type="text" id="name" placeholder="Enter your name" required>

        <label for="phone">Phone Number:</label>
        <input type="tel" id="phone" placeholder="Enter your phone number" required>

        <label for="date">Date:</label>
        <input type="date" id="date" required>

        <label for="time">Time:</label>
        <input type="time" id="time" required>

        <label for="guests">Number of Guests:</label>
        <input type="number" id="guests" min="1" required>

        <button type="submit">Login and Reserve Now</button>
    </form>
    <p id="confirmationMessage"></p>
</div>
</body>
</html>
