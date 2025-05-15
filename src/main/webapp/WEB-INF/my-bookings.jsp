<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, java.util.ArrayList, java.io.*" %>
<%
    // Sample data loading - in a real app, this would come from a database
    List<String[]> bookings = new ArrayList<>();
    String bookingsFilePath = application.getRealPath("");
    File bookingsFile = new File(bookingsFilePath);

    if (bookingsFile.exists()) {
        try (BufferedReader reader = new BufferedReader(new FileReader(bookingsFile))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] bookingData = line.split("\\|");
                if (bookingData.length >= 6 && bookingData[0].equals(session.getAttribute("username"))) {
                    bookings.add(bookingData);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
%>
<html>
<head>
    <title>My Bookings - Amali Restaurant</title>
    <link rel="stylesheet" href="../../Home/Css/Style.css">
    <style>
        .bookings-container {
            padding: 40px 0;
            min-height: 70vh;
        }

        .booking-card {
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            padding: 25px;
            margin-bottom: 25px;
            max-width: 800px;
            margin-left: auto;
            margin-right: auto;
            position: relative;
        }

        .booking-card h3 {
            color: #e8491d;
            margin-bottom: 15px;
            border-bottom: 1px solid #eee;
            padding-bottom: 10px;
        }

        .booking-detail {
            margin-bottom: 10px;
            display: flex;
        }

        .detail-label {
            font-weight: bold;
            min-width: 150px;
        }

        .action-buttons {
            margin-top: 20px;
            display: flex;
            gap: 15px;
        }

        .btn-update {
            background: #e8491d;
            color: white;
            border: none;
            padding: 8px 20px;
            border-radius: 4px;
            cursor: pointer;
            transition: background 0.3s;
        }

        .btn-update:hover {
            background: #cf3f14;
        }

        .btn-cancel {
            background: #dc3545;
            color: white;
            border: none;
            padding: 8px 20px;
            border-radius: 4px;
            cursor: pointer;
            transition: background 0.3s;
        }

        .btn-cancel:hover {
            background: #bb2d3b;
        }

        .no-bookings {
            text-align: center;
            padding: 50px;
            font-size: 1.2rem;
            color: #666;
        }

        .update-form {
            display: none;
            margin-top: 20px;
            padding: 20px;
            background: #f9f9f9;
            border-radius: 5px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .form-group input, .form-group select, .form-group textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .form-actions {
            margin-top: 15px;
            display: flex;
            gap: 10px;
        }
    </style>
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
                <li class="current"><a href="my-bookings.jsp">My Bookings</a></li>
            </ul>
        </nav>
    </div>
</header>

<section class="bookings-container">
    <div class="container">
        <h2>My Bookings</h2>

        <% if (bookings.isEmpty()) { %>
        <div class="no-bookings">
            <p>You don't have any bookings yet.</p>
            <a href="reservation.jsp" class="button">Make a Reservation</a>
        </div>
        <% } else {
            for (String[] booking : bookings) {
                String bookingId = booking[1];
                String date = booking[2];
                String time = booking[3];
                String guests = booking[4];
                String tableNumber = booking[5];
                String specialRequests = booking.length > 6 ? booking[6] : "None";
        %>
        <div class="booking-card" id="booking-<%= bookingId %>">
            <h3>Booking #<%= bookingId %></h3>

            <div class="booking-detail">
                <span class="detail-label">Date:</span>
                <span><%= date %></span>
            </div>

            <div class="booking-detail">
                <span class="detail-label">Time:</span>
                <span><%= time %></span>
            </div>

            <div class="booking-detail">
                <span class="detail-label">Number of Guests:</span>
                <span><%= guests %></span>
            </div>

            <div class="booking-detail">
                <span class="detail-label">Table Number:</span>
                <span><%= tableNumber %></span>
            </div>

            <div class="booking-detail">
                <span class="detail-label">Special Requests:</span>
                <span><%= specialRequests %></span>
            </div>

            <div class="action-buttons">
                <button class="btn-update" onclick="showUpdateForm('<%= bookingId %>')">Update Booking</button>
                <button class="btn-cancel" onclick="cancelBooking('<%= bookingId %>')">Cancel Booking</button>
            </div>

            <div class="update-form" id="update-form-<%= bookingId %>">
                <form action="UpdateBookingServlet" method="post">
                    <input type="hidden" name="bookingId" value="<%= bookingId %>">

                    <div class="form-group">
                        <label for="date">New Date:</label>
                        <input type="date" id="date" name="date" value="<%= date %>" required>
                    </div>

                    <div class="form-group">
                        <label for="time">New Time:</label>
                        <input type="time" id="time" name="time" value="<%= time %>" required>
                    </div>

                    <div class="form-group">
                        <label for="guests">Number of Guests:</label>
                        <select id="guests" name="guests" required>
                            <% for (int i = 1; i <= 10; i++) { %>
                            <option value="<%= i %>" <%= i == Integer.parseInt(guests) ? "selected" : "" %>>
                                <%= i %> <%= i == 1 ? "Person" : "People" %>
                            </option>
                            <% } %>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="specialRequests">Special Requests:</label>
                        <textarea id="specialRequests" name="specialRequests"><%= specialRequests %></textarea>
                    </div>

                    <div class="form-actions">
                        <button type="submit" class="btn-update">Save Changes</button>
                        <button type="button" class="btn-cancel" onclick="hideUpdateForm('<%= bookingId %>')">Cancel</button>
                    </div>
                </form>
            </div>
        </div>
        <% }
        } %>
    </div>
</section>

<footer>
    <div class="container">
        <p>Amali Restaurant &copy; 2023 | <a href="privacy.jsp">Privacy Policy</a></p>
    </div>
</footer>

<script>
    function showUpdateForm(bookingId) {
        document.getElementById('update-form-' + bookingId).style.display = 'block';
    }

    function hideUpdateForm(bookingId) {
        document.getElementById('update-form-' + bookingId).style.display = 'none';
    }

    function cancelBooking(bookingId) {
        if (confirm('Are you sure you want to cancel this booking?')) {
            fetch('CancelBookingServlet?bookingId=' + bookingId, {
                method: 'POST'
            })
                .then(response => {
                    if (response.ok) {
                        document.getElementById('booking-' + bookingId).remove();

                        // If no bookings left, show the no bookings message
                        if (document.querySelectorAll('.booking-card').length === 0) {
                            const container = document.querySelector('.bookings-container .container');
                            container.innerHTML = `
                            <h2>My Bookings</h2>
                            <div class="no-bookings">
                                <p>You don't have any bookings yet.</p>
                                <a href="reservation.jsp" class="button">Make a Reservation</a>
                            </div>
                        `;
                        }
                    } else {
                        alert('Failed to cancel booking. Please try again.');
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('An error occurred while canceling the booking.');
                });
        }
    }
</script>
</body>
</html>