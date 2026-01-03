# 💬 Azteron Case

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.35.0+-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter"/>
  <img src="https://img.shields.io/badge/Dart-3.9.0+-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart"/>
  <img src="https://img.shields.io/badge/License-MIT-green?style=for-the-badge" alt="License"/>
  <img src="https://img.shields.io/badge/style-very_good_analysis-B22C89?style=for-the-badge" alt="Style"/>
</p>

<p align="center">
  <b>A modern, feature-rich messaging application built with Flutter</b>
</p>

<p align="center">
  📱 iOS • 🤖 Android • 🌐 Web • 🖥️ Windows
</p>

---

## 📋 Table of Contents

- [Overview](#-overview)
- [Features](#-features)
- [Screenshots](#-screenshots)
- [Architecture](#-architecture)
- [Tech Stack](#-tech-stack)
- [Project Structure](#-project-structure)
- [Getting Started](#-getting-started)
- [Running the App](#-running-the-app)
- [Testing](#-testing)
- [Localization](#-localization)
- [Theming](#-theming)
- [Contributing](#-contributing)
- [License](#-license)

---

## 🎯 Overview

**Azteron Case** is a beautifully crafted messaging application that demonstrates modern Flutter development practices. Built with Clean Architecture principles and BLoC pattern for state management, this app showcases how to build scalable, maintainable, and testable Flutter applications.

Whether you're learning Flutter or looking for a solid foundation for your next messaging app, Azteron Case provides a comprehensive example of best practices in action.

---

## ✨ Features

### 💬 Messaging
- 📨 **Conversations List** - View all your chats at a glance
- 💭 **Real-time Chat** - Smooth messaging experience with message bubbles
- 🔍 **Search** - Quickly find conversations
- 🔢 **Unread Badges** - Never miss important messages
- 📅 **Date Separators** - Organized message history
- 📲 **Haptic Feedback** - Tactile response on message send

### 👤 User Experience
- 🟢 **Online Status** - See who's available
- 🖼️ **User Avatars** - Profile pictures with status indicators
- ⏰ **Timestamps** - Know when messages were sent
- 📜 **Auto-scroll** - Automatically scroll to latest messages

### 🎨 Design & Theming
- 🌙 **Dark Mode** - Easy on the eyes
- ☀️ **Light Mode** - Classic bright theme
- 🔄 **System Theme** - Follows your device settings
- 💾 **Persistent Preferences** - Remembers your choices

### 🌍 Internationalization
- 🇺🇸 **English** - Full English support
- 🇹🇷 **Turkish** - Complete Turkish translation
- 🔧 **Extensible** - Easy to add more languages

### ⚡ Performance
- 💀 **Shimmer Loading** - Beautiful loading skeletons
- 🗃️ **Smart Caching** - Efficient data persistence
- 🚀 **Optimized Rendering** - Smooth 60fps animations

---

## 📸 Screenshots

> *Screenshots coming soon*

---

## 🏗️ Architecture

Azteron Case follows **Clean Architecture** principles with clear separation of concerns:

```
┌─────────────────────────────────────────────────────────┐
│                    Presentation Layer                    │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐     │
│  │   Widgets   │  │    Views    │  │    Pages    │     │
│  └─────────────┘  └─────────────┘  └─────────────┘     │
├─────────────────────────────────────────────────────────┤
│                   Business Logic Layer                   │
│  ┌─────────────────────────────────────────────────┐   │
│  │              BLoC / Cubit (State Management)     │   │
│  └─────────────────────────────────────────────────┘   │
├─────────────────────────────────────────────────────────┤
│                      Data Layer                          │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐     │
│  │   Models    │  │ Repositories │  │    Cache    │     │
│  └─────────────┘  └─────────────┘  └─────────────┘     │
└─────────────────────────────────────────────────────────┘
```

### 🔑 Key Principles

| Principle | Implementation |
|-----------|----------------|
| **Single Responsibility** | Each class has one job |
| **Dependency Injection** | BLoC providers for loose coupling |
| **Separation of Concerns** | Clear layer boundaries |
| **Testability** | Mock repositories for easy testing |
| **Scalability** | Feature-based modular structure |

---

## 🛠️ Tech Stack

### Core Framework
| Technology | Purpose |
|------------|---------|
| 💙 **Flutter 3.35+** | Cross-platform UI framework |
| 🎯 **Dart 3.9+** | Programming language |

### State Management
| Package | Purpose |
|---------|---------|
| 📦 **flutter_bloc** | BLoC pattern implementation |
| 🔄 **bloc** | Core BLoC library |
| ⚖️ **equatable** | Value equality for states |

### Navigation
| Package | Purpose |
|---------|---------|
| 🧭 **auto_route** | Type-safe routing |
| 🔧 **auto_route_generator** | Route code generation |

### UI & Styling
| Package | Purpose |
|---------|---------|
| 🖼️ **flutter_svg** | SVG asset rendering |
| ✍️ **google_fonts** | Beautiful typography |
| ✨ **shimmer** | Loading skeleton effects |

### Data & Storage
| Package | Purpose |
|---------|---------|
| 💾 **shared_preferences** | Local key-value storage |

### Localization
| Package | Purpose |
|---------|---------|
| 🌐 **flutter_localizations** | i18n support |
| 🔤 **intl** | Internationalization utilities |

### Development & Testing
| Package | Purpose |
|---------|---------|
| 🧪 **flutter_test** | Testing framework |
| 🎭 **mocktail** | Mocking library |
| 📊 **bloc_test** | BLoC testing utilities |
| 📝 **very_good_analysis** | Strict linting rules |

---

## 📁 Project Structure

```
azteron_case/
├── 📁 lib/
│   ├── 📄 main_development.dart     # 🔧 Development entry point
│   ├── 📄 main_staging.dart         # 🎭 Staging entry point
│   ├── 📄 main_production.dart      # 🚀 Production entry point
│   ├── 📄 bootstrap.dart            # ⚙️ App initialization
│   │
│   ├── 📁 app/                      # 🏠 App configuration
│   │   └── 📁 view/
│   │       └── 📄 app.dart          # Root MaterialApp widget
│   │
│   ├── 📁 core/                     # 🧱 Shared functionality
│   │   ├── 📁 cache/                # 💾 Data persistence
│   │   │   ├── 📄 cache_manager.dart
│   │   │   ├── 📄 cache_keys.dart
│   │   │   └── 📄 cacheable_model.dart
│   │   │
│   │   ├── 📁 constants/            # 📋 App constants
│   │   │   └── 📄 app_assets.dart
│   │   │
│   │   ├── 📁 extensions/           # 🔧 Dart extensions
│   │   │   └── 📄 context_extension.dart
│   │   │
│   │   ├── 📁 l10n/                 # 🌍 Localization
│   │   │   ├── 📁 arb/              # Translation files
│   │   │   │   ├── 📄 app_en.arb    # 🇺🇸 English
│   │   │   │   └── 📄 app_tr.arb    # 🇹🇷 Turkish
│   │   │   ├── 📁 generated/        # Auto-generated
│   │   │   └── 📁 state/
│   │   │       └── 📄 locale_cubit.dart
│   │   │
│   │   ├── 📁 navigation/           # 🧭 Routing
│   │   │   ├── 📄 app_router.dart
│   │   │   └── 📄 navigation_manager.dart
│   │   │
│   │   ├── 📁 theme/                # 🎨 Theming
│   │   │   ├── 📁 light/            # ☀️ Light theme
│   │   │   ├── 📁 dark/             # 🌙 Dark theme
│   │   │   └── 📄 theme_cubit.dart
│   │   │
│   │   └── 📁 widgets/              # 🧩 Reusable widgets
│   │       ├── 📄 avatar_with_status.dart
│   │       ├── 📄 shimmer_loading.dart
│   │       └── 📄 unread_badge.dart
│   │
│   └── 📁 features/                 # 🎯 Feature modules
│       ├── 📁 messages/             # 💬 Conversations list
│       │   ├── 📁 bloc/
│       │   ├── 📁 data/
│       │   │   ├── 📁 models/
│       │   │   └── 📁 repositories/
│       │   ├── 📁 view/
│       │   └── 📁 widgets/
│       │
│       └── 📁 chat_detail/          # 💭 Chat messages
│           ├── 📁 bloc/
│           ├── 📁 data/
│           │   ├── 📁 models/
│           │   └── 📁 repositories/
│           ├── 📁 view/
│           └── 📁 widgets/
│
├── 📁 test/                         # 🧪 Tests
├── 📁 assets/                       # 🖼️ Images & SVGs
├── 📁 android/                      # 🤖 Android config
├── 📁 ios/                          # 📱 iOS config
├── 📁 web/                          # 🌐 Web config
├── 📁 windows/                      # 🖥️ Windows config
├── 📄 pubspec.yaml                  # 📦 Dependencies
├── 📄 analysis_options.yaml         # 📝 Lint rules
└── 📄 l10n.yaml                     # 🌍 i18n config
```

---

## 🚀 Getting Started

### Prerequisites

Make sure you have the following installed:

- 📥 **Flutter SDK** 3.35.0 or higher
- 🎯 **Dart SDK** 3.9.0 or higher
- 💻 **IDE** (VS Code, Android Studio, or IntelliJ)
- 📱 **Device/Emulator** for testing

### Installation

1️⃣ **Clone the repository**
```bash
git clone https://github.com/your-username/azteron_case.git
cd azteron_case
```

2️⃣ **Install dependencies**
```bash
flutter pub get
```

3️⃣ **Generate code** (routes & localizations)
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

4️⃣ **Run the app**
```bash
flutter run --flavor development --target lib/main_development.dart
```

---

## 🏃 Running the App

This project supports **3 build flavors** for different environments:

### 🔧 Development
```bash
flutter run --flavor development --target lib/main_development.dart
```

### 🎭 Staging
```bash
flutter run --flavor staging --target lib/main_staging.dart
```

### 🚀 Production
```bash
flutter run --flavor production --target lib/main_production.dart
```

### 📱 Platform-Specific Commands

```bash
# iOS Simulator
flutter run -d iPhone --flavor development --target lib/main_development.dart

# Android Emulator
flutter run -d android --flavor development --target lib/main_development.dart

# Chrome (Web)
flutter run -d chrome --target lib/main_development.dart

# Windows Desktop
flutter run -d windows --target lib/main_development.dart
```

---

## 🧪 Testing

### Run All Tests
```bash
flutter test
```

### Run Tests with Coverage
```bash
very_good test --coverage --test-randomize-ordering-seed random
```

### Generate Coverage Report
```bash
# Generate HTML report
genhtml coverage/lcov.info -o coverage/

# Open in browser
open coverage/index.html
```

### Run Specific Tests
```bash
# Unit tests only
flutter test test/unit/

# Widget tests only
flutter test test/widget/

# Single test file
flutter test test/features/messages/messages_cubit_test.dart
```

---

## 🌍 Localization

Azteron Case supports multiple languages using Flutter's official internationalization system.

### 📍 Supported Languages

| Language | Code | Status |
|----------|------|--------|
| 🇺🇸 English | `en` | ✅ Complete |
| 🇹🇷 Turkish | `tr` | ✅ Complete |

### ➕ Adding a New String

1️⃣ Open `lib/core/l10n/arb/app_en.arb`:

```json
{
    "@@locale": "en",
    "messagesTitle": "Messages",
    "@messagesTitle": {
        "description": "Title for the messages screen"
    }
}
```

2️⃣ Add the Turkish translation in `lib/core/l10n/arb/app_tr.arb`:

```json
{
    "@@locale": "tr",
    "messagesTitle": "Mesajlar",
    "@messagesTitle": {
        "description": "Mesajlar ekranı başlığı"
    }
}
```

3️⃣ Run `flutter run` or manually generate:

```bash
flutter gen-l10n --arb-dir="lib/core/l10n/arb"
```

4️⃣ Use in your code:

```dart
import 'package:azteron_case/core/l10n/l10n.dart';

Text(context.l10n.messagesTitle)
```

### 🌐 Adding a New Language

1️⃣ Create a new ARB file: `lib/core/l10n/arb/app_es.arb` (for Spanish)

2️⃣ Update `ios/Runner/Info.plist`:

```xml
<key>CFBundleLocalizations</key>
<array>
    <string>en</string>
    <string>tr</string>
    <string>es</string>
</array>
```

3️⃣ Translate all strings and regenerate

---

## 🎨 Theming

### Theme Modes

The app supports three theme modes:

| Mode | Description |
|------|-------------|
| ☀️ **Light** | Bright, clean interface |
| 🌙 **Dark** | Eye-friendly dark colors |
| 🔄 **System** | Follows device settings |

### Accessing Theme in Code

```dart
// Using context extension
final colors = context.colors;
final textStyles = context.textStyles;

// Example usage
Container(
  color: colors.background,
  child: Text(
    'Hello',
    style: textStyles.titleLarge,
  ),
)
```

### Theme Persistence

Theme preference is automatically saved and restored using the caching system.

---

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1️⃣ **Fork** the repository

2️⃣ **Create** a feature branch
```bash
git checkout -b feature/amazing-feature
```

3️⃣ **Commit** your changes
```bash
git commit -m 'feat: add amazing feature'
```

4️⃣ **Push** to your branch
```bash
git push origin feature/amazing-feature
```

5️⃣ **Open** a Pull Request

### 📝 Commit Convention

This project uses [Conventional Commits](https://www.conventionalcommits.org/):

| Type | Description |
|------|-------------|
| `feat:` | New feature |
| `fix:` | Bug fix |
| `docs:` | Documentation |
| `style:` | Formatting |
| `refactor:` | Code refactoring |
| `test:` | Adding tests |
| `chore:` | Maintenance |

---

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- 💙 [Flutter](https://flutter.dev/) - Beautiful native apps in record time
- 🎯 [Dart](https://dart.dev/) - Client-optimized language
- 📦 [Very Good CLI](https://github.com/VeryGoodOpenSource/very_good_cli) - Project scaffolding
- 🧱 [flutter_bloc](https://bloclibrary.dev/) - State management

---

<p align="center">
  Made with ❤️ using Flutter
</p>

<p align="center">
  <a href="#-azteron-case">⬆️ Back to Top</a>
</p>
