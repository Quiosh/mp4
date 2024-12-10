package myservlets;

import model.User;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    private String loginMessage;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        loginMessage = config.getInitParameter("loginMessage");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("loginMessage", loginMessage);
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = User.authenticate(username, password);

        if (user != null) {
            HttpSession oldSession = request.getSession(false);
            if (oldSession != null) {
                oldSession.invalidate();
            }

            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            System.out.println("User role: " + user.getRole());

            if ("admin".equalsIgnoreCase(user.getRole())) {
                response.sendRedirect("admin.jsp");
            } else if ("guest".equalsIgnoreCase(user.getRole())) {
                response.sendRedirect("index.jsp");
            }
        } else {
            response.sendRedirect("login.jsp?error=Invalid+credentials");
        }
    }
}