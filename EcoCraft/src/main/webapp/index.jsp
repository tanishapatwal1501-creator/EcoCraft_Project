<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>EcoCraft - Home</title>
    <link rel="stylesheet" href="css/styles.css">
    <style>
        body {
            background: linear-gradient(to bottom right, #bfffd2, #e8fff0);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            color: #333;
        }

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
            background-color: rgba(255,255,255,0.2);
        }

        .hero {
            max-width: 1000px;
            margin: 40px auto;
            display: flex;
            align-items: center;
            gap: 30px;
            padding: 0 20px;
        }

        .hero img {
            width: 330px;
            border-radius: 20px;
            box-shadow: 0 5px 25px rgba(0,0,0,0.15);
        }

        .hero-text h2 {
            color: #1f7d3b;
            font-size: 30px;
            margin-bottom: 15px;
        }

        .hero-text p {
            font-size: 17px;
            line-height: 1.5;
        }

        .section {
            max-width: 1000px;
            background: white;
            margin: 40px auto;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        }

        .section h2 {
            color: #22863a;
            margin-bottom: 15px;
            text-align: center;
            font-size: 26px;
        }

        .buttons {
            text-align: center;
            margin-top: 25px;
        }

        .btn {
            padding: 12px 25px;
            background: #2ea44f;
            color: white;
            border-radius: 10px;
            text-decoration: none;
            font-weight: bold;
            margin: 10px;
            display: inline-block;
            transition: all 0.3s ease;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        }
        .btn:hover {
            background: #238a3b;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        .principle-box {
            background: #e8ffe9;
            padding: 20px;
            border-radius: 15px;
            margin: 20px 0;
            border-left: 5px solid #2ea44f;
            transition: transform 0.3s ease;
        }

        .principle-box:hover {
            transform: translateX(5px);
        }

        .principle-box h3 {
            color: #1f7d3b;
            margin-top: 0;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .principle-box h3::before {
            content: "🌿";
        }

        .principles-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }

        .principle-card {
            background: #f0fff0;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.08);
            transition: all 0.3s ease;
        }

        .principle-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        .principle-card h4 {
            color: #1f7d3b;
            margin-top: 0;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .principle-number {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 30px;
            height: 30px;
            background-color: #2ea44f;
            color: white;
            border-radius: 50%;
            font-size: 14px;
            font-weight: bold;
            margin-right: 10px;
        }

        footer {
            background-color: #1f7d3b;
            color: white;
            text-align: center;
            padding: 20px;
            margin-top: 40px;
        }
    </style>
</head>

<body>

<header class="site-header">
    <div class="logo-wrap">
        <!-- Replace with your actual logo path -->
        <img src="assets/logo.png" class="logo" alt="EcoCraft Logo">
        <h1>EcoCraft</h1>
    </div>
    <nav>
        <a href="login.jsp">Login</a>
        <a href="register.jsp">Register</a>
        <a href="playlist.jsp">Tutorials</a>
        <a href="upload.jsp">Upload</a>
        <a href="leaderboard.jsp">Leaderboard</a>
        <a href="chat.jsp">Chat</a>
    </nav>
</header>

<!-- HERO SECTION -->
<div class="hero">
    <img src="assets/banner.jpg" alt="EcoCraft Banner">
    <div class="hero-text">
        <h2>Welcome to EcoCraft</h2>
        <p>
            EcoCraft is your eco-friendly platform where users learn how to recycle,
            reuse, and recreate beautiful crafts using plastics, wet waste, old clothes, 
            and many more items that usually end up in landfills.
        </p>
    </div>
</div>

<!-- ABOUT SECTION -->
<div class="section">
    <h2>About EcoCraft</h2>
    <p>
        EcoCraft aims to reduce waste by providing step-by-step tutorials, craft ideas,
        and recycling techniques. Users can upload their eco-friendly projects, share ideas,
        comment on tutorials, participate in weekly leaderboard challenges, and earn rewards
        through our partner eco brands.
    </p>
</div>

<!-- GREEN PRINCIPLE SECTION -->
<div class="section">
    <h2>Green Chemistry: 12 Green Principles</h2>

    <div class="principle-box">
        <h3>What are Green Principles?</h3>
        <p>
            Green Chemistry principles are guidelines that encourage safe, sustainable,
            and environmentally friendly chemical processes. Their goal is to minimize waste,
            use renewable materials, reduce pollution, and improve efficiency in every step.
        </p>
    </div>

    <div class="principles-grid">
        <div class="principle-card">
            <h4><span class="principle-number">1</span> Waste Prevention</h4>
            <p>It's better to prevent waste than to treat or clean up waste after it's formed. Design chemical processes to minimize waste production.</p>
        </div>
        
        <div class="principle-card">
            <h4><span class="principle-number">2</span> Atom Economy</h4>
            <p>Maximize the incorporation of all materials used in the process into the final product to reduce waste.</p>
        </div>
        
        <div class="principle-card">
            <h4><span class="principle-number">3</span> Less Hazardous Synthesis</h4>
            <p>Design synthetic methods that use and generate substances with little or no toxicity to human health and the environment.</p>
        </div>
        
        <div class="principle-card">
            <h4><span class="principle-number">4</span> Designing Safer Chemicals</h4>
            <p>Design chemical products that are fully effective yet have little or no toxicity.</p>
        </div>
        
        <div class="principle-card">
            <h4><span class="principle-number">5</span> Safer Solvents & Auxiliaries</h4>
            <p>The use of auxiliary substances should be made unnecessary wherever possible and innocuous when used.</p>
        </div>
        
        <div class="principle-card">
            <h4><span class="principle-number">6</span> Energy Efficiency</h4>
            <p>Energy requirements should be recognized for their environmental and economic impacts and should be minimized.</p>
        </div>
        
        <div class="principle-card">
            <h4><span class="principle-number">7</span> Renewable Feedstocks</h4>
            <p>A raw material or feedstock should be renewable rather than depleting whenever technically and economically practicable.</p>
        </div>
        
        <div class="principle-card">
            <h4><span class="principle-number">8</span> Reduce Derivatives</h4>
            <p>Unnecessary derivatization should be minimized or avoided because it requires additional reagents and can generate waste.</p>
        </div>
        
        <div class="principle-card">
            <h4><span class="principle-number">9</span> Catalysis</h4>
            <p>Catalytic reagents are superior to stoichiometric reagents as they can be used in small amounts and carry out a single reaction many times.</p>
        </div>
        
        <div class="principle-card">
            <h4><span class="principle-number">10</span> Design for Degradation</h4>
            <p>Chemical products should be designed so that at the end of their function they break down into innocuous degradation products.</p>
        </div>
        
        <div class="principle-card">
            <h4><span class="principle-number">11</span> Real-time Analysis</h4>
            <p>Analytical methodologies need to be further developed to allow for real-time, in-process monitoring and control prior to the formation of hazardous substances.</p>
        </div>
        
        <div class="principle-card">
            <h4><span class="principle-number">12</span> Inherently Safer Chemistry</h4>
            <p>Substances and the form of a substance used in a chemical process should be chosen to minimize the potential for chemical accidents.</p>
        </div>
    </div>

    <div class="principle-box">
        <h3>How EcoCraft Supports These Principles</h3>
        <ul>
            <li> Encourages recycling & reuse of household waste (Principles 1, 2)</li>
            <li> Promotes creative crafting instead of throwing materials (Principles 3, 4)</li>
            <li> Helps reduce plastic and textile waste (Principles 5, 10)</li>
            <li> Weekly leaderboard motivates continuous eco-friendly behavior (Principles 6, 7)</li>
            <li> Reward system tied with e-waste brands promotes sustainability (Principles 8, 9)</li>
            <li> Educational content raises awareness about safer alternatives (Principles 11, 12)</li>
        </ul>
    </div>
</div>

<!-- BUTTON SECTION -->
<div class="buttons">
    <a class="btn" href="tutorials.jsp">Explore Tutorials</a>
    <a class="btn" href="register.jsp">Join EcoCraft</a>
    <a class="btn" href="chat.jsp">Get Support</a>
</div>

<footer>
    <p>&copy; 2025 EcoCraft. All rights reserved. | Transforming Waste into Treasure</p>
</footer>

</body>
</html>