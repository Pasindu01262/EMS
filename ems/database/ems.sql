-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2026 at 05:15 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ems`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` enum('Present','Absent','Leave') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `employee_id`, `date`, `status`) VALUES
(1, 1, '2025-12-16', 'Present'),
(2, 1, '2025-12-18', 'Present'),
(3, 2, '2026-01-08', 'Present'),
(4, 3, '2026-01-08', 'Present'),
(5, 4, '2026-01-08', 'Present'),
(6, 5, '2026-01-08', 'Present'),
(7, 6, '2026-01-08', 'Present'),
(8, 7, '2026-01-08', 'Present'),
(9, 8, '2026-01-08', 'Present'),
(10, 9, '2026-01-08', 'Present'),
(11, 10, '2026-01-08', 'Present'),
(12, 11, '2026-01-08', 'Present'),
(13, 12, '2026-01-08', 'Present'),
(14, 13, '2026-01-08', 'Present'),
(15, 14, '2026-01-08', 'Present'),
(16, 15, '2026-01-08', 'Present'),
(17, 16, '2026-01-08', 'Present'),
(18, 17, '2026-01-08', 'Present'),
(19, 18, '2026-01-08', 'Present'),
(20, 19, '2026-01-08', 'Present'),
(34, 26, '2026-01-08', 'Absent'),
(35, 25, '2026-01-08', 'Absent'),
(36, 24, '2026-01-08', 'Absent'),
(37, 23, '2026-01-08', 'Absent'),
(41, 22, '2026-01-08', 'Leave'),
(42, 21, '2026-01-08', 'Leave'),
(43, 20, '2026-01-08', 'Leave');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`) VALUES
(0, 'Finance'),
(1, 'HR'),
(2, 'IT'),
(4, 'Sales');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `position` varchar(100) NOT NULL,
  `join_date` date NOT NULL,
  `salary` int(11) NOT NULL,
  `increment_rate` int(11) DEFAULT 5,
  `last_increment` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `user_id`, `department_id`, `position`, `join_date`, `salary`, `increment_rate`, `last_increment`) VALUES
(1, 2, 2, 'SE', '2025-12-16', 105000, 5, '2025-12-18'),
(2, 3, 1, 'HR Manager', '2023-01-10', 120000, 5, '2024-01-10'),
(3, 4, 2, 'Software Engineer', '2023-02-15', 150000, 10, '2024-02-15'),
(4, 5, 0, 'Accountant', '2023-03-01', 95000, 5, '2024-03-01'),
(5, 6, 4, 'Sales Executive', '2023-04-20', 70000, 5, NULL),
(6, 7, 2, 'System Admin', '2023-05-12', 110000, 5, '2024-05-12'),
(7, 8, 1, 'Recruiter', '2023-06-30', 75000, 5, NULL),
(8, 9, 2, 'DevOps Engineer', '2023-07-04', 180000, 10, '2024-07-04'),
(9, 10, 0, 'Finance Analyst', '2023-08-11', 100000, 5, '2024-08-11'),
(10, 11, 4, 'Sales Manager', '2022-12-01', 125000, 10, '2023-12-01'),
(11, 12, 2, 'Senior SE', '2022-11-15', 230000, 15, '2023-11-15'),
(12, 13, 4, 'Sales Rep', '2024-01-05', 60000, 5, NULL),
(13, 14, 2, 'QA Engineer', '2024-02-10', 95000, 5, NULL),
(14, 15, 1, 'HR Executive', '2024-03-15', 65000, 5, NULL),
(15, 16, 0, 'Auditor', '2022-10-01', 115000, 8, '2023-10-01'),
(16, 17, 2, 'Frontend Dev', '2023-09-01', 135000, 10, '2024-09-01'),
(17, 18, 2, 'Junior SE', '2024-06-01', 65000, 5, NULL),
(18, 19, 4, 'Sales Rep', '2024-01-20', 62000, 5, NULL),
(19, 20, 4, 'Marketing Lead', '2023-05-05', 110000, 8, '2024-05-05'),
(20, 21, 1, 'HR Assistant', '2024-04-10', 55000, 5, NULL),
(21, 22, 2, 'Tech Lead', '2020-01-01', 350000, 20, '2025-01-01'),
(22, 23, 0, 'Finance Manager', '2021-06-15', 175000, 10, '2024-06-15'),
(23, 24, 2, 'Network Engineer', '2023-11-01', 120000, 7, '2024-11-01'),
(24, 25, 2, 'Data Scientist', '2023-02-28', 210000, 12, '2024-02-28'),
(25, 26, 4, 'Sales Rep', '2024-07-01', 60000, 5, NULL),
(26, 27, 0, 'Clerk', '2024-08-01', 45000, 5, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `leave_requests`
--

CREATE TABLE `leave_requests` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `leave_type` enum('Short Leave','Day Off','Sick Leave','Casual Leave') NOT NULL,
  `date` date NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `status` enum('Pending','Approved','Rejected') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leave_requests`
