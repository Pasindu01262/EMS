<?php
include "header.php";
require_once "../auth/auth_check.php";
require_once "../config/db.php";

if ($_SESSION['role'] !== 'employee') {
    die("Access Denied");
}

$employee_id = $_SESSION['employee_id']; // make sure this is set at login
$msg = "";

/* APPLY LEAVE */
if (isset($_POST['apply'])) {

    $leave_type = $_POST['leave_type'];
    $date       = $_POST['date'];
    $start_time = $_POST['start_time'] ?: NULL;
    $end_time   = $_POST['end_time'] ?: NULL;
    $reason     = $_POST['reason'];

    $stmt = $conn->prepare("
        INSERT INTO leave_requests
        (employee_id, leave_type, date, start_time, end_time, reason)
        VALUES (?, ?, ?, ?, ?, ?)
    ");

    if (!$stmt) {
        die("Prepare failed: " . $conn->error);
    }

    $stmt->bind_param(
        "isssss",
        $employee_id,
        $leave_type,
        $date,
        $start_time,
        $end_time,
        $reason
    );

    $stmt->execute();
    $msg = "Leave request submitted successfully";
}
?>

<!DOCTYPE html>
<html>
<head>
<title>Apply Leave</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-4">
<h2>Apply Leave</h2>

<?php if ($msg): ?>
<div class="alert alert-success"><?= $msg ?></div>
<?php endif; ?>

<form method="POST" class="row g-3">

<div class="col-md-4">
<select name="leave_type" class="form-select" required>
<option value="">Select Leave Type</option>
<option>Short Leave</option>
<option>Day Off</option>
<option>Sick Leave</option>
<option>Casual Leave</option>
</select>
</div>

<div class="col-md-4">
<input type="date" name="date" class="form-control" required>
</div>

<div class="col-md-2">
<input type="time" name="start_time" class="form-control">
</div>

<div class="col-md-2">
<input type="time" name="end_time" class="form-control">
</div>

<div class="col-md-12">
<textarea name="reason" class="form-control" placeholder="Reason"></textarea>
</div>

<div class="col-md-12">
<button name="apply" class="btn btn-primary">Apply Leave</button>
</div>

</form>
</div>
</body>
</html>
