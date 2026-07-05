<?php
/**
 * Session Configuration
 */

return [
    'driver' => getenv('SESSION_DRIVER') ?: 'file',
    'lifetime' => 3600, // 1 hour in seconds
    'expire_on_close' => false,
    'encrypt' => false,
    'files' => storage_path('sessions'),
    'cookie' => 'LIVEVOICE_SESSION',
    'path' => '/',
    'domain' => null,
    'secure' => false,
    'http_only' => true,
    'same_site' => 'Lax',
];

?>
