# Self Attendance Management System 📱

A modern, secure, and easy-to-use Attendance Management System built with **Flutter** and **Firebase**. This app allows users to mark their daily attendance with one click and view their attendance history in real-time.

## 🚀 Key Features
- **Firebase Authentication**: Secure Sign-up and Login using Email/Password.
- **One-Tap Attendance**: Quick "Mark Attendance" button on the dashboard.
- **Duplicate Prevention**: Prevents users from marking attendance more than once per day.
- **Real-time Stats**: Track your total present days and attendance percentage instantly.
- **Real-time History**: View a chronological log of all past attendance records.
- **Premium UI**: Clean, responsive design with smooth animations.

## 📥 Download APP
You can download the latest version of the app directly from this repository:

[**⬇️ Download self-attendance.apk**](https://github.com/arp1511/self-attendance-management-system/raw/master/apk/self-attendance.apk)

---

## 🛠️ Project Structure
- `lib/services/auth_service.dart`: Firebase Auth logic.
- `lib/services/database_service.dart`: Firestore operations.
- `lib/screens/dashboard_screen.dart`: Main user interface.
- `lib/models/attendance_model.dart`: Data structure for attendance records.

## ⚙️ Setup Instructions
1. Clone the repository:
   ```bash
   git clone https://github.com/arp1511/self-attendance-management-system.git
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Follow the [FIREBASE_SETUP.md](FIREBASE_SETUP.md) guide to link your own Firebase project.
4. Run the app:
   ```bash
   flutter run
   ```

---
*Developed for efficient and transparent attendance tracking.*
