
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String error = request.getParameter("error"); %>

<div class="auth-container">
    <h2>Login</h2>

    <% if ("notfound".equals(error)) { %>
        <p style="color:red; text-align:center;">User not found!</p>
    <% } else if ("wrongpass".equals(error)) { %>
        <p style="color:red; text-align:center;">Incorrect password!</p>
    <% } %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>EcoCraft Login</title>
    <link rel="stylesheet" href="css/styles.css">

    <style>
        .auth-container {
            max-width: 420px;
            margin: 50px auto;
            background: white;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 5px 25px rgba(0,0,0,0.1);
        }
        .auth-container h2 {
            text-align: center;
            color: #2ea44f;
            margin-bottom: 20px;
        }
        .auth-container input {
            width: 100%;
            padding: 12px;
            margin-top: 12px;
            border-radius: 10px;
            border: 1px solid #bbb;
        }
        .auth-container button {
            width: 100%;
            margin-top: 20px;
            padding: 12px;
            background: #2ea44f;
            color: white;
            border: none;
            border-radius: 10px;
            font-weight: bold;
            cursor: pointer;
        }
        .auth-container button:hover {
            background: #238a3b;
        }
        .small-link {
            text-align: center;
            margin-top: 15px;
        }
        .small-link a {
            color: #22863a;
            font-weight: bold;
        }
    </style>
</head>

<body>

<header class="site-header">
        <h1>EcoCraft Login</h1>
    </div>
</header>

<div class="auth-container">
    <h2>Login</h2>

    <form action="login" method="post">
        <input type="email" name="email" placeholder="Enter Email" required>
        <input type="password" name="password" placeholder="Enter Password" required>

        <button type="submit">Login</button>
    </form>

    <div class="small-link">
        New user? <a href="register.jsp">Register here</a>
    </div>
</div>

</body>
</html>
