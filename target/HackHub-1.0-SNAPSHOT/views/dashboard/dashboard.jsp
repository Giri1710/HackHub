<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>HackHub Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
    <style>

        /* PAGE BACKGROUND */
        body {
            margin: 0;
            min-height: 100vh;
            background: linear-gradient(135deg, #000000, #0a0f2c, #1e40af);
            background-attachment: fixed;
            color: white;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        /* MAIN CONTAINER */
        .dashboard-container {
            width: 92%;
            max-width: 1280px;
            margin: 0 auto;
            padding: 40px 0 60px;
        }

        /* WELCOME BANNER */
        .welcome-card {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border: 1px solid rgba(255, 255, 255, 0.12);
            border-radius: 24px;
            padding: 44px 40px;
            margin-bottom: 32px;
            position: relative;
            overflow: hidden;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.4);
        }

        /* animated rainbow top line on welcome card */
        .welcome-card::before {
            content: '';
            position: absolute;
            top: 0; left: 0; right: 0;
            height: 4px;
            background: linear-gradient(90deg, #f72585, #7209b7, #4361ee, #4cc9f0, #06d6a0, #f72585);
            background-size: 300% 100%;
            animation: rainbowMove 5s linear infinite;
        }

        @keyframes rainbowMove {
            0%   { background-position: 0% 0%; }
            100% { background-position: 300% 0%; }
        }

        /* glow orb top right */
        .welcome-card::after {
            content: '';
            position: absolute;
            top: -40px; right: -40px;
            width: 200px; height: 200px;
            background: radial-gradient(circle, rgba(247,37,133,0.2), transparent 70%);
            border-radius: 50%;
            pointer-events: none;
        }

        .welcome-title {
            font-size: 40px;
            font-weight: 900;
            letter-spacing: -1px;
            margin-bottom: 10px;
            line-height: 1.15;
        }

        .welcome-title .brand-pink  { color: #f72585; }
        .welcome-title .brand-blue  { color: #4cc9f0; }

        .welcome-sub {
            font-size: 17px;
            color: rgba(255, 255, 255, 0.55);
            font-weight: 400;
            letter-spacing: 0.02em;
        }

        .welcome-sub span {
            color: rgba(255, 255, 255, 0.75);
            font-weight: 600;
        }

        /* STAT CARDS ROW */
        .stats-row {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 28px;
        }

        .stat-card {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 20px;
            padding: 28px 24px;
            text-align: center;
            transition: transform 0.28s ease, box-shadow 0.28s ease, border-color 0.28s ease;
            position: relative;
            overflow: hidden;
            cursor: default;
        }

        .stat-card:hover {
            transform: translateY(-7px);
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.5);
        }

        /* unique left border colour per card */
        .stat-card:nth-child(1) { border-left: 4px solid #f72585; }
        .stat-card:nth-child(2) { border-left: 4px solid #4cc9f0; }
        .stat-card:nth-child(3) { border-left: 4px solid #06d6a0; }
        .stat-card:nth-child(4) { border-left: 4px solid #ffd60a; }

        .stat-card:nth-child(1):hover { border-color: #f72585; box-shadow: 0 20px 50px rgba(247,37,133,0.25); }
        .stat-card:nth-child(2):hover { border-color: #4cc9f0; box-shadow: 0 20px 50px rgba(76,201,240,0.25); }
        .stat-card:nth-child(3):hover { border-color: #06d6a0; box-shadow: 0 20px 50px rgba(6,214,160,0.25); }
        .stat-card:nth-child(4):hover { border-color: #ffd60a; box-shadow: 0 20px 50px rgba(255,214,10,0.25); }

        .stat-icon {
            font-size: 38px;
            margin-bottom: 12px;
            display: block;
        }

        .stat-card:nth-child(1) .stat-icon { color: #f72585; }
        .stat-card:nth-child(2) .stat-icon { color: #4cc9f0; }
        .stat-card:nth-child(3) .stat-icon { color: #06d6a0; }
        .stat-card:nth-child(4) .stat-icon { color: #ffd60a; }

        .stat-title {
            font-size: 12px;
            font-weight: 700;
            color: rgba(255,255,255,0.4);
            text-transform: uppercase;
            letter-spacing: 0.1em;
            margin-bottom: 10px;
        }

        .stat-value {
            font-size: 52px;
            font-weight: 900;
            letter-spacing: -3px;
            line-height: 1;
        }

        .stat-card:nth-child(1) .stat-value { color: #f72585; }
        .stat-card:nth-child(2) .stat-value { color: #4cc9f0; }
        .stat-card:nth-child(3) .stat-value { color: #06d6a0; }
        .stat-card:nth-child(4) .stat-value { color: #ffd60a; }

        /* SECTION CARD (shared style for Quick Actions + About) */
        .section-card {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 20px;
            padding: 32px 36px;
            margin-bottom: 24px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.3);
        }

        .section-title {
            font-size: 20px;
            font-weight: 800;
            color: white;
            margin-bottom: 22px;
            letter-spacing: -0.3px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        /* QUICK ACTION BUTTONS */
        .quick-actions {
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
        }

        .quick-btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 12px 24px;
            border-radius: 12px;
            font-size: 14px;
            font-weight: 700;
            text-decoration: none;
            transition: all 0.25s ease;
            border: none;
            cursor: pointer;
        }

        .quick-btn-blue {
            background: linear-gradient(135deg, #4361ee, #7209b7);
            color: white;
            box-shadow: 0 4px 18px rgba(67,97,238,0.4);
        }
        .quick-btn-blue:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 30px rgba(67,97,238,0.6);
            color: white;
            text-decoration: none;
        }

        .quick-btn-green {
            background: linear-gradient(135deg, #06d6a0, #4cc9f0);
            color: #0b0d17;
            box-shadow: 0 4px 18px rgba(6,214,160,0.4);
        }
        .quick-btn-green:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 30px rgba(6,214,160,0.6);
            color: #0b0d17;
            text-decoration: none;
        }

        .quick-btn-yellow {
            background: linear-gradient(135deg, #ffd60a, #fb5607);
            color: #0b0d17;
            box-shadow: 0 4px 18px rgba(255,214,10,0.4);
        }
        .quick-btn-yellow:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 30px rgba(255,214,10,0.6);
            color: #0b0d17;
            text-decoration: none;
        }

        .quick-btn-pink {
            background: linear-gradient(135deg, #f72585, #7209b7);
            color: white;
            box-shadow: 0 4px 18px rgba(247,37,133,0.4);
        }
        .quick-btn-pink:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 30px rgba(247,37,133,0.6);
            color: white;
            text-decoration: none;
        }

        /* ABOUT TEXT */
        .about-text {
            font-size: 16px;
            line-height: 2;
            color: rgba(255,255,255,0.6);
        }

        .about-text strong {
            color: #4cc9f0;
        }

        /* RESPONSIVE */
        @media (max-width: 992px) {
            .stats-row { grid-template-columns: repeat(2, 1fr); }
        }

        @media (max-width: 600px) {
            .stats-row { grid-template-columns: 1fr 1fr; gap: 12px; }
            .welcome-title { font-size: 28px; }
            .stat-value { font-size: 40px; }
            .section-card { padding: 24px 20px; }
            .dashboard-container { padding: 24px 0 40px; }
            .welcome-card { padding: 28px 22px; }
        }

    </style>
</head>
<body>

    <jsp:include page="/views/common/navbar.jsp"/>

    <div class="dashboard-container">

        <!-- WELCOME BANNER -->
        <div class="welcome-card">
            <div class="welcome-title">
                <span class="brand-pink">Hack</span><span class="brand-blue">Hub</span>
            </div>
            <div class="welcome-sub">
                <span>Collaborate</span> &nbsp;|&nbsp;
                <span>Build</span> &nbsp;|&nbsp;
                <span>Innovate</span> &nbsp;|&nbsp;
                <span>Win Hackathons</span>
            </div>
        </div>

        <!-- STAT CARDS -->
        <div class="stats-row">

            <div class="stat-card">
                <i class="bi bi-people-fill stat-icon"></i>
                <div class="stat-title">Total Users</div>
                <div class="stat-value"><%=request.getAttribute("userCount")%></div>
            </div>

            <div class="stat-card">
                <i class="bi bi-diagram-3-fill stat-icon"></i>
                <div class="stat-title">Teams</div>
                <div class="stat-value"><%=request.getAttribute("teamCount")%></div>
            </div>

            <div class="stat-card">
                <i class="bi bi-kanban-fill stat-icon"></i>
                <div class="stat-title">Projects</div>
                <div class="stat-value"><%=request.getAttribute("projectCount")%></div>
            </div>

            <div class="stat-card">
                <i class="bi bi-bell-fill stat-icon"></i>
                <div class="stat-title">Requests</div>
                <div class="stat-value"><%=request.getAttribute("requestCount")%></div>
            </div>

        </div>

        <!-- QUICK ACTIONS -->
        <div class="section-card">
            <div class="section-title">
                <i class="bi bi-lightning-charge-fill" style="color:#ffd60a;"></i>
                Quick Actions
            </div>
            <div class="quick-actions">
                <a href="<%=request.getContextPath()%>/teams" class="quick-btn quick-btn-blue">
                    <i class="bi bi-people-fill"></i> Browse Teams
                </a>
                <a href="<%=request.getContextPath()%>/projects" class="quick-btn quick-btn-green">
                    <i class="bi bi-kanban-fill"></i> Projects
                </a>
                <a href="<%=request.getContextPath()%>/hackathons" class="quick-btn quick-btn-yellow">
                    <i class="bi bi-trophy-fill"></i> Hackathons
                </a>
                <a href="<%=request.getContextPath()%>/views/student/profile.jsp" class="quick-btn quick-btn-pink">
                    <i class="bi bi-person-circle"></i> Profile
                </a>
            </div>
        </div>

        <!-- ABOUT -->
        <div class="section-card">
            <div class="section-title">
                <i class="bi bi-rocket-takeoff-fill" style="color:#4361ee;"></i>
                About HackHub
            </div>
            <p class="about-text">
                HackHub is a collaborative platform that helps students
                <strong>discover hackathons</strong>,
                <strong>create teams</strong>,
                <strong>find skilled teammates</strong>,
                collaborate on innovative projects, and build connections
                across different colleges.
            </p>
        </div>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
