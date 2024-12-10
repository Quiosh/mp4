<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate, max-age=0");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    if (session != null && session.getAttribute("role") != null) {
        String role = (String) session.getAttribute("role");
        if ("admin".equals(role)) {
            response.sendRedirect("error403.jsp");
            return;
        } else if ("guest".equals(role)) {
            response.sendRedirect("error403.jsp");
            return;
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home Page</title>
        <link rel="stylesheet" href="./css/styles.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <header>
        <h>ICS2608 / 2CSA / LEE, KO HAN / REYES, LAWRENCE NEIL</h>
    </header>
    <style>
        header {
            color: black;
            background-color: #F21732;
            height: 25px;
            line-height: 25px;
            font-size: 1rem;
            text-align: center;
            margin: 0;
            padding: 0;
        }

        body {
            background-color: #000000 !important;
            color: white;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
        }
        .nav-link {
            text-decoration: none;
            color: white;
            padding: 8px 12px;
            background-color: #FF0000;
            border-radius: 4px;
        }
        .nav-link:hover {
            background-color: #555;
        }

        nav {
            text-align: center;
            margin-top: 20px;
        }

        main {
            text-align: center;
            margin-top: 50px;
        }

        h2 {
            font-size: 1.5rem;
            color: #333;
            margin-bottom: 10px;
        }

        p {
            font-size: 1rem;
            color: #FFF;
            margin-bottom: 20px;
        }

        .login-btn {
            display: inline-block;
            padding: 10px 20px;
            font-size: 1rem;
            color: white;
            background-color: #F21732;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 20px;
            text-decoration: none;
        }

        .login-btn:hover {
            background-color: #555;
        }

        main {
            flex: 1;
        }

        footer {
            background-color: transparent;
            text-align: center;
            padding: 10px 0;
            color: white;
        }

        footer span {
            color: white;
        }
    </style>
</head>
<body>
    <main>
        <img src="./images/logo.png" alt="Restaurant Logo" class="logo">
        <p>Reserve Your Spot Today!</p>

        <a href="login.jsp" class="login-btn">Login</a>
    </main>

    <footer>
        <p id="footer">
            <span>MP4 - ${applicationScope.currentDateTime}</span>
        </p>
    </footer>
</body>
</html>