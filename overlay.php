<?php
/**
 * OBS Overlay Page - Displays chat and alerts
 */

require_once __DIR__ . '/config/config.php';

?>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Overlay - <?php echo APP_NAME; ?></title>
    <link rel="stylesheet" href="/assets/css/overlay.css">
</head>
<body id="overlay-body">
    <!-- Theme will be loaded dynamically -->
    
    <!-- Chat Overlay -->
    <div id="chat-container" class="chat-overlay">
        <div id="chat-messages" class="chat-messages"></div>
    </div>
    
    <!-- Alert Overlay -->
    <div id="alert-container" class="alert-overlay"></div>
    
    <!-- Stats Overlay -->
    <div id="stats-container" class="stats-overlay">
        <div class="stat-item">
            <span class="stat-label">Messages:</span>
            <span class="stat-value" id="stat-messages">0</span>
        </div>
        <div class="stat-item">
            <span class="stat-label">Viewers:</span>
            <span class="stat-value" id="stat-viewers">0</span>
        </div>
    </div>

    <script src="/assets/js/overlay.js"></script>
</body>
</html>
