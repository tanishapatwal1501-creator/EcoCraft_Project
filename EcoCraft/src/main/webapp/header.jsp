<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
    .site-header {
        background-color: #1f7d3b;
        color: white;
        padding: 15px 30px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }

    .logo-wrap {
        display: flex;
        align-items: center;
        gap: 15px;
    }

    .logo {
        width: 50px;
        height: 50px;
        border-radius: 50%;
        background-color: white;
        padding: 5px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.2);
    }

    .logo-wrap h1 {
        margin: 0;
        font-size: 28px;
        color: white;
    }

    nav {
        display: flex;
        gap: 20px;
    }

    nav a {
        color: white;
        text-decoration: none;
        font-weight: 500;
        padding: 8px 15px;
        border-radius: 5px;
        transition: background-color 0.3s;
    }

    nav a:hover {
        background-color: rgba(255, 255, 255, 0.2);
    }
</style>

<header class="site-header">
    <div class="logo-wrap">
        <img src="assets/logo.png" class="logo" alt="EcoCraft Logo">
        <h1>EcoCraft</h1>
    </div>

    <nav>
        <a href="index.jsp">Home</a>
        <a href="playlist.jsp">Tutorials</a>
        <a href="upload.jsp">Upload</a>
        <a href="leaderboard.jsp">Leaderboard</a>
        <a href="chat.jsp">Chat</a>

        <% 
            String userName = (String) session.getAttribute("userName");
            if (userName == null) { 
        %>
            <a href="login.jsp">Login</a>
            <a href="register.jsp">Register</a>

        <% } else { %>
            <a href="logout">Logout</a>
        <% } %>
    </nav>
</header>
