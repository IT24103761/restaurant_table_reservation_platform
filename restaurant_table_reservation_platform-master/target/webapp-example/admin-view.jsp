<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reservation Admin</title>
    <style>
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 8px; border: 1px solid #ddd; }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>
    <h1>All Reservations</h1>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Phone</th>
            <th>Guests</th>
            <th>Date</th>
            <th>Time</th>
            <th>Table</th>
        </tr>
        <c:forEach items="${reservations}" var="res">
        <tr>
            <td>${res.id}</td>
            <td>${res.name}</td>
            <td>${res.phone}</td>
            <td>${res.guests}</td>
            <td>${res.date}</td>
            <td>${res.time}</td>
            <td>${res.table}</td>
        </tr>
        </c:forEach>
    </table>
</body>
</html>