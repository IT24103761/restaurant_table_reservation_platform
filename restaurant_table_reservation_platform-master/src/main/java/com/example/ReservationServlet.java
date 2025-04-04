package com.example;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/reserve")
public class ReservationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form parameters with validation
        String name = sanitizeInput(request.getParameter("name"));
        String phone = sanitizeInput(request.getParameter("phone"));
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        int guests = 0;
        try {
            guests = Integer.parseInt(request.getParameter("guests"));
        } catch (NumberFormatException e) {
            handleError(request, response, "Invalid number of guests");
            return;
        }

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String message = "";

        try {
            conn = DBConnection.getConnection();
            conn.setAutoCommit(false); // Start transaction

            // Find available table with capacity matching
            String findTableSQL = "SELECT id, table_number, max_capacity FROM tables WHERE " +
                    "min_capacity <= ? AND max_capacity >= ? " +
                    "AND (is_reserved = FALSE OR reservation_date != ? OR reservation_time != ?) " +
                    "ORDER BY max_capacity ASC LIMIT 1";

            stmt = conn.prepareStatement(findTableSQL);
            stmt.setInt(1, guests);
            stmt.setInt(2, guests);
            stmt.setString(3, date);
            stmt.setString(4, time);
            rs = stmt.executeQuery();

            if (rs.next()) {
                int tableId = rs.getInt("id");
                int tableNumber = rs.getInt("table_number");
                int tableCapacity = rs.getInt("max_capacity");

                // Update table status
                String updateTableSQL = "UPDATE tables SET is_reserved = TRUE, " +
                        "reservation_date = ?, reservation_time = ? WHERE id = ?";
                stmt = conn.prepareStatement(updateTableSQL);
                stmt.setString(1, date);
                stmt.setString(2, time);
                stmt.setInt(3, tableId);
                stmt.executeUpdate();

                // Determine capacity category based on table size
                String capacityCategory = determineCapacityCategory(tableCapacity);

                // Create reservation record with all required fields
                String insertReservationSQL = "INSERT INTO reservations " +
                        "(customer_name, phone_number, guests, reservation_date, reservation_time, " +
                        "table_id, table_number, capacity_category) " +
                        "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                stmt = conn.prepareStatement(insertReservationSQL);
                stmt.setString(1, name);
                stmt.setString(2, phone);
                stmt.setInt(3, guests);
                stmt.setString(4, date);
                stmt.setString(5, time);
                stmt.setInt(6, tableId);
                stmt.setInt(7, tableNumber);
                stmt.setString(8, capacityCategory);
                stmt.executeUpdate();

                conn.commit();
                message = "RESERVATION SUCCESS! Table #" + tableNumber + " for " + guests + " guests";
            } else {
                message = "Sorry, no available tables matching your requirements";
            }
        } catch (SQLException e) {
            try {
                if (conn != null) conn.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            message = "Reservation error: " + e.getMessage();
            e.printStackTrace();
        } catch (Exception e) {
            message = "System error: " + e.getMessage();
            e.printStackTrace();
        } finally {
            closeResources(rs, stmt, conn);
        }

        request.setAttribute("message", message);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    private String determineCapacityCategory(int tableCapacity) {
        if (tableCapacity <= 2) return "small";
        if (tableCapacity <= 4) return "medium";
        if (tableCapacity <= 6) return "large";
        return "x-large";
    }

    private String sanitizeInput(String input) {
        if (input == null) return "";
        return input.trim().replaceAll("[^a-zA-Z0-9@. -]", "");
    }

    private void closeResources(ResultSet rs, PreparedStatement stmt, Connection conn) {
        try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }

    private void handleError(HttpServletRequest request, HttpServletResponse response, String errorMessage)
            throws ServletException, IOException {
        request.setAttribute("message", errorMessage);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}