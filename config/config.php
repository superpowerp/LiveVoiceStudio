<?php
/**
 * LiveVoiceStudio Configuration
 */

// Environment
define('APP_NAME', 'LiveVoiceStudio');
define('APP_VERSION', '1.0.0');
define('APP_ENV', getenv('APP_ENV') ?: 'development');
define('DEBUG', APP_ENV === 'development');

// Base URL
define('BASE_URL', getenv('BASE_URL') ?: 'http://localhost');
define('BASE_PATH', dirname(dirname(__FILE__)));

// Timezone
date_default_timezone_set('Asia/Bangkok');

// Session
define('SESSION_TIMEOUT', 3600); // 1 hour
define('SESSION_NAME', 'LIVEVOICE_SESSION');

// Cookie
define('COOKIE_PATH', '/');
define('COOKIE_DOMAIN', '');
define('COOKIE_SECURE', false);
define('COOKIE_HTTPONLY', true);

// Upload Settings
define('UPLOAD_DIR', BASE_PATH . '/uploads/');
define('MAX_UPLOAD_SIZE', 10 * 1024 * 1024); // 10MB
define('ALLOWED_EXTENSIONS', ['jpg', 'jpeg', 'png', 'gif', 'mp3', 'wav']);

// Log Settings
define('LOG_DIR', BASE_PATH . '/logs/');
define('LOG_LEVEL', APP_ENV === 'development' ? 'debug' : 'error');

// WebSocket Settings
define('WEBSOCKET_HOST', getenv('WEBSOCKET_HOST') ?: 'localhost');
define('WEBSOCKET_PORT', getenv('WEBSOCKET_PORT') ?: 8080);
define('WEBSOCKET_SECURE', getenv('WEBSOCKET_SECURE') ?: false);

// API Settings
define('API_TIMEOUT', 30);
define('API_RETRY_COUNT', 3);

// TTS Settings
define('TTS_ENGINE', getenv('TTS_ENGINE') ?: 'google');
define('TTS_SPEED', 1.0);
define('TTS_PITCH', 1.0);

// Translation Settings
define('TRANSLATION_ENGINE', getenv('TRANSLATION_ENGINE') ?: 'google');
define('TRANSLATION_API_KEY', getenv('TRANSLATION_API_KEY') ?: '');

// Cache Settings
define('CACHE_DIR', BASE_PATH . '/cache/');
define('CACHE_TIMEOUT', 3600);

// Ensure directories exist
if (!is_dir(UPLOAD_DIR)) mkdir(UPLOAD_DIR, 0755, true);
if (!is_dir(LOG_DIR)) mkdir(LOG_DIR, 0755, true);
if (!is_dir(CACHE_DIR)) mkdir(CACHE_DIR, 0755, true);

?>
