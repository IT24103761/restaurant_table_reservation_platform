package com.Authentication;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class ResetPasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String securityQuestion = request.getParameter("securityQuestion");
        String securityAnswer = request.getParameter("securityAnswer");
        String newPassword = request.getParameter("newPassword");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/amali_db", "root", "password");

            PreparedStatement checkUser = con.prepareStatement(
                    "SELECT * FROM users WHERE email = ? AND security_question = ? AND security_answer = ?"
            );
            checkUser.setString(1, email);
            checkUser.setString(2, securityQuestion);
            checkUser.setString(3, securityAnswer);

            ResultSet rs = checkUser.executeQuery();

            if (rs.next()) {
                PreparedStatement updatePassword = con.prepareStatement(
                        "UPDATE users SET password = ? WHERE email = ?"
                );
                updatePassword.setString(1, newPassword);  // saved as plain text
                updatePassword.setString(2, email);
                updatePassword.executeUpdate();

                response.sendRedirect("../../login.jsp");
            } else {
                response.sendRedirect("forgot-password.jsp?error=1");
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("forgot-password.jsp?error=1");
        }
    }
}

