package com.ecocraft.servlet;

import com.ecocraft.service.UserService;
import java.io.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        boolean success = UserService.registerUser(username, email, password);
        
        if (success) {
            request.setAttribute("success", "Registration successful! Please login.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Username already exists");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.sendRedirect("register.jsp");
    }
}