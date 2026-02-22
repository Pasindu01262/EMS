<?php
include "header.php";
require_once "../auth/auth_check.php";
require_once "../config/db.php";

requireRole('employee');

$employee_id = $_SESSION['employee_id'];

$leaves = $conn->query("
    SELECT * FROM leave_requests
    WHERE employee_id = $employee_id
    ORDER BY created_at DESC
");
?>

<!DOCTYPE html>
<html>
<head>
<title>My Leave Requests</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-4">
<h3>My Leave Requests</h3>

<table class="table table-bordered">
<thead class="table-dark">
<tr>
  <th>Type</th>
  <th>Date</th>
  <th>Time</th>
  <th>Status</th>
</tr>
</thead>
<tbody>

<?php while ($l = $leaves->fetch_assoc()): ?>
<tr>
  <td><?= $l['leave_type'] ?></td>
  <td><?= $l['date'] ?></td>
  <td>
    <?= $l['start_time'] ? $l['start_time']." - ".$l['end_time'] : "-" ?>
  </td>
  <td>
    <span class="badge bg-<?= 
      $l['status']=='Approved'?'success':($l['status']=='Rejected'?'danger':'warning')
    ?>">
      <?= $l['status'] ?>
    </span>
  </td>
</tr>
<?php endwhile; ?>

</tbody>
</table>

<a href="dashboard.php" class="btn btn-secondary">Back</a>
</div>

</body>
</html>
