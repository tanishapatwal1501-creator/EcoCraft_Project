package com.ecocraft.servlet;

import com.ecocraft.service.AllInOneService;
import com.ecocraft.service.AllInOneService.Reward;

import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

public class RewardServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        // Must be logged in
        if (session == null || session.getAttribute("userId") == null) {
            resp.sendRedirect("login.jsp?error=login_required");
            return;
        }

        String userId = (String) session.getAttribute("userId");
        String partner = req.getParameter("partner");

        // Create reward code
        String rewardCode = partner.substring(0, 3).toUpperCase() + "-" + UUID.randomUUID().toString().substring(0, 6);

        AllInOneService service = new AllInOneService(getServletContext());

        Reward r = service.issueReward(userId, partner, rewardCode);

        resp.sendRedirect("rewards.html?issued=true&code=" + rewardCode);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            resp.sendRedirect("login.jsp?error=login_required");
            return;
        }

        String userId = (String) session.getAttribute("userId");

        AllInOneService service = new AllInOneService(getServletContext());
        List<Reward> rewards = service.getRewards();

        // filter rewards for this user
        rewards.removeIf(r -> !r.userId.equals(userId));

        String json = new Gson().toJson(rewards);

        resp.setContentType("application/json");
        resp.getWriter().write(json);
    }
}
