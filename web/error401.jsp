<%@ page contentType="text/html;charset=UTF-8" %>

<%
    response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate, max-age=0");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    if (session != null) {
        session.invalidate();
    }
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>401 - Unauthorized</title>
        <link rel="stylesheet" href="./css/styles.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    </head>
    <body>
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

            footer {
                background-color: transparent;
                text-align: center;
                margin-top: 20px;
            }

            footer span {
                color: white;
            }
            main {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                gap: 20px;
                flex-grow: 1;
            }
        </style>
        <main>
            <h2>Error 401: Unauthorized</h2>
            <p>You need to be logged in in order to view this content.</p>
            <a href="login.jsp">Return to Login</a>
        </main>

        <footer>
            <p id="footer">
                <span>MP4 - ${applicationScope.currentDateTime}</span>
            </p>
        </footer>
    </body>
</html>