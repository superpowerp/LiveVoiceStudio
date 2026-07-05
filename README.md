# LiveVoiceStudio
LiveVoiceStudio จากที่บ้านเฮาเอง
# LiveVoiceStudio v1.0

ระบบสตรีมมิ่งที่อ่านข้อความจากแพลตฟอร์มต่างๆ ด้วยเสียงและแปลภาษา

## เทคโนโลยี

- **PHP 8.2**
- **MySQL**
- **Bootstrap 5**
- **JavaScript (Vanilla)**
- **WebSocket**
- **HTML5 & CSS3**
- **OBS Browser Source**
- **SQLite** (สำหรับ Log ชั่วคราว)
- **REST API**

## ฟีเจอร์หลัก

### Dashboard
- สถานะ Live
- จำนวนข้อความต่อนาที
- จำนวนผู้ชม
- จำนวนข้อความที่อ่านแล้ว
- Start / Stop

### Overlay OBS
- Cyber Neon
- Glass
- Dark
- Minimal

### Chat Support
- YouTube
- Twitch (ภายหลัง)
- TikTok (ภายหลัง)

### Voice (Text-to-Speech)
- ไทย
- อังกฤษ
- อ่านชื่อผู้ส่ง
- อ่านเฉพาะ Super Chat

### Translation
- อังกฤษ → ไทย
- ญี่ปุ่น → ไทย

### Logs & Export
- เก็บข้อความ
- Export CSV
- Export Excel

### Admin Panel
- Users
- Theme
- Voice
- Blacklist

## โครงสร้างโปรเจกต์
livevoice_studio/ ├── index.php ├── login.php ├── dashboard.php ├── overlay.php ├── control.php ├── config/ │ ├── config.php │ ├── database.php │ └── session.php ├── api/ │ ├── youtube.php │ ├── tts.php │ ├── chat.php │ ├── translate.php │ └── settings.php ├── admin/ │ ├── users.php │ ├── themes.php │ ├── voices.php │ └── logs.php ├── assets/ │ ├── css/ │ ├── js/ │ ├── img/ │ └── sounds/ ├── uploads/ ├── logs/ └── database/ └── livevoice.sql

## การติดตั้ง

### Requirements
- PHP 8.2+
- MySQL 5.7+
- Node.js (ถ้าใช้ WebSocket)
- Composer (สำหรับ dependencies)

### Steps
1. Clone repository
2. Configure `.env` file
3. Run database setup
4. Configure OBS Browser Source
5. Start application

## โมดูลหลัก (10 Modules)

1. ระบบติดตั้ง (Setup)
2. ระบบล็อกอิน (Authentication)
3. Dashboard
4. Overlay
5. ระบบรับข้อความ (Chat Receiver)
6. ระบบอ่านข้อความ (TTS)
7. ระบบฐานข้อมูล (Database)
8. ระบบจัดการ (Admin)
9. Export
10. ธีมและการตั้งค่า (Theme & Settings)

## License

MIT
