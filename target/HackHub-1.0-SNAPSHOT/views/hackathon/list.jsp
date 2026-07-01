<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.hackhub.model.Hackathon"%>
<!DOCTYPE html>
<html>
<head>
    <title>Hackathons - HackHub</title>
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

        /* PAGE HEADER */
        .page-header {
            padding: 40px 40px 10px 40px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 16px;
        }

        .page-header-title {
            font-size: 32px;
            font-weight: 900;
            letter-spacing: -0.5px;
            background: linear-gradient(90deg, #ffd60a, #fb5607);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .page-header-sub {
            font-size: 14px;
            color: rgba(255,255,255,0.45);
            margin-top: 4px;
        }

        /* FILTER BOX */
        .filter-box {
            margin: 24px 40px;
            background: rgba(255,255,255,0.06);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border: 1px solid rgba(255,255,255,0.12);
            border-radius: 18px;
            padding: 24px 28px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.3);
        }

        .filter-title {
            font-size: 13px;
            font-weight: 700;
            color: rgba(255,255,255,0.4);
            text-transform: uppercase;
            letter-spacing: 0.09em;
            margin-bottom: 16px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .filter-row {
            display: flex;
            align-items: flex-end;
            flex-wrap: wrap;
            gap: 16px;
        }

        .filter-group {
            display: flex;
            flex-direction: column;
            gap: 6px;
            flex: 1 1 160px;
        }

        .filter-group label {
            font-size: 11px;
            font-weight: 700;
            color: rgba(255,255,255,0.4);
            text-transform: uppercase;
            letter-spacing: 0.07em;
            margin: 0;
        }

        .filter-group select {
            background-color: rgba(255,255,255,0.08);
            border: 1px solid rgba(255,255,255,0.15);
            border-radius: 10px;
            color: white;
            padding: 10px 14px;
            font-size: 14px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            outline: none;
            transition: border-color 0.2s, box-shadow 0.2s;
            -webkit-appearance: none;
            appearance: none;
            cursor: pointer;
            width: 100%;
        }

        .filter-group select:focus {
            border-color: #ffd60a;
            box-shadow: 0 0 0 3px rgba(255,214,10,0.2);
        }

        .filter-group select option {
            background-color: #1a1f35;
            color: white;
        }

        .filter-btn {
            background: linear-gradient(135deg, #ffd60a, #fb5607);
            color: #0b0d17;
            border: none;
            padding: 10px 24px;
            border-radius: 10px;
            font-weight: 700;
            font-size: 14px;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            transition: all 0.25s ease;
            box-shadow: 0 4px 16px rgba(255,214,10,0.35);
            white-space: nowrap;
            height: fit-content;
        }

        .filter-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 24px rgba(255,214,10,0.55);
        }

        /* CARDS GRID */
        .hackathons-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 24px;
            padding: 24px 40px 60px 40px;
        }

        /* SINGLE HACKATHON CARD */
        .hackathon-card {
            background: rgba(255,255,255,0.05);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border: 1px solid rgba(255,255,255,0.12);
            border-radius: 20px;
            padding: 26px;
            transition: transform 0.3s ease, box-shadow 0.3s ease, border-color 0.3s ease;
            position: relative;
            overflow: hidden;
            display: flex;
            flex-direction: column;
        }

        /* animated top line */
        .hackathon-card::before {
            content: '';
            position: absolute;
            top: 0; left: 0; right: 0;
            height: 3px;
            background: linear-gradient(90deg, #ffd60a, #fb5607, #f72585, #7209b7, #ffd60a);
            background-size: 200% 100%;
            animation: gradShift 4s linear infinite;
        }

        @keyframes gradShift {
            0%   { background-position: 0% 0%; }
            100% { background-position: 200% 0%; }
        }

        .hackathon-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 20px 60px rgba(0,0,0,0.5);
            border-color: rgba(255,214,10,0.4);
        }

        /* CARD TOP — avatar + title */
        .card-top {
            display: flex;
            align-items: center;
            gap: 16px;
            margin-bottom: 16px;
        }

        .hack-avatar {
            width: 52px;
            height: 52px;
            border-radius: 14px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            font-weight: 900;
            color: white;
            flex-shrink: 0;
        }

        /* rotate 5 gradients */
        .hackathon-card:nth-child(5n+1) .hack-avatar { background: linear-gradient(135deg, #ffd60a, #fb5607); }
        .hackathon-card:nth-child(5n+2) .hack-avatar { background: linear-gradient(135deg, #f72585, #7209b7); }
        .hackathon-card:nth-child(5n+3) .hack-avatar { background: linear-gradient(135deg, #4361ee, #4cc9f0); }
        .hackathon-card:nth-child(5n+4) .hack-avatar { background: linear-gradient(135deg, #06d6a0, #4cc9f0); }
        .hackathon-card:nth-child(5n+5) .hack-avatar { background: linear-gradient(135deg, #7209b7, #4361ee); }

        .hack-title {
            font-size: 17px;
            font-weight: 800;
            color: #ffffff;
            letter-spacing: -0.2px;
            line-height: 1.3;
        }

        .hack-id-label {
            font-size: 11px;
            color: rgba(255,255,255,0.3);
            margin-top: 2px;
            font-family: 'Courier New', monospace;
        }

        /* INFO ROWS */
        .info-row {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 9px 0;
            border-top: 1px solid rgba(255,255,255,0.06);
        }

        .info-row i {
            font-size: 14px;
            width: 20px;
            text-align: center;
            flex-shrink: 0;
        }

        .info-label {
            font-size: 10px;
            font-weight: 700;
            color: rgba(255,255,255,0.3);
            text-transform: uppercase;
            letter-spacing: 0.07em;
            min-width: 60px;
        }

        .info-value {
            font-size: 13px;
            font-weight: 600;
            color: rgba(255,255,255,0.75);
        }

        /* STATUS BADGES */
        .status-upcoming {
            display: inline-block;
            background: rgba(6,214,160,0.18);
            border: 1px solid rgba(6,214,160,0.4);
            color: #06d6a0;
            padding: 3px 12px;
            border-radius: 99px;
            font-size: 11px;
            font-weight: 700;
        }

        .status-ongoing {
            display: inline-block;
            background: rgba(255,214,10,0.15);
            border: 1px solid rgba(255,214,10,0.4);
            color: #ffd60a;
            padding: 3px 12px;
            border-radius: 99px;
            font-size: 11px;
            font-weight: 700;
        }

        .status-completed {
            display: inline-block;
            background: rgba(255,255,255,0.07);
            border: 1px solid rgba(255,255,255,0.15);
            color: rgba(255,255,255,0.4);
            padding: 3px 12px;
            border-radius: 99px;
            font-size: 11px;
            font-weight: 700;
        }

        /* VIEW DETAILS BUTTON */
        .btn-details {
            display: block;
            width: 100%;
            text-align: center;
            background: linear-gradient(135deg, #ffd60a, #fb5607);
            color: #0b0d17;
            border: none;
            padding: 11px 16px;
            border-radius: 10px;
            font-weight: 700;
            font-size: 13px;
            text-decoration: none;
            transition: all 0.25s ease;
            box-shadow: 0 4px 16px rgba(255,214,10,0.3);
            margin-top: 16px;
        }

        .btn-details:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 24px rgba(255,214,10,0.5);
            color: #0b0d17;
            text-decoration: none;
        }

        /* EMPTY STATE */
        .empty-state {
            grid-column: 1 / -1;
            text-align: center;
            padding: 80px 24px;
        }

        .empty-icon {
            font-size: 64px;
            color: rgba(255,255,255,0.15);
            margin-bottom: 20px;
            display: block;
        }

        .empty-title {
            font-size: 22px;
            font-weight: 800;
            color: rgba(255,255,255,0.35);
            margin-bottom: 8px;
        }

        .empty-sub {
            font-size: 14px;
            color: rgba(255,255,255,0.2);
        }

        /* RESPONSIVE */
        @media (max-width: 768px) {
            .page-header    { padding: 24px 20px 10px; }
            .filter-box     { margin: 16px 20px; padding: 20px; }
            .hackathons-grid { padding: 16px 16px 40px; gap: 16px; grid-template-columns: 1fr; }
            .page-header-title { font-size: 24px; }
            .filter-row     { flex-direction: column; }
        }

    </style>
</head>
<body>

<jsp:include page="/views/common/navbar.jsp" />

<!-- PAGE HEADER -->
<div class="page-header">
    <div>
        <div class="page-header-title">Hackathons</div>
        <div class="page-header-sub">Discover upcoming hackathons and showcase your skills</div>
    </div>
</div>

<!-- FILTER BOX -->
<div class="filter-box">
    <div class="filter-title">
        <i class="bi bi-funnel-fill"></i> Filter Hackathons
    </div>
    <form action="${pageContext.request.contextPath}/hackathons" method="get">
        <div class="filter-row">

            <div class="filter-group">
                <label>Region</label>
                <select name="region">
                    <option value="">All Regions</option>
                    <option value="Tamil Nadu">Tamil Nadu</option>
                    <option value="Karnataka">Karnataka</option>
                    <option value="Kerala">Kerala</option>
                </select>
            </div>

            <div class="filter-group">
                <label>Status</label>
                <select name="status">
                    <option value="">All Status</option>
                    <option value="Upcoming">Upcoming</option>
                    <option value="Ongoing">Ongoing</option>
                    <option value="Completed">Completed</option>
                </select>
            </div>

            <button type="submit" class="filter-btn">
                <i class="bi bi-search"></i> Filter
            </button>

        </div>
    </form>
</div>

<!-- CARDS GRID -->
<div class="hackathons-grid">

<%
List<Hackathon> hackathons = (List<Hackathon>) request.getAttribute("hackathons");
if (hackathons == null || hackathons.isEmpty()) {
%>
    <div class="empty-state">
        <i class="bi bi-trophy empty-icon"></i>
        <div class="empty-title">No Hackathons Available</div>
        <div class="empty-sub">Try changing the filters or check back later.</div>
    </div>
<%
} else {
    for (Hackathon h : hackathons) {
        String initial = (h.getTitle() != null && h.getTitle().length() > 0)
            ? String.valueOf(h.getTitle().charAt(0)).toUpperCase() : "H";
        String status = h.getStatus() != null ? h.getStatus() : "Unknown";
%>
    <div class="hackathon-card">

        <!-- TOP: Avatar + Title -->
        <div class="card-top">
            <div class="hack-avatar"><%=initial%></div>
            <div>
                <div class="hack-title"><%=h.getTitle()%></div>
                <div class="hack-id-label">Hackathon</div>
            </div>
        </div>

        <!-- INFO ROWS -->
        <div class="info-row">
            <i class="bi bi-person-fill" style="color:#f72585;"></i>
            <span class="info-label">Organizer</span>
            <span class="info-value"><%=h.getOrganizer()%></span>
        </div>

        <div class="info-row">
            <i class="bi bi-geo-alt-fill" style="color:#4cc9f0;"></i>
            <span class="info-label">Location</span>
            <span class="info-value"><%=h.getLocation()%></span>
        </div>

        <div class="info-row">
            <i class="bi bi-map-fill" style="color:#06d6a0;"></i>
            <span class="info-label">Region</span>
            <span class="info-value"><%=h.getRegion()%></span>
        </div>

        <div class="info-row">
            <i class="bi bi-calendar-event-fill" style="color:#ffd60a;"></i>
            <span class="info-label">Start Date</span>
            <span class="info-value"><%=h.getStartDate()%></span>
        </div>

        <div class="info-row">
            <i class="bi bi-circle-fill" style="color:#06d6a0; font-size:9px;"></i>
            <span class="info-label">Status</span>
            <span>
                <%if (status.equalsIgnoreCase("Upcoming")) {%>
                    <span class="status-upcoming">Upcoming</span>
                <%} else if (status.equalsIgnoreCase("Ongoing")) {%>
                    <span class="status-ongoing">Ongoing</span>
                <%} else {%>
                    <span class="status-completed"><%=status%></span>
                <%}%>
            </span>
        </div>

        <!-- VIEW DETAILS BUTTON -->
        <a href="<%= h.getRegistrationLink() %>"
   target="_blank"
   class="btn btn-warning">

    Register Now

</a>

    </div><%
if(session.getAttribute("admin") != null &&
   "Closed".equalsIgnoreCase(h.getStatus())){
%>

<a href="<%=request.getContextPath()%>/deleteHackathon?hackathonId=<%=h.getHackathonId()%>"
   class="btn btn-danger btn-sm"
   onclick="return confirm('Delete this hackathon permanently?');">

    <i class="bi bi-trash-fill"></i>

    Delete

</a>

<%
}
%>
<%
    }
}
%>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
