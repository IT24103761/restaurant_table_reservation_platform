<%@ page import="java.util.List,com.example.Reservation" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Reservations</title>
    <style>
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #ddd; padding: 8px; }
        th { background-color: #1f5461; color: white; }
    </style>
</head>
<body>
    <h1>Current Reservations</h1>
    <table>
        <tr>
            <th>Name</th>
            <th>Phone</th>
            <th>Guests</th>
            <th>Date</th>
            <th>Time</th>
            <th>Table #</th>
            <th>Category</th>
        </tr>
        <% List<Reservation> reservations = (List<Reservation>)request.getAttribute("reservations"); %>
        <% for (Reservation r : reservations) { %>
        <tr>
            <td><%= r.getCustomerName() %></td>
            <td><%= r.getPhoneNumber() %></td>
            <td><%= r.getGuests() %></td>
            <td><%= r.getReservationDate() %></td>
            <td><%= r.getReservationTime() %></td>
            <td><%= r.getTableNumber() %></td>
            <td><%= r.getCapacityCategory() %></td>
        </tr>
        <% } %>
    </table>
    <a href="index.jsp">New Booking</a>
</body>
</html>