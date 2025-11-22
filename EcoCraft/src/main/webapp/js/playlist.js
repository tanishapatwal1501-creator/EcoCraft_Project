// Fetch videos from backend JSON (via servlet or static file)
function loadVideos() {
    fetch("data/videos.json") // directly reading JSON from webapp/data
        .then(res => res.json())
        .then(videos => {
            let list = document.getElementById("videoList");
            list.innerHTML = "";

            videos.forEach(v => {
                list.innerHTML += `
                    <div class="video-card" onclick="openVideo('${v.id}')">
                        <img src="assets/banner.jpg">
                        <h4>${v.title}</h4>
                        <p>${v.category}</p>
                    </div>
                `;
            });
        });
}

loadVideos();

// Open video player
function openVideo(id) {

    fetch("data/videos.json")
        .then(res => res.json())
        .then(videos => {

            let v = videos.find(x => x.id === id);
            if (!v) return;

            document.getElementById("playerSection").style.display = "block";
            document.getElementById("videoTitle").innerText = v.title;
            document.getElementById("mainVideo").src = "uploads/" + v.filename;

            document.getElementById("commentVideoId").value = v.id;

            // Load comments
            let cbox = document.getElementById("comments");
            cbox.innerHTML = "";

            if (v.comments.length === 0) {
                cbox.innerHTML = "<p>No comments yet</p>";
            } else {
                v.comments.forEach(c => {
                    cbox.innerHTML += `
                        <div class="comment">
                            <b>${c.userId.substring(0, 6)}</b>: ${c.content}
                            <div style="font-size:11px;color:#555;">${new Date(c.createdAt).toLocaleString()}</div>
                        </div>
                    `;
                });
            }
        });
}
