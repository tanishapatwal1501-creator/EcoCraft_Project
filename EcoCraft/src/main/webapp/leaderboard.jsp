<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>EcoCraft Leaderboard</title>
    <link rel="stylesheet" href="css/styles.css">

    <style>
        .leader-container {
            max-width: 900px;
            margin: 40px auto;
            padding: 20px;
        }

        .leader-card {
            background: white;
            padding: 15px 20px;
            margin-bottom: 12px;
            border-radius: 12px;
            box-shadow: 0 4px 18px rgba(0,0,0,0.08);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .rank {
            font-size: 22px;
            font-weight: bold;
            color: #2ea44f;
        }

        .name {
            font-size: 18px;
            font-weight: bold;
        }

        .points {
            background: #d7fad7;
            padding: 8px 15px;
            border-radius: 8px;
            font-weight: bold;
            color: #1a7c2b;
        }
    </style>
</head>

<body>

<header class="site-header">
        <h1>EcoCraft Leaderboard</h1>
    </div>
    <nav>
        <a href="index.html">Home</a>
        <a href="playlist.html">Tutorials</a>
        <a href="upload.html">Upload</a>
        <a href="chat.html">Chat</a>
    </nav>
</header>

<div class="leader-container">
    <h2>Top EcoCraft Contributors</h2>
    <div id="leaderList"></div>
</div>

<script src="js/leaderboard.js"></script>

</body>
</html>
