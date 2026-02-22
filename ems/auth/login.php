<?php
// start session safely
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

require_once "../config/db.php";

$error = "";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $email    = trim($_POST['email']);
    $password = trim($_POST['password']);

    // IMPORTANT: join users + employees
    $stmt = $conn->prepare("
        SELECT 
            u.id AS user_id,
            u.name,
            u.password,
            u.role,
            e.id AS employee_id
        FROM users u
        LEFT JOIN employees e ON e.user_id = u.id
        WHERE u.email = ?
    ");

    if (!$stmt) {
        die("Prepare failed: " . $conn->error);
    }

    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result && $result->num_rows === 1) {

        $user = $result->fetch_assoc();

        if (password_verify($password, $user['password'])) {

            // SESSION VALUES
            $_SESSION['user_id']     = $user['user_id'];
            $_SESSION['employee_id'] = $user['employee_id']; // ⭐ FIX
            $_SESSION['role']        = $user['role'];
            $_SESSION['name']        = $user['name'];

            // REDIRECT
            if ($user['role'] === 'admin') {
                header("Location: ../admin/dashboard.php");
            } else {
                header("Location: ../employee/dashboard.php");
            }
            exit;

        } else {
            $error = "Invalid password";
        }

    } else {
        $error = "Invalid email";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>EMS Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="../assets/css/style.css">
</head>

<body>

<div class="login-box">
    <h3 class="text-center">Employee Management System</h3>
    <br><br>

    <?php if (!empty($error)): ?>
        <div class="alert alert-danger text-center py-2">
            <?= htmlspecialchars($error) ?>
        </div>
    <?php endif; ?>

    <form method="POST" autocomplete="off">

        <div class="input-group mb-3">
            <span class="input-group-text"><i class="bi bi-at"></i></span>
            <input type="email" name="email" class="form-control" placeholder="Email" required>
        </div>

        <div class="input-group mb-4">
            <span class="input-group-text"><i class="bi bi-lock"></i></span>
            <input type="password" name="password" id="password" class="form-control" placeholder="Password" required>
            <span class="input-group-text" id="togglePassword">
                <i class="bi bi-eye-slash" id="toggleIcon"></i>
            </span>
        </div>

        <button class="btn btn-primary w-100 btn-login mb-4">Login</button>

    </form>
</div>

<script>
const togglePassword = document.querySelector('#togglePassword');
const password = document.querySelector('#password');
const toggleIcon = document.querySelector('#toggleIcon');

togglePassword.addEventListener('click', function () {
    const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
    password.setAttribute('type', type);
    toggleIcon.classList.toggle('bi-eye');
    toggleIcon.classList.toggle('bi-eye-slash');
});
</script>

</body>
</html>