--

INSERT INTO `leave_requests` (`id`, `employee_id`, `leave_type`, `date`, `start_time`, `end_time`, `reason`, `status`, `created_at`) VALUES
(1, 1, 'Short Leave', '2026-01-07', '05:04:00', '12:04:00', 'Medical', 'Approved', '2026-01-07 16:48:34');

-- --------------------------------------------------------

--
-- Table structure for table `qualifications`
--

CREATE TABLE `qualifications` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `qualification` varchar(150) NOT NULL,
  `institution` varchar(150) NOT NULL,
  `year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `qualifications`
--

INSERT INTO `qualifications` (`id`, `employee_id`, `qualification`, `institution`, `year`) VALUES
(1, 1, 'BICT hon\'s', 'University Of Kelaniya', 2026),
(3, 2, 'BSc Human Resource Management', 'NSBM Green University', 2022),
(4, 3, 'BSc (Hons) in IT', 'University of Moratuwa', 2022),
(5, 4, 'CIMA Passed Finalist', 'CIMA Sri Lanka', 2021),
(6, 6, 'HND in Networking', 'SLIIT', 2021),
(7, 8, 'BSc Computer Science', 'University of Colombo School of Computing (UCSC)', 2021),
(8, 21, 'MSc Computer Science', 'University of Peradeniya', 2018),
(9, 24, 'BSc Data Science', 'IIT Sri Lanka', 2022);

-- --------------------------------------------------------

--
-- Table structure for table `salary_history`
--

CREATE TABLE `salary_history` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `old_salary` int(11) NOT NULL,
  `new_salary` int(11) NOT NULL,
  `increment_percent` int(11) NOT NULL,
  `increment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `salary_history`
--

