<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet"
      href="<%=request.getContextPath()%>/assets/css/theme.css">

<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<nav class="navbar navbar-expand-lg navbar-dark navbar-custom sticky-top">

    <div class="container-fluid">

        <a class="navbar-brand logo"
           href="<%=request.getContextPath()%>/dashboard">

            <i class="bi bi-lightning-charge-fill text-warning"></i>
            <span class="fw-bold text-white">HackHub</span>

        </a>

        <button class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarNav">

            <span class="navbar-toggler-icon"></span>

        </button>

        <div class="collapse navbar-collapse"
             id="navbarNav">

            <ul class="navbar-nav ms-auto">

                <li class="nav-item">

                    <a class="nav-link"
                       href="<%=request.getContextPath()%>/dashboard">

                        <i class="bi bi-house-door-fill"></i>

                        Dashboard

                    </a>

                </li>

                <li class="nav-item">

                    <a class="nav-link"
                       href="<%=request.getContextPath()%>/teams">

                        <i class="bi bi-people-fill"></i>

                        Teams

                    </a>

                </li>

                <li class="nav-item">

                    <a class="nav-link"
                       href="<%=request.getContextPath()%>/teamRequests">

                        <i class="bi bi-person-check-fill"></i>

                        Team Requests

                    </a>

                </li>

                <li class="nav-item">

                    <a class="nav-link"
                       href="<%=request.getContextPath()%>/projects">

                        <i class="bi bi-kanban-fill"></i>

                        Projects

                    </a>

                </li>

                <li class="nav-item">

                    <a class="nav-link"
                       href="<%=request.getContextPath()%>/projectRequests">

                        <i class="bi bi-kanban-fill"></i>

                        Project Requests

                    </a>

                </li>
                <!-- Hackathons -->
                <li class="nav-item">

                    <a class="nav-link"
                       href="<%=request.getContextPath()%>/hackathons">

                        <i class="bi bi-trophy-fill"></i>

                        Hackathons

                    </a>

                </li>
                <li class="nav-item">

                    <a class="nav-link"
                       href="<%=request.getContextPath()%>/views/admin/login.jsp">

                        <i class="bi bi-plus-circle-fill"></i>

                        Add Hackathon

                    </a>

                </li>
                <li class="nav-item">

                    <a class="nav-link"

                       href="<%=request.getContextPath()%>/myRequests">

                        <i class="bi bi-bell-fill"></i>

                        My Requests

                    </a>

                </li>

                <li class="nav-item dropdown">

                    <a class="nav-link dropdown-toggle"

                       href="#"

                       role="button"

                       data-bs-toggle="dropdown">

                        <i class="bi bi-person-circle"></i>

                        Profile

                    </a>

                    <ul class="dropdown-menu dropdown-menu-end dropdown-menu-dark">

                        <li>

                            <a class="dropdown-item"

                               href="<%=request.getContextPath()%>/views/student/profile.jsp">

                                My Profile

                            </a>

                        </li>

                        <li>

                            <hr class="dropdown-divider">

                        </li>

                        <li>

                            <a class="dropdown-item text-danger"

                               href="<%=request.getContextPath()%>/logout">

                                Logout

                            </a>

                        </li>

                    </ul>

                </li>

            </ul>

        </div>

    </div>

</nav>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
