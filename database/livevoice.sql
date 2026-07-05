-- LiveVoiceStudio Database Schema

CREATE DATABASE IF NOT EXISTS `livevoice_studio`;
USE `livevoice_studio`;

-- ========================================
-- 1. Users Table
-- ========================================
CREATE TABLE `lv_users` (
  `id` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `username` VARCHAR(50) UNIQUE NOT NULL,
  `email` VARCHAR(100) UNIQUE NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `display_name` VARCHAR(100),
  `role` ENUM('admin', 'streamer', 'moderator') DEFAULT 'streamer',
  `avatar` VARCHAR(255),
  `is_active` BOOLEAN DEFAULT TRUE,
  `last_login` TIMESTAMP NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX `idx_username` (`username`),
  INDEX `idx_email` (`email`),
  INDEX `idx_role` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ========================================
-- 2. Settings Table
-- ========================================
CREATE TABLE `lv_settings` (
  `id` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `user_id` INT UNSIGNED NOT NULL,
  `channel_name` VARCHAR(100),
  `description` TEXT,
  `is_live` BOOLEAN DEFAULT FALSE,
  `stream_key` VARCHAR(255),
  `theme` VARCHAR(50) DEFAULT 'dark',
  `language` VARCHAR(10) DEFAULT 'th',
  `tts_enabled` BOOLEAN DEFAULT TRUE,
  `tts_speed` FLOAT DEFAULT 1.0,
  `tts_voice` VARCHAR(50) DEFAULT 'th-TH',
  `translation_enabled` BOOLEAN DEFAULT TRUE,
  `translation_source` VARCHAR(10) DEFAULT 'auto',
  `translation_target` VARCHAR(10) DEFAULT 'th',
  `read_superchats_only` BOOLEAN DEFAULT FALSE,
  `read_usernames` BOOLEAN DEFAULT TRUE,
  `chat_delay_ms` INT DEFAULT 0,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`user_id`) REFERENCES `lv_users` (`id`) ON DELETE CASCADE,
  UNIQUE KEY `unique_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ========================================
-- 3. Themes Table
-- ========================================
CREATE TABLE `lv_themes` (
  `id` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `user_id` INT UNSIGNED NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `slug` VARCHAR(50) UNIQUE NOT NULL,
  `description` TEXT,
  `css_file` VARCHAR(255),
  `config` JSON,
  `is_default` BOOLEAN DEFAULT FALSE,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`user_id`) REFERENCES `lv_users` (`id`) ON DELETE CASCADE,
  INDEX `idx_slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ========================================
-- 4. Voices Table
-- ========================================
CREATE TABLE `lv_voices` (
  `id` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `user_id` INT UNSIGNED NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `language` VARCHAR(10) NOT NULL,
  `engine` VARCHAR(50) DEFAULT 'google',
  `voice_id` VARCHAR(100),
  `gender` ENUM('male', 'female', 'neutral') DEFAULT 'neutral',
  `pitch` FLOAT DEFAULT 1.0,
  `speed` FLOAT DEFAULT 1.0,
  `is_active` BOOLEAN DEFAULT TRUE,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`user_id`) REFERENCES `lv_users` (`id`) ON DELETE CASCADE,
  INDEX `idx_language` (`language`),
  INDEX `idx_is_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ========================================
-- 5. Chat Logs Table
-- ========================================
CREATE TABLE `lv_chat_logs` (
  `id` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `user_id` INT UNSIGNED NOT NULL,
  `platform` ENUM('youtube', 'twitch', 'tiktok') NOT NULL,
  `platform_user_id` VARCHAR(100) NOT NULL,
  `username` VARCHAR(100) NOT NULL,
  `message` TEXT NOT NULL,
  `is_read` BOOLEAN DEFAULT FALSE,
  `tts_file` VARCHAR(255),
  `original_language` VARCHAR(10),
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`user_id`) REFERENCES `lv_users` (`id`) ON DELETE CASCADE,
  INDEX `idx_user_platform` (`user_id`, `platform`),
  INDEX `idx_created_at` (`created_at`),
  INDEX `idx_is_read` (`is_read`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ========================================
-- 6. Superchats Table
-- ========================================
CREATE TABLE `lv_superchat_logs` (
  `id` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `user_id` INT UNSIGNED NOT NULL,
  `chat_log_id` INT UNSIGNED NOT NULL,
  `platform` ENUM('youtube', 'twitch', 'tiktok') NOT NULL,
  `amount` DECIMAL(10, 2),
  `currency` VARCHAR(10),
  `color` VARCHAR(7),
  `is_read` BOOLEAN DEFAULT FALSE,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`user_id`) REFERENCES `lv_users` (`id`) ON DELETE CASCADE,
  FOREIGN KEY (`chat_log_id`) REFERENCES `lv_chat_logs` (`id`) ON DELETE CASCADE,
  INDEX `idx_user_id` (`user_id`),
  INDEX `idx_platform` (`platform`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ========================================
-- 7. Translation Cache Table
-- ========================================
CREATE TABLE `lv_translate_cache` (
  `id` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `source_text` TEXT NOT NULL,
  `source_language` VARCHAR(10) NOT NULL,
  `target_language` VARCHAR(10) NOT NULL,
  `translated_text` TEXT NOT NULL,
  `engine` VARCHAR(50) DEFAULT 'google',
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `unique_translation` (`source_language`, `target_language`, `source_text`(100)),
  INDEX `idx_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ========================================
-- 8. Blacklist Table
-- ========================================
CREATE TABLE `lv_blacklist` (
  `id` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `user_id` INT UNSIGNED NOT NULL,
  `platform` ENUM('youtube', 'twitch', 'tiktok') NOT NULL,
  `platform_user_id` VARCHAR(100),
  `username` VARCHAR(100),
  `reason` TEXT,
  `is_active` BOOLEAN DEFAULT TRUE,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`user_id`) REFERENCES `lv_users` (`id`) ON DELETE CASCADE,
  INDEX `idx_user_platform` (`user_id`, `platform`),
  INDEX `idx_is_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ========================================
-- 9. Stream History Table
-- ========================================
CREATE TABLE `lv_stream_history` (
  `id` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `user_id` INT UNSIGNED NOT NULL,
  `stream_title` VARCHAR(255),
  `stream_description` TEXT,
  `started_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `ended_at` TIMESTAMP NULL,
  `duration_seconds` INT,
  `total_messages` INT DEFAULT 0,
  `total_superchats` INT DEFAULT 0,
  `peak_viewers` INT DEFAULT 0,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`user_id`) REFERENCES `lv_users` (`id`) ON DELETE CASCADE,
  INDEX `idx_user_id` (`user_id`),
  INDEX `idx_started_at` (`started_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ========================================
-- 10. Alerts Table
-- ========================================
CREATE TABLE `lv_alerts` (
  `id` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `user_id` INT UNSIGNED NOT NULL,
  `type` ENUM('new_message', 'superchat', 'follow', 'subscribe') NOT NULL,
  `title` VARCHAR(255),
  `message` TEXT,
  `sound_file` VARCHAR(255),
  `duration_ms` INT DEFAULT 3000,
  `is_enabled` BOOLEAN DEFAULT TRUE,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`user_id`) REFERENCES `lv_users` (`id`) ON DELETE CASCADE,
  INDEX `idx_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ========================================
-- 11. API Tokens Table
-- ========================================
CREATE TABLE `lv_api_tokens` (
  `id` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `user_id` INT UNSIGNED NOT NULL,
  `name` VARCHAR(100),
  `token` VARCHAR(255) UNIQUE NOT NULL,
  `last_used_at` TIMESTAMP NULL,
  `expires_at` TIMESTAMP NULL,
  `is_active` BOOLEAN DEFAULT TRUE,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`user_id`) REFERENCES `lv_users` (`id`) ON DELETE CASCADE,
  INDEX `idx_token` (`token`),
  INDEX `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ========================================
-- 12. Activity Logs Table
-- ========================================
CREATE TABLE `lv_activity_logs` (
  `id` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `user_id` INT UNSIGNED,
  `action` VARCHAR(255),
  `details` JSON,
  `ip_address` VARCHAR(45),
  `user_agent` VARCHAR(255),
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`user_id`) REFERENCES `lv_users` (`id`) ON DELETE SET NULL,
  INDEX `idx_user_id` (`user_id`),
  INDEX `idx_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ========================================
-- Indexes for Performance
-- ========================================
CREATE INDEX `idx_chat_logs_read_created` ON `lv_chat_logs` (`is_read`, `created_at`);
CREATE INDEX `idx_stream_history_user_started` ON `lv_stream_history` (`user_id`, `started_at`);
CREATE INDEX `idx_superchat_user_created` ON `lv_superchat_logs` (`user_id`, `created_at`);

-- ========================================
-- Default Admin User (Password: admin123)
-- ========================================
INSERT INTO `lv_users` (`username`, `email`, `password`, `display_name`, `role`, `is_active`) 
VALUES 
('admin', 'admin@livevoice.local', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Administrator', 'admin', TRUE);

-- ========================================
-- Default Voices
-- ========================================
INSERT INTO `lv_voices` (`user_id`, `name`, `language`, `voice_id`, `gender`, `is_active`) 
VALUES 
(1, 'Thai Female', 'th', 'th-TH-Standard-A', 'female', TRUE),
(1, 'Thai Male', 'th', 'th-TH-Standard-B', 'male', TRUE),
(1, 'English Female', 'en', 'en-US-Standard-A', 'female', TRUE),
(1, 'English Male', 'en', 'en-US-Standard-B', 'male', TRUE);

-- ========================================
-- Default Themes
-- ========================================
INSERT INTO `lv_themes` (`user_id`, `name`, `slug`, `description`, `is_default`) 
VALUES 
(1, 'Dark', 'dark', 'Dark theme for streaming', TRUE),
(1, 'Cyber Neon', 'cyber-neon', 'Neon cyberpunk style', FALSE),
(1, 'Glass', 'glass', 'Glass morphism design', FALSE),
(1, 'Minimal', 'minimal', 'Minimalist clean design', FALSE);
