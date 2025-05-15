package com.Authentication;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final String USER_FILE = "../Users.txt";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form parameters
        String usernameOrEmail = request.getParameter("username");
        String password = request.getParameter("password");

        // Validate input
        if (usernameOrEmail == null || password == null || usernameOrEmail.isEmpty() || password.isEmpty()) {
            response.sendRedirect("login.jsp?error=missing_fields");
            return;
        }

        // Authenticate user
        User user = authenticateUser(usernameOrEmail, password);

        if (user != null) {
            // Create session and store user information
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            // Redirect to home page or dashboard
            response.sendRedirect("index.jsp");
        } else {
            // Authentication failed
            response.sendRedirect("login.jsp?error=invalid_credentials");
        }
    }

    private User authenticateUser(String usernameOrEmail, String password) throws IOException {
        File file = new File(getServletContext().getRealPath(USER_FILE));

        // If file doesn't exist, no users exist yet
        if (!file.exists()) {
            return null;
        }

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split("\\|");
                if (parts.length >= 6) {
                    // Check if username or email matches and password is correct
                    if ((parts[2].equals(usernameOrEmail) || parts[1].equals(usernameOrEmail))) {
                        // In production, you would compare hashed passwords
                        if (parts[3].equals(password)) {
                            return new User(parts[0], parts[1], parts[2], parts[4], parts[5]);
                        }
                    }
                }
            }
        }
        return null;
    }

    // Simple User class to store user information
    public static class User implements Serializable {
        private String fullname;
        private String email;
        private String username;
        private String securityQuestion;
        private String securityAnswer;

        public User(String fullname, String email, String username,
                    String securityQuestion, String securityAnswer) {
            this.fullname = fullname;
            this.email = email;
            this.username = username;
            this.securityQuestion = securityQuestion;
            this.securityAnswer = securityAnswer;
        }

        // Getters
        public String getFullname() { return fullname; }
        public String getEmail() { return email; }
        public String getUsername() { return username; }
        public String getSecurityQuestion() { return securityQuestion; }
        public String getSecurityAnswer() { return securityAnswer; }
    }
}