<?php
/**
 * Dashboard - Main streaming control center
 */

require_once __DIR__ . '/config/config.php';

?>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - <?php echo APP_NAME; ?></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/assets/css/dashboard.css">
</head>
<body>
    <div class="container-fluid p-4">
        <h1>Dashboard</h1>
        
        <div class="row mt-4">
            <!-- Live Status -->
            <div class="col-md-3 mb-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Live Status</h5>
                        <div class="display-4" id="live-status">🔴 OFFLINE</div>
                        <button class="btn btn-success w-100 mt-3" id="start-stream">Start Stream</button>
                        <button class="btn btn-danger w-100 mt-2 d-none" id="stop-stream">Stop Stream</button>
                    </div>
                </div>
            </div>
            
            <!-- Messages Per Minute -->
            <div class="col-md-3 mb-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Messages/Min</h5>
                        <div class="display-4 text-info" id="messages-per-minute">0</div>
                    </div>
                </div>
            </div>
            
            <!-- Total Messages -->
            <div class="col-md-3 mb-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Total Messages</h5>
                        <div class="display-4 text-warning" id="total-messages">0</div>
                    </div>
                </div>
            </div>
            
            <!-- Viewers -->
            <div class="col-md-3 mb-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Viewers</h5>
                        <div class="display-4 text-success" id="viewer-count">0</div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Chat Messages -->
        <div class="row mt-4">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0">Recent Messages</h5>
                    </div>
                    <div class="card-body" style="height: 400px; overflow-y: auto;">
                        <div id="messages-list">
                            <p class="text-muted">No messages yet</p>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Settings Panel -->
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0">Quick Settings</h5>
                    </div>
                    <div class="card-body">
                        <div class="mb-3">
                            <label for="tts-toggle" class="form-check-label">Enable TTS</label>
                            <input type="checkbox" class="form-check-input" id="tts-toggle" checked>
                        </div>
                        <div class="mb-3">
                            <label for="translation-toggle" class="form-check-label">Enable Translation</label>
                            <input type="checkbox" class="form-check-input" id="translation-toggle" checked>
                        </div>
                        <div class="mb-3">
                            <label for="superchats-only" class="form-check-label">Read Superchats Only</label>
                            <input type="checkbox" class="form-check-input" id="superchats-only">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/assets/js/dashboard.js"></script>
</body>
</html>
