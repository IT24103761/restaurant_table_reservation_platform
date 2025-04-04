package com.example;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.ArrayList;
import java.util.HashMap;

@WebServlet("/admin/reservations")
public class AdminServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT r.*, t.table_number FROM reservations r " +
                    "JOIN tables t ON r.table_id = t.table_id " +
                    "ORDER BY r.reservation_date DESC";

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            List<Map<String, String>> reservations = new ArrayList<>();
            while (rs.next()) {
                Map<String, String> res = new HashMap<>();
                res.put("id", rs.getString("reservation_id"));
                res.put("name", rs.getString("customer_name"));
                res.put("phone", rs.getString("phone_number"));
                res.put("guests", rs.getString("guest_count"));
                res.put("date", rs.getString("reservation_date"));
                res.put("time", rs.getString("reservation_time"));
                res.put("table", rs.getString("table_number"));
                reservations.add(res);
            }

            request.setAttribute("reservations", reservations);
            request.getRequestDispatcher("/admin-view.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(500, "Database error");
        }
    }
}
