<?php
/**
 * LiveVoiceStudio - Main Entry Point
 */

require_once __DIR__ . '/config/config.php';

// Check if user is logged in
if (empty($_SESSION['user_id'])) {
    header('Location: /login.php');
    exit;
}

?>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo APP_NAME; ?> - Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/assets/css/main.css">
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar Navigation -->
            <nav class="col-md-2 d-md-block bg-dark sidebar">
                <div class="position-sticky pt-3">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link" href="/dashboard.php">
                                <i class="bi bi-speedometer2"></i> Dashboard
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/control.php">
                                <i class="bi bi-joystick"></i> Control Panel
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/overlay.php">
                                <i class="bi bi-display"></i> Overlay
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/admin/users.php">
                                <i class="bi bi-people"></i> Users
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/admin/themes.php">
                                <i class="bi bi-palette"></i> Themes
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/admin/voices.php">
                                <i class="bi bi-megaphone"></i> Voices
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/admin/logs.php">
                                <i class="bi bi-file-text"></i> Logs
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>

            <!-- Main Content -->
            <main class="col-md-10 ms-sm-auto px-md-4">
                <h1>Welcome to <?php echo APP_NAME; ?> v<?php echo APP_VERSION; ?></h1>
                <p>Please navigate using the menu on the left.</p>
            </main>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
