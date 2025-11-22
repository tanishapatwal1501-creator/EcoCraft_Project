<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>EcoCraft — Upload Tutorial</title>
    <link rel="stylesheet" href="css/styles.css">

    <style>
        .upload-container {
            max-width: 700px;
            margin: 40px auto;
            background: white;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 5px 25px rgba(0,0,0,0.1);
        }

        .upload-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #2ea44f;
        }

        .upload-container label {
            font-weight: bold;
            display: block;
            margin-top: 15px;
        }

        .upload-container input,
        .upload-container textarea,
        .upload-container select {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
            margin-top: 5px;
        }

        .upload-container button {
            margin-top: 20px;
            width: 100%;
            padding: 12px;
            background: #2ea44f;
            color: white;
            font-size: 17px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-weight: bold;
        }

        .upload-container button:hover {
            background: #238a3b;
        }
    </style>
</head>

<body>

<header class="site-header">
        <h1>EcoCraft Upload</h1>
    </div>
    <nav>
        <a href="index.jsp">Home</a>
        <a href="playlist.jsp">Tutorials</a>
        <a href="leaderboard.jsp">Leaderboard</a>
        <a href="chat.jsp">Chat</a>
    </nav>
</header>

<div class="upload-container">
    <h2>Upload Your Craft / Tutorial</h2>

    <form action="videos/upload" method="post" enctype="multipart/form-data">

        <label>Title</label>
        <input type="text" name="title" required>

        <label>Description</label>
        <textarea name="descr" rows="3" required></textarea>

        <label>Category</label>
        <select name="category" required>
            <option value="Plastic Craft">Plastic Craft</option>
            <option value="Kitchen Wet Waste">Kitchen Wet Waste</option>
            <option value="Old Cloth Reuse">Old Cloth Reuse</option>
        </select>

        <label>Select Video or Image</label>
        <input type="file" name="media" accept="video/*,image/*" required>

        <button type="submit">Upload</button>
    </form>
</div>

</body>
</html>
