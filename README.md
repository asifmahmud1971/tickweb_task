# 📚 Task App

Welcome to the **Task App**, a dynamic Flutter application that enhances reading experiences with intelligent voice feedback, real-time skill tracking, and multilingual support. Designed for scalability, testability, and modularity, this app uses Flutter’s latest development practices along with advanced tooling and structured state management.

---

## 🚀 Getting Started

This project uses **Flutter** with **flavor-based environments** for smooth development, staging, and production lifecycle management.

### ✅ Prerequisites

Before you begin, ensure you have the following installed:

- Flutter SDK (>= 3.0.0)
- Dart SDK
- Android Studio / VSCode
- Xcode (for iOS development)
- Firebase CLI (if using Firebase services)
- Git

---

## 🧪 Flavors and Build Commands

The app supports 3 environments:

- 🔧 `development`
- 🚧 `staging`
- 🚀 `production`

### ➤ Run the App (Based on Flavor)

```bash
# Development
flutter run --flavor development --target lib/main_development.dart

# Staging
flutter run --flavor staging --target lib/main_staging.dart

# Production
flutter run --flavor production --target lib/main_production.dart

➤ Build APK or App Bundle

# Development
flutter build apk --flavor development --target lib/main_development.dart
flutter build appbundle --flavor development --target lib/main_development.dart

# Staging
flutter build apk --flavor staging --target lib/main_staging.dart
flutter build appbundle --flavor staging --target lib/main_staging.dart

# Production
flutter build apk --flavor production --target lib/main_production.dart
flutter build appbundle --flavor production --target lib/main_production.dart


```
### ⚙️ Code Generation
Some parts of the app use code generation (e.g., dependency injection, localization, JSON parsing):
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```
### 📦 Key Dependencies
| Package                 | Purpose                         |
| ----------------------- |---------------------------------|
| `flutter_bloc`          | State management (BLoC pattern) |
| `dio`                   | API networking                  |
| `easy_localization`     | Multi-language support          |
| `flutter_easyloading`   | Loading overlay UI              |
| `get_it` + `injectable` | Dependency injection            |
| `lottie`                | Animations                      |
| `flutter_screenutil`    | Responsive layout               |
| `equatable`             | Value comparison in state       |
| `connectivity_plus`     | Network status detection        |
| `firebase_core`         | Firebase initialization         |
| `firebase_auth`         | Authentication                  |
| `cloud_firestore`       | Firestore database              |
| `firebase_messaging`    | Push notifications              |
| `firebase_analytics`    | Analytics tracking              |
 -------------------------------------------------------------
### 📂 Project Structure
```plaintext
lib/
├── core/                  # Core utilities and constants
├── features/              # Feature modules
│   ├── feature_one/       # Example feature module
│   ├── feature_two/       # Another feature module
├── main_development.dart  # Entry point for development flavor
├── main_staging.dart      # Entry point for staging flavor
├── main_production.dart    # Entry point for production flavor
├── app.dart               # App configuration and routing
├── di/                    # Dependency injection setup
├── localization/          # Localization files
├── utils/                 # Utility functions and helpers
└── widgets/               # Reusable widgets
```