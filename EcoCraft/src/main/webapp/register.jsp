<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isErrorPage="false" %>

<%
    // Check if there is an error query parameter (e.g., email already exists)
    String error = request.getParameter("error");
    String message = null;
    if ("exists".equals(error)) {
        message = "This email is already registered. Please try another.";
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>EcoCraft - Register</title>
    <link rel="stylesheet" href="css/styles.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to bottom right, #bfffd2, #e8fff0);
            margin: 0;
            padding: 0;
        }
        .auth-container {
            max-width: 420px;
            margin: 60px auto;
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 5px 25px rgba(0,0,0,0.1);
        }
        .auth-container h2 {
            text-align: center;
            color: #2ea44f;
            margin-bottom: 25px;
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
        .error-message {
            color: red;
            font-weight: bold;
            text-align: center;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>

<div class="auth-container">
    <h2>Create Your Account</h2>

    <% if (message != null) { %>
        <div class="error-message"><%= message %></div>
    <% } %>

    <!-- Form submits to RegisterServlet -->
     <form action="${pageContext.request.contextPath}/register" method="post">
        <input type="text" name="name" placeholder="Full Name" required>
        <input type="email" name="email" placeholder="Email Address" required>
        <input type="password" name="password" placeholder="Create Password" required>
        <button type="submit">Register</button>
    </form>

    <div class="small-link">
        Already have an account? <a href="login.jsp">Login here</a>
    </div>
</div>

</body>
</html>
