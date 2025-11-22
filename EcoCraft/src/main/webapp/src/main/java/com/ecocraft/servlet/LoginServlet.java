package com.ecocraft.servlet;

import com.ecocraft.service.AllInOneService;
import com.ecocraft.service.AllInOneService.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Optional;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        AllInOneService service = new AllInOneService(getServletContext());

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        // Find user by email
        Optional<User> userOpt = service.findUserByEmail(email);

        if (userOpt.isEmpty()) {
            resp.sendRedirect("login.jsp?error=notfound");
            return;
        }

        User user = userOpt.get();

        // Password check (simple text compare)
        if (!user.password.equals(password)) {
            resp.sendRedirect("login.jsp?error=wrongpass");
            return;
        }

        // Create user session
        HttpSession session = req.getSession(true);
        session.setAttribute("userId", user.id);
        session.setAttribute("userName", user.name);

        // Redirect to home
        resp.sendRedirect("index.jsp");
    }
}
