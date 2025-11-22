<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>EcoCraft Chat Support</title>
    <link rel="stylesheet" href="css/styles.css">
    <style>
        .chat-container {
            max-width: 700px;
            margin: 40px auto;
            padding: 20px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 25px rgba(0,0,0,0.1);
        }

        #chatBox {
            height: 400px;
            overflow-y: auto;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 10px;
            background: #f9f9f9;
        }
        .msg {
            background: #d7f8d7;
            padding: 10px;
            margin: 8px 0;
            border-radius: 8px;
            font-size: 15px;
        }
        .msg .user {
            font-weight: bold;
            color: #008000;
        }
        .msg .time {
            font-size: 11px;
            color: #777;
        }

        #messageInput {
            width: 100%;
            padding: 12px;
            margin-top: 15px;
            border-radius: 7px;
            border: 1px solid #bbb;
        }

        #sendBtn {
            width: 100%;
            margin-top: 10px;
            padding: 12px;
            border: none;
            background: #2ea44f;
            color: white;
            font-weight: bold;
            border-radius: 7px;
            cursor: pointer;
        }
        #sendBtn:hover {
            background: #22863a;
        }
    </style>
</head>
<body>

<header class="site-header">
        <h1>EcoCraft Chat Support</h1>
    </div>
    <nav>
        <a href="index.jsp">Home</a>
        <a href="playlist.jsp">Tutorials</a>
        <a href="leaderboard.jsp">Leaderboard</a>
        <a href="chat.jsp" style="font-weight:bold;color:#2ea44f">Chat</a>
    </nav>
</header>

<div class="chat-container">
    <h2>Need Help? Chat with EcoCraft Support</h2>

    <div id="chatBox"></div>

    <textarea id="messageInput" placeholder="Type your message..."></textarea>
    <button id="sendBtn">Send</button>
</div>

<script src="js/chat.js"></script>

</body>
</html>
