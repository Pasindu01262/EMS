<?php
include "header.php";
require_once "../auth/auth_check.php";
require_once "../config/db.php";

requireRole('admin');

if (isset($_GET['action'])) {
    $id = intval($_GET['id']);
    $status = $_GET['action'] === 'approve' ? 'Approved' : 'Rejected';

    $conn->query("
        UPDATE leave_requests 
        SET status='$status' 
        WHERE id=$id
    ");
}

$leaves = $conn->query("
    SELECT lr.*, u.name 
    FROM leave_requests lr
    JOIN employees e ON lr.employee_id = e.id
    JOIN users u ON e.user_id = u.id
    ORDER BY lr.created_at DESC
");
?>

<!DOCTYPE html>
<html>
<head>
<title>Leave Requests</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-4">
<h3>Leave Requests</h3>

<table class="table table-bordered">
<thead class="table-dark">
<tr>
  <th>Employee</th>
  <th>Type</th>
  <th>Date</th>
  <th>Reason</th>
  <th>Status</th>
  <th>Action</th>
</tr>
</thead>
<tbody>

<?php while ($l = $leaves->fetch_assoc()): ?>
<tr>
  <td><?= $l['name'] ?></td>
  <td><?= $l['leave_type'] ?></td>
  <td><?= $l['date'] ?></td>
  <td><?= $l['reason'] ?></td>
  <td><?= $l['status'] ?></td>
  <td>
    <?php if ($l['status']=='Pending'): ?>
      <a href="?action=approve&id=<?= $l['id'] ?>" class="btn btn-success btn-sm">Approve</a>
      <a href="?action=reject&id=<?= $l['id'] ?>" class="btn btn-danger btn-sm">Reject</a>
    <?php else: ?>
      -
    <?php endif; ?>
  </td>
</tr>
<?php endwhile; ?>

</tbody>
</table>

<a href="dashboard.php" class="btn btn-secondary">Back</a>
</div>

</body>
</html>