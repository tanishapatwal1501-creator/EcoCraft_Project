// Auto-load chat messages every 2 seconds
function loadMessages() {
    fetch("chat")
        .then(res => res.json())
        .then(data => {
            let chatBox = document.getElementById("chatBox");
            chatBox.innerHTML = "";

            data.forEach(msg => {
                chatBox.innerHTML += `
                    <div class="msg">
                        <div class="user">${msg.user}</div>
                        <div>${msg.message}</div>
                        <div class="time">${msg.time}</div>
                    </div>
                `;
            });

            chatBox.scrollTop = chatBox.scrollHeight;
        });
}

loadMessages();
setInterval(loadMessages, 2000);

// Send message
document.getElementById("sendBtn").onclick = function () {
    let message = document.getElementById("messageInput").value.trim();
    if (message === "") return;

    let formData = new URLSearchParams();
    formData.append("message", message);

    fetch("chat", {
        method: "POST",
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: formData
    }).then(() => {
        document.getElementById("messageInput").value = "";
        loadMessages();
    });
};
