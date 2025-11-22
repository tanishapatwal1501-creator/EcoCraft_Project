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

public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        AllInOneService service = new AllInOneService(getServletContext());

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        // Check if email already exists
        Optional<User> existing = service.findUserByEmail(email);
        if (existing.isPresent()) {
            resp.sendRedirect("register.jsp?error=exists");
            return;
        }

        // Create user
        User newUser = service.createUser(name, email, password);

        // Start session
        HttpSession session = req.getSession(true);
        session.setAttribute("userId", newUser.id);
        session.setAttribute("userName", newUser.name);

        // Go to home page
        resp.sendRedirect("index.jsp");
    }
}
