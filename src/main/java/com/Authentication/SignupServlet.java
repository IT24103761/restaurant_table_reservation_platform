package com.Authentication;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {

    private static final String USER_FILE = "../Users.txt";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form parameters
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String securityQuestion = request.getParameter("securityQuestion");
        String securityAnswer = request.getParameter("securityAnswer");

        // Validate input
        if (fullname == null || email == null || username == null || password == null ||
                securityQuestion == null || securityAnswer == null) {
            response.sendRedirect("signup.jsp?error=missing_fields");
            return;
        }

        // Check if a username already exists
        if (isUserExists(username)) {
            response.sendRedirect("signup.jsp?error=username_exists");
            return;
        }

        // Save user data to a file
        saveUser(fullname, email, username, password, securityQuestion, securityAnswer);

        // Redirect to login page with a success message
        response.sendRedirect("login.jsp?signup=success");
    }

    private boolean isUserExists(String username) throws IOException {
        File file = new File(getServletContext().getRealPath(USER_FILE));

        // If file doesn't exist, no users exist yet
        if (!file.exists()) {
            return false;
        }

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split("\\|");
                if (parts.length > 2 && parts[2].equals(username)) {
                    return true;
                }
            }
        }
        return false;
    }

    private void saveUser(String fullname, String email, String username, String password,
                          String securityQuestion, String securityAnswer) throws IOException {
        File file = new File(getServletContext().getRealPath(USER_FILE));

        try (PrintWriter writer = new PrintWriter(new FileWriter(file, true))) {
            // Format: fullname|email|username|password|securityQuestion|securityAnswer
            writer.println(fullname + "|" + email + "|" + username + "|" + password + "|" +
                    securityQuestion + "|" + securityAnswer);
        }
    }
}