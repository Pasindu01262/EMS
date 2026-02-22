<?php
require_once "../auth/auth_check.php";
requireRole('employee');
require_once "../config/db.php";

$user_id = $_SESSION['user_id'];

/* EMPLOYEE DETAILS */
$emp = $conn->query("
    SELECT e.id, u.name, d.name AS department, e.position
    FROM employees e
    JOIN users u ON e.user_id = u.id
    JOIN departments d ON e.department_id = d.id
    WHERE u.id = $user_id
")->fetch_assoc();

/* ATTENDANCE SUMMARY */
$attendance = $conn->query("
    SELECT 
        SUM(status='Present') AS present,
        SUM(status='Absent') AS absent,
        SUM(status='Leave') AS leave_count
    FROM attendance
    WHERE employee_id = {$emp['id']}
")->fetch_assoc();
?>

<!DOCTYPE html>
<html>
<head>
<title>Employee Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

<style>
.nav-link:hover {
    background: rgba(255,255,255,0.15);
    border-radius: 5px;
}
</style>
</head>

<body>

<div class="container-fluid">
<div class="row">

    <!-- SIDEBAR -->
    <?php include "sidebar.php"; ?>

    <!-- MAIN CONTENT -->
    <div class="col-md-9 col-lg-10 p-4">

        <h2 class="mb-4">Welcome, <?= htmlspecialchars($emp['name']) ?></h2>

        <div class="row g-4">

            <!-- DEPARTMENT -->
            <div class="col-md-4">
                <div class="card text-bg-primary shadow">
                    <div class="card-body text-center">
                        <i class="bi bi-building fs-1"></i>
                        <h5 class="mt-2">Department</h5>
                        <h4><?= htmlspecialchars($emp['department']) ?></h4>
                    </div>
                </div>
            </div>

            <!-- POSITION -->
            <div class="col-md-4">
                <div class="card text-bg-success shadow">
                    <div class="card-body text-center">
                        <i class="bi bi-briefcase fs-1"></i>
                        <h5 class="mt-2">Position</h5>
                        <h4><?= htmlspecialchars($emp['position']) ?></h4>
                    </div>
                </div>
            </div>

            <!-- ATTENDANCE -->
            <div class="col-md-4">
                <div class="card text-bg-warning shadow">
                    <div class="card-body text-center">
                        <i class="bi bi-calendar-check fs-1"></i>
                        <h5 class="mt-2">Attendance</h5>
                        <p>Present: <?= $attendance['present'] ?></p>
                        <p>Absent: <?= $attendance['absent'] ?></p>
                        <p>Leave: <?= $attendance['leave_count'] ?></p>
                    </div>
                </div>
            </div>

        </div>

    </div>
</div>
</div>

</body>
</html>
