<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.hackhub.model.Project"%>
<!DOCTYPE html>
<html>
<head>
    <title>Projects - HackHub</title>
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
        .projects-header {
            padding: 40px 40px 10px 40px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 16px;
        }

        .projects-header-title {
            font-size: 32px;
            font-weight: 900;
            letter-spacing: -0.5px;
            background: linear-gradient(90deg, #06d6a0, #4cc9f0);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .projects-header-sub {
            font-size: 14px;
            color: rgba(255,255,255,0.45);
            margin-top: 4px;
        }

        .create-project-btn {
            background: linear-gradient(135deg, #06d6a0, #4cc9f0);
            color: #0b0d17;
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
            box-shadow: 0 4px 20px rgba(6,214,160,0.4);
        }

        .create-project-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 30px rgba(6,214,160,0.6);
            color: #0b0d17;
            text-decoration: none;
        }

        /* CARDS GRID */
        .projects-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 24px;
            padding: 30px 40px 60px 40px;
        }

        /* SINGLE PROJECT CARD */
        .project-card {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border: 1px solid rgba(255, 255, 255, 0.12);
            border-radius: 20px;
            padding: 26px;
            transition: transform 0.3s ease, box-shadow 0.3s ease, border-color 0.3s ease;
            position: relative;
            overflow: hidden;
            display: flex;
            flex-direction: column;
        }

        /* animated top line */
        .project-card::before {
            content: '';
            position: absolute;
            top: 0; left: 0; right: 0;
            height: 3px;
            background: linear-gradient(90deg, #06d6a0, #4cc9f0, #4361ee, #7209b7, #06d6a0);
            background-size: 200% 100%;
            animation: gradShift 4s linear infinite;
        }

        @keyframes gradShift {
            0%   { background-position: 0% 0%; }
            100% { background-position: 200% 0%; }
        }

        .project-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 20px 60px rgba(0,0,0,0.5);
            border-color: rgba(6,214,160,0.4);
        }

        /* CARD TOP — avatar + title */
        .card-top {
            display: flex;
            align-items: center;
            gap: 16px;
            margin-bottom: 16px;
        }

        .project-avatar {
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
        .project-card:nth-child(5n+1) .project-avatar { background: linear-gradient(135deg, #06d6a0, #4cc9f0); }
        .project-card:nth-child(5n+2) .project-avatar { background: linear-gradient(135deg, #4361ee, #7209b7); }
        .project-card:nth-child(5n+3) .project-avatar { background: linear-gradient(135deg, #f72585, #7209b7); }
        .project-card:nth-child(5n+4) .project-avatar { background: linear-gradient(135deg, #ffd60a, #fb5607); }
        .project-card:nth-child(5n+5) .project-avatar { background: linear-gradient(135deg, #7209b7, #4361ee); }

        .project-title {
            font-size: 17px;
            font-weight: 800;
            color: #ffffff;
            letter-spacing: -0.2px;
            line-height: 1.3;
        }

        .project-id-label {
            font-size: 11px;
            color: rgba(255,255,255,0.3);
            margin-top: 2px;
            font-family: 'Courier New', monospace;
        }

        /* DESCRIPTION */
        .project-desc {
            font-size: 13px;
            color: rgba(255,255,255,0.5);
            line-height: 1.6;
            margin-bottom: 16px;
            flex: 1;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        /* DOMAIN BADGE */
        .domain-badge {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            background: rgba(6,214,160,0.15);
            border: 1px solid rgba(6,214,160,0.35);
            color: #06d6a0;
            padding: 4px 12px;
            border-radius: 99px;
            font-size: 11px;
            font-weight: 700;
            margin-bottom: 14px;
            text-transform: uppercase;
            letter-spacing: 0.05em;
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
            font-size: 15px;
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
            min-width: 52px;
        }

        .info-value {
            font-size: 13px;
            font-weight: 600;
            color: rgba(255,255,255,0.75);
        }

        /* STATUS BADGE */
        .status-open {
            display: inline-block;
            background: rgba(6,214,160,0.2);
            border: 1px solid rgba(6,214,160,0.4);
            color: #06d6a0;
            padding: 3px 10px;
            border-radius: 99px;
            font-size: 11px;
            font-weight: 700;
        }

        .status-other {
            display: inline-block;
            background: rgba(255,255,255,0.08);
            border: 1px solid rgba(255,255,255,0.15);
            color: rgba(255,255,255,0.45);
            padding: 3px 10px;
            border-radius: 99px;
            font-size: 11px;
            font-weight: 700;
        }

        /* REQUEST BUTTON */
        .btn-request {
            display: block;
            width: 100%;
            text-align: center;
            background: linear-gradient(135deg, #06d6a0, #4cc9f0);
            color: #0b0d17;
            border: none;
            padding: 11px 16px;
            border-radius: 10px;
            font-weight: 700;
            font-size: 13px;
            text-decoration: none;
            transition: all 0.25s ease;
            box-shadow: 0 4px 16px rgba(6,214,160,0.3);
            margin-top: 16px;
        }

        .btn-request:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 24px rgba(6,214,160,0.5);
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

        /* BOTTOM NAV */
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
            color: rgba(255,255,255,0.4);
            font-size: 13px;
            font-weight: 600;
            text-decoration: none;
            padding: 8px 16px;
            border: 1px solid rgba(255,255,255,0.1);
            border-radius: 8px;
            transition: all 0.2s ease;
        }

        .back-link:hover {
            color: white;
            border-color: rgba(255,255,255,0.3);
            background: rgba(255,255,255,0.06);
            text-decoration: none;
        }

        /* RESPONSIVE */
        @media (max-width: 768px) {
            .projects-header { padding: 24px 20px 10px; }
            .projects-grid   { padding: 20px 16px 40px; gap: 16px; grid-template-columns: 1fr; }
            .bottom-nav      { padding: 0 16px 30px; }
            .projects-header-title { font-size: 24px; }
        }

    </style>
</head>
<body>

<jsp:include page="/views/common/navbar.jsp" />

<!-- PAGE HEADER -->
<div class="projects-header">
    <div>
        <div class="projects-header-title">All Projects</div>
        <div class="projects-header-sub">Discover exciting projects and collaborate with talented students</div>
    </div>
    <a href="<%=request.getContextPath()%>/views/project/create.jsp" class="create-project-btn">
        <i class="bi bi-plus-lg"></i> Create Project
    </a>
</div>

<!-- CARDS GRID -->
<div class="projects-grid">

<%
List<Project> projects = (List<Project>) request.getAttribute("projects");
if (projects == null || projects.isEmpty()) {
%>
    <div class="empty-state">
        <i class="bi bi-kanban empty-icon"></i>
        <div class="empty-title">No Projects Found</div>
        <div class="empty-sub">Be the first to create a project and find collaborators!</div>
    </div>
<%
} else {
    for (Project project : projects) {
        String initial = (project.getTitle() != null && project.getTitle().length() > 0)
            ? String.valueOf(project.getTitle().charAt(0)).toUpperCase() : "P";
        String status = project.getStatus() != null ? project.getStatus() : "Unknown";
%>
    <div class="project-card">

        <!-- TOP: Avatar + Title -->
        <div class="card-top">
            <div class="project-avatar"><%=initial%></div>
            <div>
                <div class="project-title"><%=project.getTitle()%></div>
                <div class="project-id-label">#PROJ-<%=project.getProjectId()%></div>
            </div>
        </div>

        <!-- DOMAIN BADGE -->
        <div class="domain-badge">
            <i class="bi bi-tag-fill"></i> <%=project.getDomain()%>
        </div>

        <!-- DESCRIPTION -->
        <div class="project-desc"><%=project.getDescription()%></div>

        <!-- INFO ROWS -->
        <div class="info-row">
            <i class="bi bi-building" style="color:#4cc9f0;"></i>
            <span class="info-label">College</span>
            <span class="info-value"><%=project.getCollege()%></span>
        </div>

        <div class="info-row">
            <i class="bi bi-geo-alt-fill" style="color:#f72585;"></i>
            <span class="info-label">Region</span>
            <span class="info-value"><%=project.getRegion()%></span>
        </div>

        <div class="info-row">
            <i class="bi bi-circle-fill" style="color:#06d6a0; font-size:9px;"></i>
            <span class="info-label">Status</span>
            <span>
                <%if (status.equalsIgnoreCase("Open")) {%>
                    <span class="status-open">Open</span>
                <%} else {%>
                    <span class="status-other"><%=status%></span>
                <%}%>
            </span>
        </div>

        <!-- REQUEST BUTTON -->
        <a href="<%=request.getContextPath()%>/sendRequest?projectId=<%=project.getProjectId()%>"
           class="btn-request">
            <i class="bi bi-send-fill"></i> Request Collaboration
        </a>

    </div>
<%
    }
}
%>

</div>

<!-- BOTTOM NAV -->
<div class="bottom-nav">
    <a href="<%=request.getContextPath()%>/views/student/profile.jsp" class="back-link">
        <i class="bi bi-arrow-left"></i> Back to Profile
    </a>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
