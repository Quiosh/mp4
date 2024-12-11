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
        <title>Reservation Success</title>
        <link rel="stylesheet" href="./css/styles.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <header>
        <h>ICS2608 / 2CSA / LEE, KO HAN / REYES, LAWRENCE NEIL</h>
    </header>
    <style>
        body {
            background-color: #000000;
            color: white;
            display: flex;
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
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            gap: 20px;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 300px;
            color: black;
            margin-top: 50px;
        }

        h2 {
            font-size: 1.5rem;
            color: #F21732;
            text-align: center;
        }

        p {
            font-size: 1rem;
            color: #555;
            text-align: center;
        }

        .button {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 4px;
            background-color: #F21732;
            color: white;
            cursor: pointer;
            font-size: 1rem;
        }

        .button:hover {
            background-color: #555;
        }

        footer {
            background-color: transparent;
            text-align: center;
            margin-top: 20px;
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
        <h2>Your Reservation Was Successful!</h2>
        <p>Please arrive at the restaurant on the chosen date and time with an I.D that shows your full name.</p>
        <p>Want to reserve on another time? Press the "Reserve again" button.

        <form action="guest.jsp" method="post">
            <button type="submit" class="button">Reserve Again</button>
        </form>
        <form action="logout.jsp" method="post">
            <button type="submit" class="button">Logout</button>
        </form>

    </main>

    <footer>
        <p id="footer">
            <span>MP4 - ${applicationScope.currentDateTime}</span>
        </p>
    </footer>
</body>
</html>