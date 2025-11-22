<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>EcoCraft Tutorials</title>
    <link rel="stylesheet" href="css/styles.css">
    <style>
        .playlist-container {
            max-width: 1100px;
            margin: 30px auto;
            padding: 20px;
        }

        .video-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
        }

        .video-card {
            background: white;
            padding: 15px;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
            cursor: pointer;
            transition: 0.2s;
        }

        .video-card:hover {
            transform: scale(1.03);
        }

        .video-card img {
            width: 100%;
            border-radius: 10px;
        }

        .player-box {
            margin-top: 35px;
            padding: 20px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 25px rgba(0,0,0,0.1);
        }

        #comments {
            margin-top: 15px;
        }

        .comment {
            background: #e6ffe6;
            padding: 10px;
            border-radius: 6px;
            margin-bottom: 10px;
        }

        #commentText {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
        }

        #postBtn {
            margin-top: 10px;
            padding: 10px;
            background: #2ea44f;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }
        #postBtn:hover {
            background: #238a3b;
        }
    </style>
</head>
<body>

<header class="site-header">
        <h1>EcoCraft Tutorials</h1>
    </div>
    <nav>
        <a href="index.html">Home</a>
        <a href="upload.html">Upload</a>
        <a href="leaderboard.html">Leaderboard</a>
        <a href="chat.html">Chat</a>
    </nav>
</header>

<div class="playlist-container">
    <h2>All Tutorials</h2>

    <div id="videoList" class="video-grid"></div>

    <div id="playerSection" class="player-box" style="display:none;">
        <h3 id="videoTitle"></h3>
        <video id="mainVideo" width="100%" controls></video>

        <h4 style="margin-top:20px;">Comments</h4>
        <div id="comments"></div>

        <form id="commentForm" method="post" action="comment">
            <input type="hidden" name="videoId" id="commentVideoId">
            <textarea id="commentText" name="content" placeholder="Write a comment..."></textarea>
            <button id="postBtn" type="submit">Post Comment</button>
        </form>
    </div>
</div>

<script src="js/playlist.js"></script>
</body>
</html>
