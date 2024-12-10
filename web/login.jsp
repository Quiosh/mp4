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

    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if (username != null && password != null) {
        boolean userIsAdmin = "admin".equals(username) && "admin123".equals(password);
        boolean userIsGuest = "guest".equals(username) && "guest123".equals(password);

        if (userIsAdmin) {
            session = request.getSession();
            session.setAttribute("role", "admin");
            response.sendRedirect("admin.jsp");
            return;
        } else if (userIsGuest) {
            session = request.getSession();
            session.setAttribute("role", "guest");
            response.sendRedirect("guest.jsp");
            return;
        } else {
            response.sendRedirect("login.jsp?error=1");
            return;
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
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
            align-items: center;
            gap: 10px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #fff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        input, .button {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input::placeholder {
            color: #F21732;
        }

        .button {
            color: white;
            background-color: #F21732;
            border: none;
            cursor: pointer;
        }

        .button:hover {
            background-color: #555;
        }

        nav {
            margin-top: 20px;
            text-align: center;
            background: none;
            padding: 0;
        }

        .nav-link {
            text-decoration: none;
            color: white;
            padding: 8px 12px;
            background-color: #F21732;
            border-radius: 4px;
            display: inline-block;
        }

        .nav-link:hover {
            background-color: #555;
        }

        footer {
            background-color: transparent;
            text-align: center;
            margin-top: 20px;
        }

        footer span {
            color: white;
        }

        .intro-text {
            text-align: center;
            margin-bottom: 20px;
        }

        .intro-text h1 {
            font-size: 1.5rem;
            color: white;
        }

        .intro-text h2 {
            font-size: 1rem;
            color: #ccc;
        }
    </style>
</head>
<body>
    <main>
        <div class="intro-text">
            <h1>Login</h1>
            <h2>Stay updated on new dishes and more</h2>
        </div>

        <% if ("1".equals(request.getParameter("error"))) { %>
        <p style="color: red; text-align: center;">Invalid credentials, please try again.</p>
        <% }%>

        <form action="login.jsp" method="post">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit" class="button">Login</button>
        </form>

        <nav>
            <a href="index.jsp" class="nav-link">Home</a>
        </nav>
    </main>
    <footer>
        <p id="footer">
            <span>MP4 - ${applicationScope.currentDateTime}</span>
        </p>
    </footer>
</body>
</html>