package com.ecocraft.servlet;

import com.ecocraft.service.AllInOneService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,      // 1MB
        maxFileSize = 1024 * 1024 * 200,      // 200MB
        maxRequestSize = 1024 * 1024 * 250    // 250MB
)
public class VideoUploadServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            resp.sendRedirect("login.jsp?error=login_required");
            return;
        }

        String userId = (String) session.getAttribute("userId");

        String title = req.getParameter("title");
        String descr = req.getParameter("descr");
        String category = req.getParameter("category");

        Part mediaPart = req.getPart("media");

        // original file name
        String originalName = mediaPart.getSubmittedFileName();
        String newFileName = System.currentTimeMillis() + "_" + originalName;

        // upload directory inside webapp
        String uploadPath = getServletContext().getRealPath("/uploads");
        File uploadDir = new File(uploadPath);

        if (!uploadDir.exists()) uploadDir.mkdirs();

        // save file physically
        mediaPart.write(uploadPath + File.separator + newFileName);

        // save meta info in JSON
        AllInOneService service = new AllInOneService(getServletContext());
        service.addVideo(userId, title, descr, newFileName, category);

        // give user points
        service.addPoints(userId, 10);

        // redirect to playlist page
        resp.sendRedirect("playlist.jsp?upload=success");
    }
}
