<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.hackhub.model.Team"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teams - HackHub</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
    <style>
        /* ── PAGE BACKGROUND ── */
        body {
            margin: 0;
            min-height: 100vh;
            background: linear-gradient(135deg, #000000, #0a0f2c, #1e40af);
            background-attachment: fixed;
            color: white;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        /* ── PAGE HEADER AREA ── */
        .teams-header {
            padding: 40px 40px 10px 40px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 16px;
        }

        .teams-header-title {
            font-size: 32px;
            font-weight: 900;
            letter-spacing: -0.5px;
            background: linear-gradient(90deg, #f72585, #4cc9f0);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .teams-header-sub {
            font-size: 14px;
            color: rgba(255,255,255,0.45);
            margin-top: 4px;
        }

        .create-team-btn {
            background: linear-gradient(135deg, #f72585, #7209b7);
            color: white;
            border: none;
            padding: 11px 24px;
            border-radius: 10px;
            font-weight: 700;
            font-size: 14px;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            transition: all 0.25s ease;
            box-shadow: 0 4px 20px rgba(247,37,133,0.4);
        }

        .create-team-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 30px rgba(247,37,133,0.6);
            color: white;
            text-decoration: none;
        }

        /* ── CARDS GRID ── */
        .teams-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 24px;
            padding: 30px 40px 60px 40px;
        }

        /* ── SINGLE TEAM CARD ── */
        .team-card {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border: 1px solid rgba(255, 255, 255, 0.12);
            border-radius: 20px;
            padding: 26px;
            transition: transform 0.3s ease, box-shadow 0.3s ease, border-color 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .team-card::before {
            content: '';
            position: absolute;
            top: 0; left: 0; right: 0;
            height: 3px;
            background: linear-gradient(90deg, #f72585, #7209b7, #4361ee, #4cc9f0);
            background-size: 200% 100%;
            animation: gradShift 4s linear infinite;
        }

        @keyframes gradShift {
            0%   { background-position: 0% 0%; }
            100% { background-position: 200% 0%; }
        }

        .team-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.5);
            border-color: rgba(247, 37, 133, 0.4);
        }

        /* ── CARD TOP ROW (avatar + name) ── */
        .card-top {
            display: flex;
            align-items: center;
            gap: 16px;
            margin-bottom: 18px;
        }

        .team-avatar {
            width: 54px;
            height: 54px;
            border-radius: 14px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 22px;
            font-weight: 900;
            color: white;
            flex-shrink: 0;
            text-shadow: 0 2px 6px rgba(0,0,0,0.4);
        }

        /* rotate through 5 gradient colours */
        .team-card:nth-child(5n+1) .team-avatar { background: linear-gradient(135deg, #f72585, #7209b7); }
        .team-card:nth-child(5n+2) .team-avatar { background: linear-gradient(135deg, #4361ee, #4cc9f0); }
        .team-card:nth-child(5n+3) .team-avatar { background: linear-gradient(135deg, #06d6a0, #4cc9f0); }
        .team-card:nth-child(5n+4) .team-avatar { background: linear-gradient(135deg, #ffd60a, #fb5607); }
        .team-card:nth-child(5n+5) .team-avatar { background: linear-gradient(135deg, #7209b7, #4361ee); }

        .team-name {
            font-size: 18px;
            font-weight: 800;
            color: #ffffff;
            letter-spacing: -0.2px;
            line-height: 1.2;
        }

        .team-id-label {
            font-size: 11px;
            color: rgba(255,255,255,0.35);
            margin-top: 2px;
            font-family: 'Courier New', monospace;
        }

        /* ── HACKATHON BADGE ── */
        .hackathon-badge {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            background: rgba(67, 97, 238, 0.2);
            border: 1px solid rgba(67, 97, 238, 0.4);
            color: #4cc9f0;
            padding: 5px 12px;
            border-radius: 99px;
            font-size: 12px;
            font-weight: 600;
            margin-bottom: 14px;
            max-width: 100%;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .hackathon-badge span {
            overflow: hidden;
            text-overflow: ellipsis;
        }

        /* ── LEADER ROW ── */
        .leader-row {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 10px 0;
            border-top: 1px solid rgba(255,255,255,0.07);
            border-bottom: 1px solid rgba(255,255,255,0.07);
            margin-bottom: 18px;
        }

        .leader-avatar {
            width: 30px;
            height: 30px;
            background: linear-gradient(135deg, #f72585, #7209b7);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 12px;
            font-weight: 800;
            color: white;
            flex-shrink: 0;
        }

        .leader-info {
            display: flex;
            flex-direction: column;
        }

        .leader-label {
            font-size: 10px;
            font-weight: 600;
            color: rgba(255,255,255,0.35);
            text-transform: uppercase;
            letter-spacing: 0.07em;
        }

        .leader-name {
            font-size: 13px;
            font-weight: 700;
            color: rgba(255,255,255,0.85);
        }

        /* ── CARD ACTION BUTTONS ── */
        .card-actions {
            display: flex;
            gap: 10px;
        }

        .btn-join {
            flex: 1;
            background: linear-gradient(135deg, #4361ee, #7209b7);
            color: white;
            border: none;
            padding: 10px 16px;
            border-radius: 10px;
            font-weight: 700;
            font-size: 13px;
            text-decoration: none;
            text-align: center;
            transition: all 0.25s ease;
            box-shadow: 0 4px 16px rgba(67,97,238,0.35);
        }

        .btn-join:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 24px rgba(67,97,238,0.55);
            color: white;
            text-decoration: none;
        }

        .btn-members {
            flex: 1;
            background: rgba(255,255,255,0.06);
            color: rgba(255,255,255,0.8);
            border: 1px solid rgba(255,255,255,0.15);
            padding: 10px 16px;
            border-radius: 10px;
            font-weight: 600;
            font-size: 13px;
            text-decoration: none;
            text-align: center;
            transition: all 0.25s ease;
        }

        .btn-members:hover {
            background: rgba(255,255,255,0.12);
            color: white;
            border-color: rgba(255,255,255,0.3);
            text-decoration: none;
            transform: translateY(-2px);
        }

        /* ── EMPTY STATE ── */
        .empty-state {
            grid-column: 1 / -1;
            text-align: center;
            padding: 80px 24px;
        }

        .empty-icon {
            font-size: 64px;
            margin-bottom: 20px;
            opacity: 0.3;
        }

        .empty-title {
            font-size: 22px;
            font-weight: 800;
            color: rgba(255,255,255,0.4);
            margin-bottom: 8px;
        }

        .empty-sub {
            font-size: 14px;
            color: rgba(255,255,255,0.25);
        }

        /* ── BACK LINK ── */
        .bottom-nav {
            padding: 0 40px 40px 40px;
            display: flex;
            gap: 16px;
            flex-wrap: wrap;
        }

        .back-link {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            color: rgba(255,255,255,0.45);
            font-size: 13px;
            font-weight: 600;
            text-decoration: none;
            padding: 8px 16px;
            border: 1px solid rgba(255,255,255,0.12);
            border-radius: 8px;
            transition: all 0.2s ease;
        }

        .back-link:hover {
            color: white;
            border-color: rgba(255,255,255,0.3);
            background: rgba(255,255,255,0.06);
            text-decoration: none;
        }

        /* ── RESPONSIVE ── */
        @media (max-width: 768px) {
            .teams-header { padding: 24px 20px 10px; }
            .teams-grid   { padding: 20px 16px 40px; gap: 16px; }
            .bottom-nav   { padding: 0 16px 30px; }
            .teams-header-title { font-size: 24px; }
            .teams-grid { grid-template-columns: 1fr; }
        }
    </style>
</head>
<body>

<jsp:include page="/views/common/navbar.jsp" />

<!-- PAGE HEADER -->
<div class="teams-header">
    <div>
        <div class="teams-header-title">All Teams</div>
        <div class="teams-header-sub">Find your perfect team and start hacking</div>
    </div>
    <a href="<%=request.getContextPath()%>/teamForm" class="create-team-btn">
        + Create Team
    </a>
</div>

<!-- CARDS GRID -->
<div class="teams-grid">

<%
List<Team> teams = (List<Team>) request.getAttribute("teams");
if (teams == null || teams.isEmpty()) {
%>
    <div class="empty-state">
        <div class="empty-icon">( )</div>
        <div class="empty-title">No Teams Found</div>
        <div class="empty-sub">Be the first to create a team for an upcoming hackathon!</div>
    </div>
<%
} else {
    for (Team team : teams) {
        String initials = team.getTeamName() != null && team.getTeamName().length() > 0
            ? String.valueOf(team.getTeamName().charAt(0)).toUpperCase()
            : "T";
        String leaderInitial = team.getLeaderName() != null && team.getLeaderName().length() > 0
            ? String.valueOf(team.getLeaderName().charAt(0)).toUpperCase()
            : "L";
%>
    <div class="team-card">

        <!-- TOP: Avatar + Team Name -->
        <div class="card-top">
            <div class="team-avatar"><%= initials %></div>
            <div>
                <div class="team-name"><%= team.getTeamName() %></div>
                <div class="team-id-label">#TEAM-<%= team.getTeamId() %></div>
            </div>
        </div>

        <!-- HACKATHON BADGE -->
        <div class="hackathon-badge">
            <span><%= team.getHackathonName() != null ? team.getHackathonName() : "Open Team" %></span>
        </div>

        <!-- LEADER ROW -->
        <div class="leader-row">
            <div class="leader-avatar"><%= leaderInitial %></div>
            <div class="leader-info">
                <span class="leader-label">Team Leader</span>
                <span class="leader-name"><%= team.getLeaderName() %></span>
            </div>
        </div>

        <!-- ACTION BUTTONS -->
        <div class="card-actions">
            <a href="<%= request.getContextPath() %>/joinTeam?teamId=<%= team.getTeamId() %>"
               class="btn-join">Join Team</a>
            <a href="<%= request.getContextPath() %>/teamMembers?teamId=<%= team.getTeamId() %>"
               class="btn-members">Members</a>
        </div>

    </div>
<%
    }
}
%>

</div>

<!-- BOTTOM NAV -->
<div class="bottom-nav">
    <a href="<%= request.getContextPath() %>/views/student/profile.jsp" class="back-link">
        Back to Profile
    </a>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
