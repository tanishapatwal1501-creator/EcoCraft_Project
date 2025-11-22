package com.ecocraft.servlet;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.*;
import java.lang.reflect.Type;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.locks.ReentrantReadWriteLock;

public class ChatServlet extends HttpServlet {

    private final Gson gson = new Gson();
    private static final ReentrantReadWriteLock lock = new ReentrantReadWriteLock();

    private File getChatFile() {
        String path = getServletContext().getRealPath("/data/chat.json");
        return new File(path);
    }

    private List<Map<String, String>> readMessages() {
        File file = getChatFile();
        if (!file.exists()) return new ArrayList<>();

        lock.readLock().lock();
        try (Reader reader = new InputStreamReader(new FileInputStream(file), StandardCharsets.UTF_8)) {
            Type type = new TypeToken<List<Map<String, String>>>() {}.getType();
            return gson.fromJson(reader, type);
        } catch (Exception e) {
            return new ArrayList<>();
        } finally {
            lock.readLock().unlock();
        }
    }

    private void writeMessages(List<Map<String, String>> messages) {
        File file = getChatFile();
        file.getParentFile().mkdirs();

        lock.writeLock().lock();
        try (Writer writer = new OutputStreamWriter(new FileOutputStream(file), StandardCharsets.UTF_8)) {
            gson.toJson(messages, writer);
        } catch (Exception ignored) {
        } finally {
            lock.writeLock().unlock();
        }
    }


    // ------------------ GET: FETCH MESSAGES ------------------
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        List<Map<String, String>> messages = readMessages();

        resp.setContentType("application/json");
        resp.getWriter().write(gson.toJson(messages));
    }


    // ------------------ POST: SEND MESSAGE ------------------
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("userName") == null) {
            resp.sendError(403, "Login required");
            return;
        }

        String user = (String) session.getAttribute("userName");
        String message = req.getParameter("message");

        if (message == null || message.trim().isEmpty()) {
            resp.sendError(400, "Empty message");
            return;
        }

        List<Map<String, String>> messages = readMessages();

        Map<String, String> entry = new LinkedHashMap<>();
        entry.put("user", user);
        entry.put("time", new Date().toString());
        entry.put("message", message.trim());

        messages.add(entry);

        writeMessages(messages);

        resp.setStatus(204);
    }
}
