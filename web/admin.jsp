<%@ page import="model.Reservation" %>
<%@ page import="java.util.List" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate, max-age=0");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    if (session == null) {
        response.sendRedirect("error403.jsp");
        return;
    }

    if ("guest".equals(session.getAttribute("role"))) {
        response.sendRedirect("error403.jsp");
        return;
    }

    if (!"admin".equals(session.getAttribute("role"))) {
        session.invalidate();
        response.sendRedirect("error401.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Page</title>
        <link rel="stylesheet" href="./css/styles.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <header>
        <h>ICS2608 / 2CSE / AMMANG, JODIMEER / GALANG, MARK ARMI</h>
    </header>
    <style>
        body {
            background-color: #000000;
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            padding: 0;
        }

        header {
            color: black;
            background-color: #F21732;
            height: 25px;
            line-height: 25px;
            font-size: 1rem;
            text-align: center;
            margin: 0;
            padding: 0;
            width: 100%;
            position: fixed;
            top: 0;
        }

        main {
            margin-top: 60px;
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
        }

        h2 {
            font-size: 1.5rem;
            color: #F21732;
            margin-bottom: 10px;
        }

        table {
            width: 90%;
            margin: 20px 0;
            border-collapse: collapse;
            background-color: white;
            color: black;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        }

        th {
            background-color: #F21732;
            color: white;
            padding: 15px;
            text-align: center;
        }

        td {
            padding: 10px;
            text-align: center;
        }

        tr:nth-child(even) {
            background-color: #f8f8f8;
        }

        tr:nth-child(odd) {
            background-color: #ffffff;
        }

        .button {
            background-color: #F21732;
            color: white;
            padding: 8px 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1rem;
        }

        .button:hover {
            background-color: #555;
        }

        footer {
            background-color: transparent;
            text-align: center;
            color: white;
            position: fixed;
            bottom: 10px;
            width: 100%;
        }

        footer span {
            color: white;
        }
    </style>
</head>
<body>
    <main>
        <h2>Admin Panel - Reservations Overview</h2>
        <p>Here are the current reservations:</p>

        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Number of Guests</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Reservation> reservations = (List<Reservation>) application.getAttribute("reservations");
                    if (reservations != null) {
                        for (Reservation reservation : reservations) {
                %>
                <tr>
                    <td><%= reservation.getName()%></td>
                    <td><%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(reservation.getDate())%></td>
                    <td><%= reservation.getTime()%></td>
                    <td><%= reservation.getNumberOfGuests()%></td>
                    <td>
                        <form action="ReservationServlet" method="post" style="display:inline;">
                            <input type="hidden" name="reservationId" value="<%= reservation.getId()%>">
                            <input type="hidden" name="action" value="delete">
                            <button type="submit" class="button">Delete</button>
                        </form>
                    </td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="5">No reservations found.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>

        <a href="logout.jsp" class="button">Logout</a>
    </main>

    <footer>
        <p id="footer">
            <span>MP4 - ${applicationScope.currentDateTime}</span>
        </p>
    </footer>
</body>
</html>