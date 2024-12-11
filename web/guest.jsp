<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate, max-age=0");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    if (session == null) {
        response.sendRedirect("error401.jsp");
        return;
    }

    if ("admin".equals(session.getAttribute("role"))) {
        response.sendRedirect("error403.jsp");
        return;
    }

    if (!"guest".equals(session.getAttribute("role"))) {
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
        <title>Guest Page</title>
        <link rel="stylesheet" href="./css/styles.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <header>
        <h>ICS2608 / 2CSA / LEE, KO HAN / REYES, LAWRENCE NEIL</h>
    </header>
    <style>
        body {
            background-color: #000000 !important;
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
        }

        main {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            gap: 20px;
            flex-grow: 1;
        }

        form {
            width: 300px;
            display: flex;
            flex-direction: column;
            gap: 10px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #fff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            color: black;
        }

        input, button {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            color: white;
            background-color: #F21732;
            border: none;
            cursor: pointer;
        }

        button:hover {
            background-color: #555;
        }

        .nav-link {
            text-decoration: none;
            color: white;
            background-color: #F21732;
            padding: 8px 12px;
            border-radius: 4px;
            display: inline-block;
            margin-top: 20px;
        }

        .nav-link:hover {
            background-color: #555;
        }

        h2 {
            font-size: 1.5rem;
            color: white;
            margin-top: 30px;
        }

        p {
            font-size: 1rem;
            color: #ccc;
        }
        footer {
            background-color: transparent;
            text-align: center;
            margin-top: 30px;
        }

    </style>
</head>
<body>
    <main>
        <h2>Welcome, Guest!</h2>
        <p>You can make reservations here.</p>

        <form action="ReservationServlet" method="post" onsubmit="return validateForm()">
            <label for="name">Name (a-z, symbols):</label>
            <input type="text" id="name" name="name" placeholder="Your Name" required>

            <label for="date">Date:</label>
            <input type="date" id="date" name="date" required>

            <label for="time">Time:</label>
            <input type="time" id="time" name="time" required>

            <label for="guests">Number of Guests (max = 99):</label>
            <input type="number" id="guests" name="guests" min="1" placeholder="Number of Guests" required>

            <button type="submit">Make Reservation</button>
        </form>

        <a href="logout.jsp" class="nav-link">Logout</a>
    </main>

    <footer>
        <p id="footer">
            <span>MP4 - ${applicationScope.currentDateTime}</span>
        </p>
    </footer>

    <script>
        function validateForm() {
            const nameField = document.getElementById('name');
            const nameValue = nameField.value;

            if (/\d/.test(nameValue)) {
                window.location.href = "error400.jsp";
                return false;
            }

            const guestsInput = document.getElementById('guests');
            const guestsValue = parseInt(guestsInput.value, 10);

            if (guestsValue > 99) {
                window.location.href = "error400.jsp";
                return false;
            }

            return true;
        }
    </script>
</body>
</html>