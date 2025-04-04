package com.example;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/view-reservations")
public class ViewReservationsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Reservation> reservations = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM reservations")) {

            while (rs.next()) {
                Reservation r = new Reservation();
                r.setCustomerName(rs.getString("customer_name"));
                r.setPhoneNumber(rs.getString("phone_number"));
                r.setGuests(rs.getInt("guests"));
                r.setReservationDate(rs.getDate("reservation_date").toLocalDate());
                r.setReservationTime(rs.getTime("reservation_time").toLocalTime());
                r.setTableNumber(rs.getInt("table_number"));
                r.setCapacityCategory(rs.getString("capacity_category"));
                reservations.add(r);
            }

        } catch (SQLException e) {
            throw new ServletException("Database error", e);
        }

        request.setAttribute("reservations", reservations);
        request.getRequestDispatcher("bookings.jsp").forward(request, response);
    }
}