function loadLeaderboard() {
    fetch("leaderboard")
        .then(res => res.json())
        .then(users => {
            let list = document.getElementById("leaderList");
            list.innerHTML = "";

            let rank = 1;

            users.forEach(u => {
                list.innerHTML += `
                    <div class="leader-card">
                        <div class="rank">#${rank}</div>
                        <div class="name">${u.name}</div>
                        <div class="points">${u.points} pts</div>
                    </div>
                `;
                rank++;
            });
        });
}

// Load on startup
loadLeaderboard();

// Auto-refresh every 10 seconds
setInterval(loadLeaderboard, 10000);
