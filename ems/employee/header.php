<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
require_once "../auth/auth_check.php";
requireRole('employee');
?>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Panel</title>

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
