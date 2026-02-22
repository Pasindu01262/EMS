<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

if (!isset($_SESSION['role']) || $_SESSION['role'] !== 'employee') {
    die("Access Denied");
}
?>

<div class="col-md-3 col-lg-2 bg-dark text-white min-vh-100 p-3">

    <h4 class="text-center mb-4">
        <i class="bi bi-person-circle"></i><br>
        Employee Panel
    </h4>

    <ul class="nav flex-column">

        <li class="nav-item">
            <a href="dashboard.php" class="nav-link text-white">
                <i class="bi bi-speedometer2 me-2"></i> Dashboard
            </a>
        </li>

        <li class="nav-item">
            <a href="profile.php" class="nav-link text-white">
                <i class="bi bi-person-badge me-2"></i> My Profile
            </a>
        </li>

        <li class="nav-item">
            <a href="attendance.php" class="nav-link text-white">
                <i class="bi bi-calendar-check me-2"></i> Attendance
            </a>
        </li>

        <li class="nav-item">
            <a href="salary.php" class="nav-link text-white">
                <i class="bi bi-cash-coin me-2"></i> Salary
            </a>
        </li>

        <li class="nav-item">
            <a href="apply_leave.php" class="nav-link text-white">
                <i class="bi bi-pencil-square me-2"></i> Apply Leave
            </a>
        </li>

        <li class="nav-item">
            <a href="my_leaves.php" class="nav-link text-white">
                <i class="bi bi-list-check me-2"></i> Leave Status
            </a>
        </li>

        <hr class="text-secondary">

        <li class="nav-item">
            <a href="../auth/logout.php" class="nav-link text-danger">
                <i class="bi bi-box-arrow-right me-2"></i> Logout
            </a>
        </li>

    </ul>
</div>
