<?php
/**
 * Control Panel - Advanced settings and controls
 */

require_once __DIR__ . '/config/config.php';

?>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Control Panel - <?php echo APP_NAME; ?></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/assets/css/control.css">
</head>
<body>
    <div class="container-fluid p-4">
        <h1>Control Panel</h1>
        
        <div class="row mt-4">
            <!-- Stream Controls -->
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0">Stream Controls</h5>
                    </div>
                    <div class="card-body">
                        <div class="mb-3">
                            <label class="form-label">Stream Status</label>
                            <select class="form-select" id="stream-status">
                                <option value="offline">Offline</option>
                                <option value="live">Live</option>
                                <option value="scheduled">Scheduled</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Channel Name</label>
                            <input type="text" class="form-control" id="channel-name">
                        </div>
                        <button class="btn btn-primary">Save Changes</button>
                    </div>
                </div>
            </div>
            
            <!-- TTS Settings -->
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0">Text-to-Speech Settings</h5>
                    </div>
                    <div class="card-body">
                        <div class="mb-3">
                            <label class="form-label">TTS Engine</label>
                            <select class="form-select" id="tts-engine">
                                <option value="google">Google</option>
                                <option value="azure">Azure</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Speed</label>
                            <input type="range" class="form-range" id="tts-speed" min="0.5" max="2" step="0.1" value="1">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Pitch</label>
                            <input type="range" class="form-range" id="tts-pitch" min="0.5" max="2" step="0.1" value="1">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/assets/js/control.js"></script>
</body>
</html>
