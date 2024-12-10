package myservlets;

import model.Reservation;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ReservationServlet extends HttpServlet {
    private List<Reservation> reservations;

    @Override
    public void init() throws ServletException {
        super.init();
        ServletContext context = getServletContext();

        try {
            Object reservationsAttribute = context.getAttribute("reservations");

            if (reservationsAttribute == null) {
                reservations = new ArrayList<>();
                context.setAttribute("reservations", reservations);
            } else if (reservationsAttribute instanceof List) {
                reservations = (List<Reservation>) reservationsAttribute;
            } else {
                throw new ServletException("Unexpected type for 'reservations' in ServletContext");
            }
        } catch (Exception e) {
            throw new ServletException("Failed to initialize ReservationServlet", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("delete".equalsIgnoreCase(action)) {
            try {
                int reservationId = Integer.parseInt(request.getParameter("reservationId"));
                reservations.removeIf(res -> res.getId() == reservationId);
                response.sendRedirect("admin.jsp");
            } catch (Exception e) {
                response.sendRedirect("error500.jsp?error=An error occurred while deleting the reservation");
            }
        } else {
            try {
                String name = request.getParameter("name");
                String dateStr = request.getParameter("date");
                String timeStr = request.getParameter("time");
                String guestsStr = request.getParameter("guests");

                if (name == null || dateStr == null || timeStr == null || guestsStr == null) {
                    response.sendRedirect("guest.jsp?error=Missing required fields");
                    return;
                }

                int guests;
                try {
                    guests = Integer.parseInt(guestsStr);
                } catch (NumberFormatException e) {
                    response.sendRedirect("guest.jsp?error=Invalid number of guests");
                    return;
                }

                Date date;
                try {
                    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
                    date = formatter.parse(dateStr + " " + timeStr);
                } catch (ParseException e) {
                    response.sendRedirect("guest.jsp?error=Invalid date format");
                    return;
                }

                int reservationId = reservations.size() + 1;
                Reservation reservation = new Reservation(reservationId, name, date, timeStr, guests);

                reservations.add(reservation);

                response.sendRedirect("success.jsp");
            } catch (Exception e) {
                response.sendRedirect("error500.jsp?error=An unexpected error occurred while processing your request");
            }
        }
    }
}