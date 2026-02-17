# 📸 Image Feed App

Image Feed App is a Flutter application that allows users to pick images and display them in a dynamic feed layout.  
The app processes images using isolates for performance optimization, stores images locally using Base64 encoding, and automatically adjusts card heights based on image aspect ratios to support portrait, landscape, and square images.

The project supports **Android, iOS, Web, and Desktop** platforms.

---

## ✨ Features

- 📷 Pick multiple images using File Picker (desktop + mobile supported)
- 🧵 Heavy image processing using Isolates (`compute`) to avoid UI blocking
- 🖼️ Dynamic feed layout with auto card height based on aspect ratio
- 🔄 Toggle between fixed and dynamic feed layout
- 💾 Local storage using Base64 encoded images (as per assignment requirement)
- ⚡ Smooth scrolling with performance optimizations
- 🖥️ Desktop UI refactored for responsive layout

---

## 🏗️ Architecture

The project follows **Clean Architecture**:

lib/
├── core/
├── features/
│ ├── data/
│ ├── domain/
│ ├── presentation/
└── main.dart


### Layers
- **Presentation** → UI + BLoC  
- **Domain** → Entities + Use Cases  
- **Data** → Repositories + Local Data Source  

---

## ⚙️ Technical Decisions

- Base64 encoding is done in a background isolate using `compute()` to avoid blocking the main thread.
- Image aspect ratio is calculated to render cards dynamically.
- Local storage is implemented using JSON files (Hive recommended for production).

> **Note:** Base64 storage is used as per assignment requirements. In production, file path or cached storage would be preferred for better performance and memory efficiency.

---

## 🚀 Getting Started

### Prerequisites
- Flutter 3.x
- Dart 3.x
- Android Studio / VS Code
- Flutter SDK added to PATH

---

### 1️⃣ Clone Repository

```bash
git clone https://github.com/banitaparamanik/image_feed_app.git
cd image_feed_app

2️⃣ Install Dependencies
flutter pub get

3️⃣ Run on Mobile
flutter run
4️⃣ Run on Desktop
flutter run -d windows

5️⃣ Run on Web
flutter run -d chrome