INSERT INTO `salary_history` (`id`, `employee_id`, `old_salary`, `new_salary`, `increment_percent`, `increment_date`) VALUES
(1, 1, 100000, 105000, 5, '2025-12-18');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','employee') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`) VALUES
(1, 'Admin', 'admin@ems.com', '$2y$10$BsoLb99N8RbGgr6GksYbzeSA1PxFcC0t2LzTaJSO9qgVqfZmVAaEq', 'admin'),
(2, 'Pasindu Ransika', 'pasindu@ems.com', '$2y$10$M2rjnXaQbNjHruXO1c0MGu6F6SQgaU78v0yW546HkPyMXLxMLCDAC', 'employee'),
(3, 'Kasun Perera', 'kasun@ems.com', '$2y$10$8WZ5QKk5mO8Sx7i9n0zQ9e4h1tY4hHn2Qf9cXGZJqP6M5Zk0q', 'employee'),
(4, 'Thilini Silva', 'thilini@ems.com', '$2y$10$8WZ5QKk5mO8Sx7i9n0zQ9e4h1tY4hHn2Qf9cXGZJqP6M5Zk0q', 'employee'),
(5, 'Mohamed Fazil', 'fazil@ems.com', '$2y$10$8WZ5QKk5mO8Sx7i9n0zQ9e4h1tY4hHn2Qf9cXGZJqP6M5Zk0q', 'employee'),
(6, 'Nuwan Pradeep', 'nuwan@ems.com', '$2y$10$8WZ5QKk5mO8Sx7i9n0zQ9e4h1tY4hHn2Qf9cXGZJqP6M5Zk0q', 'employee'),
(7, 'Dilshan Madushanka', 'dilshan@ems.com', '$2y$10$8WZ5QKk5mO8Sx7i9n0zQ9e4h1tY4hHn2Qf9cXGZJqP6M5Zk0q', 'employee'),
(8, 'Nadeesha Lakmali', 'nadeesha@ems.com', '$2y$10$8WZ5QKk5mO8Sx7i9n0zQ9e4h1tY4hHn2Qf9cXGZJqP6M5Zk0q', 'employee'),
(9, 'Chamara Fernando', 'chamara@ems.com', '$2y$10$8WZ5QKk5mO8Sx7i9n0zQ9e4h1tY4hHn2Qf9cXGZJqP6M5Zk0q', 'employee'),
(10, 'Suresh Kumar', 'suresh@ems.com', '$2y$10$8WZ5QKk5mO8Sx7i9n0zQ9e4h1tY4hHn2Qf9cXGZJqP6M5Zk0q', 'employee'),
(11, 'Isuru Udana', 'isuru@ems.com', '$2y$10$8WZ5QKk5mO8Sx7i9n0zQ9e4h1tY4hHn2Qf9cXGZJqP6M5Zk0q', 'employee'),
(12, 'Shehan Jayasuriya', 'shehan@ems.com', '$2y$10$8WZ5QKk5mO8Sx7i9n0zQ9e4h1tY4hHn2Qf9cXGZJqP6M5Zk0q', 'employee'),
(13, 'Fathima Rihana', 'rihana@ems.com', '$2y$10$8WZ5QKk5mO8Sx7i9n0zQ9e4h1tY4hHn2Qf9cXGZJqP6M5Zk0q', 'employee'),
(14, 'Amila Chinthaka', 'amila@ems.com', '$2y$10$8WZ5QKk5mO8Sx7i9n0zQ9e4h1tY4hHn2Qf9cXGZJqP6M5Zk0q', 'employee'),
(15, 'Ruwanthi De Silva', 'ruwanthi@ems.com', '$2y$10$8WZ5QKk5mO8Sx7i9n0zQ9e4h1tY4hHn2Qf9cXGZJqP6M5Zk0q', 'employee'),
(16, 'Malintha Gajanayake', 'malintha@ems.com', '$2y$10$8WZ5QKk5mO8Sx7i9n0zQ9e4h1tY4hHn2Qf9cXGZJqP6M5Zk0q', 'employee'),
(17, 'Kaveesha Bandara', 'kaveesha@ems.com', '$2y$10$8WZ5QKk5mO8Sx7i9n0zQ9e4h1tY4hHn2Qf9cXGZJqP6M5Zk0q', 'employee'),
(18, 'Ashan Priyanjan', 'ashan@ems.com', '$2y$10$8WZ5QKk5mO8Sx7i9n0zQ9e4h1tY4hHn2Qf9cXGZJqP6M5Zk0q', 'employee'),
(19, 'Gayani Weerasinghe', 'gayani@ems.com', '$2y$10$8WZ5QKk5mO8Sx7i9n0zQ9e4h1tY4hHn2Qf9cXGZJqP6M5Zk0q', 'employee'),
(20, 'Ranjith Premadasa', 'ranjith@ems.com', '$2y$10$8WZ5QKk5mO8Sx7i9n0zQ9e4h1tY4hHn2Qf9cXGZJqP6M5Zk0q', 'employee'),
(21, 'Niroshan Dickwella', 'niroshan@ems.com', '$2y$10$8WZ5QKk5mO8Sx7i9n0zQ9e4h1tY4hHn2Qf9cXGZJqP6M5Zk0q', 'employee'),
(22, 'Lahiru Thirimanne', 'lahiru@ems.com', '$2y$10$8WZ5QKk5mO8Sx7i9n0zQ9e4h1tY4hHn2Qf9cXGZJqP6M5Zk0q', 'employee'),
(23, 'Wanindu Perera', 'wanindu@ems.com', '$2y$10$8WZ5QKk5mO8Sx7i9n0zQ9e4h1tY4hHn2Qf9cXGZJqP6M5Zk0q', 'employee'),
(24, 'Maheesh Kumara', 'maheesh@ems.com', '$2y$10$8WZ5QKk5mO8Sx7i9n0zQ9e4h1tY4hHn2Qf9cXGZJqP6M5Zk0q', 'employee'),
(25, 'Pathum Nissanka', 'pathum@ems.com', '$2y$10$8WZ5QKk5mO8Sx7i9n0zQ9e4h1tY4hHn2Qf9cXGZJqP6M5Zk0q', 'employee'),
(26, 'Dasun Shanaka', 'dasun@ems.com', '$2y$10$8WZ5QKk5mO8Sx7i9n0zQ9e4h1tY4hHn2Qf9cXGZJqP6M5Zk0q', 'employee'),
(27, 'Yvonne Gunaratne', 'yvonne@ems.com', '$2y$10$8WZ5QKk5mO8Sx7i9n0zQ9e4h1tY4hHn2Qf9cXGZJqP6M5Zk0q', 'employee');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_att_employee` (`employee_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user` (`user_id`),
  ADD KEY `fk_department` (`department_id`);

--
-- Indexes for table `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_leave_employee` (`employee_id`);

--
-- Indexes for table `qualifications`
--
ALTER TABLE `qualifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_qual_employee` (`employee_id`);

--
-- Indexes for table `salary_history`
--
ALTER TABLE `salary_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_salary_employee` (`employee_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `leave_requests`
--
ALTER TABLE `leave_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `qualifications`
--
ALTER TABLE `qualifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `salary_history`
--
ALTER TABLE `salary_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `fk_att_employee` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `fk_department` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD CONSTRAINT `fk_leave_employee` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `qualifications`
--
ALTER TABLE `qualifications`
  ADD CONSTRAINT `fk_qual_employee` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `salary_history`
--
ALTER TABLE `salary_history`
  ADD CONSTRAINT `fk_salary_employee` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
