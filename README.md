# 📸 Image Feed App

A Flutter application that allows users to pick images and display them in a responsive feed layout with dynamic card sizing based on image aspect ratio. The app supports Android, iOS, Web, and Desktop platforms.

---

## 🚀 Features

- Pick images from device storage (File Picker for desktop support)
- Store images locally using Base64 encoding
- Background image processing using Flutter isolates (`compute`)
- Dynamic feed layout with automatic card height adjustment
- Proper handling of portrait, landscape, and square images
- Responsive UI for mobile and desktop
- Clean Architecture with Repository Pattern and BLoC state management

---

## 🧠 Technical Highlights

- **Isolate-based Base64 encoding** to prevent UI thread blocking
- **Aspect Ratio detection** using image decoding
- **Local JSON storage** for offline persistence
- **BLoC state management** for scalable architecture
- Desktop-compatible file picking

> **Note:** Base64 storage is used as per assignment requirements. In production, file path or cached storage would be preferred for better performance and memory efficiency.

---

## 📱 Supported Platforms

- Android
- iOS
- Web
- Windows / macOS / Linux (Desktop)

---

## 🛠️ How to Run

### 1. Clone the repository
```bash
git clone <your-repo-url>
cd image_feed_app
### ### ### ### ### ### ### ### ### 

## ▶️ How to Run the App

### ### ### ### ### ### ### ### ### 
### 🔹 Prerequisites
Make sure you have installed:

- Flutter SDK (>= 3.x)
- Dart SDK
- Android Studio / VS Code
- Android Emulator or physical device  
  *(For desktop: Windows/macOS/Linux)*

Check Flutter installation:
```bash
flutter doctor

🔹 Step 1: Clone the Repository
git clone <your-github-repo-link>
cd image_feed_app

🔹 Step 2: Install Dependencies
flutter pub get

🔹 Step 3: Run the Application
Run on Mobile / Emulator:
flutter run

Run on Desktop (Windows example):
flutter run -d windows

Run on Web:
flutter run -d chrome


