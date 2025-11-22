package com.ecocraft.servlet;

import com.ecocraft.service.AllInOneService;
import com.ecocraft.service.AllInOneService.User;
import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Comparator;
import java.util.List;

public class LeaderboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        AllInOneService service = new AllInOneService(getServletContext());

        // load all users
        List<User> users = service.getUsers();

        // sort by points (high → low)
        users.sort(Comparator.comparingInt(u -> -u.points));

        // convert to JSON
        String json = new Gson().toJson(users);

        // return JSON to frontend
        resp.setContentType("application/json");
        resp.getWriter().write(json);
    }
}
