import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/CancelBookingServlet")
public class CancelBookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookingId = request.getParameter("bookingId");
        String username = (String) request.getSession().getAttribute("username");

        if (username == null || username.isEmpty()) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "You must be logged in to cancel bookings");
            return;
        }

        String bookingsFilePath = getServletContext().getRealPath("/WEB-INF/bookings.txt");
        File bookingsFile = new File(bookingsFilePath);

        // Create temp file
        File tempFile = new File(bookingsFile.getAbsolutePath() + ".tmp");

        try (BufferedReader reader = new BufferedReader(new FileReader(bookingsFile));
             BufferedWriter writer = new BufferedWriter(new FileWriter(tempFile))) {

            String line;
            boolean found = false;

            while ((line = reader.readLine()) != null) {
                String[] bookingData = line.split("\\|");
                if (bookingData.length >= 2 &&
                        bookingData[0].equals(username) &&
                        bookingData[1].equals(bookingId)) {
                    found = true;
                    continue; // Skip writing this line (effectively deleting it)
                }
                writer.write(line + System.lineSeparator());
            }

            if (!found) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Booking not found");
                return;
            }

        } catch (IOException e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing cancellation");
            return;
        }

        // Delete original file
        if (!bookingsFile.delete()) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Could not delete old bookings file");
            return;
        }

        // Rename temp file
        if (!tempFile.renameTo(bookingsFile)) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Could not rename temp file");
            return;
        }

        response.setStatus(HttpServletResponse.SC_OK);
    }
}