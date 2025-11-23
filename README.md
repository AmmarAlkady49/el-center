# 📱 ElCenter Mobile App

<p align="center">
  <img src="assets/images/el_center_splash_logo.png" alt="ElCenter Logo" width="200"/>
</p>

<p align="center">
  <strong>Discover Your Learning Path with ElCenter</strong><br>
  Unlock your potential with expert-led courses. Learn at your own pace and achieve your goals with structured, AI-powered learning paths.
</p>

<div align="center">
  <img src="https://img.shields.io/badge/Flutter-3.27-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter">
  <img src="https://img.shields.io/badge/Dart-3.0+-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart">
  <img src="https://img.shields.io/badge/AI-Powered-FF6B35?style=for-the-badge&logo=brain&logoColor=white" alt="AI">
  <img src="https://img.shields.io/badge/Paymob-Payment-00D4AA?style=for-the-badge&logo=payment&logoColor=white" alt="Paymob">
  <img src="https://img.shields.io/badge/Google-Sign--In-4285F4?style=for-the-badge&logo=google&logoColor=white" alt="Google Sign-In">
</div>

---

## 🧭 Table of Contents

- [📱 App Demo Preview](#-app-demo-preview)
- [📘 About the Project](#-about-the-project)
- [✨ Key Features](#-key-features)
- [🛠 Tech Stack](#-tech-stack)
- [📂 Project Structure](#-project-structure)
- [⚙️ Getting Started](#️-getting-started)
- [🖼 Screenshots](#-screenshots)
- [🔗 Related Repositories](#-related-repositories)
- [📞 Contact](#-contact)

---

## 📱 App Demo Preview

<p align="center">
  <img src="assets/screens/screenRecord.gif" alt="App Demo" width="250"/>
</p>

> **Note:** Experience the future of mobile learning with AI-powered assistance and intuitive course navigation.

---

## 📘 About the Project

**ElCenter** is a cutting-edge AI-powered e-learning platform designed to revolutionize how students learn. By combining interactive lessons, intelligent AI assistance, and personalized learning paths, ElCenter creates an engaging educational experience tailored to each learner's needs.

This repository contains the **Flutter mobile application** — the primary interface where students can:

- Access comprehensive course libraries
- Take interactive exams and assessments
- Interact with an AI-powered learning assistant
- Track their progress and achievements
- Learn on-the-go with audio mode

### 🎯 Project Goals

- **Accessibility:** Make quality education available to everyone, anywhere
- **Personalization:** Adapt learning experiences to individual student needs
- **Engagement:** Create interactive and motivating learning environments
- **Intelligence:** Leverage AI to provide instant help and smart recommendations

---

## ✨ Key Features

### 🔐 **Authentication & Security**

- Social login integration (Google)
- Password recovery and email verification
- Persistent session management

### 🤖 **AI Chat Assistant**

- Powered by Groq API for intelligent responses
- Context-aware conversation handling
- Multilingual support
- Course-specific Q&A assistance
- Learning recommendations

### 🎓 **Learning Experience**

- **Structured Courses:** Organized learning paths with modules and lessons
- **Interactive Content:** Videos, articles, quizzes, and practical exercises
- **Progress Tracking:** Visual dashboards showing completion and achievements
- **Bookmarks:** Save important lessons for quick access

### 📝 **Assessments & Exams**

- Multiple question types (MCQ, True/False, Essay)
- Instant feedback and detailed explanations
- Performance analytics and improvement suggestions

---

## 🛠 Tech Stack

### **Core Technologies**

| Technology                                                                                      | Purpose                  | Version |
| ----------------------------------------------------------------------------------------------- | ------------------------ | ------- |
| ![Flutter](https://img.shields.io/badge/Flutter-02569B?style=flat&logo=flutter&logoColor=white) | Cross-platform framework | 3.24+   |
| ![Dart](https://img.shields.io/badge/Dart-0175C2?style=flat&logo=dart&logoColor=white)          | Programming language     | 3.5+    |

### **Backend & APIs**

- **REST API:** Custom backend integration
- **Groq AI API:** Intelligent chat assistant
- **Firebase Services:**
  - Authentication
  - Distribution

### **State Management & Architecture**

- **BLoC Pattern:** Business logic component architecture
- **Clean Architecture:** Separation of concerns and scalability

### **Key Packages**

```yaml
dependencies:
  # Core
  flutter_bloc: ^9.1.1 # BLoC pattern for state management
  get_it: ^8.0.3 # Service locator

  # Networking
  dio: ^5.8.0+1 # HTTP client
  retrofit: ^4.7.1 # Type-safe REST client
  pretty_dio_logger: ^1.4.0 # Network logging

  # Firebase
  firebase_core: ^4.2.0 # Firebase SDK

  # AI Integration
  groq: ^1.0.0 # Groq AI API

  # UI/UX
  flutter_svg: ^2.0.9
  cached_network_image: ^3.3.0
  shimmer: ^3.0.0

  # Media
  video_player: ^2.10.0 # Video playback
  chewie: ^1.12.1 # Video player UI
  image_picker: ^1.1.2 # Pick images/videos

  # Charts & Data Visualization
  fl_chart: ^1.1.1 # Beautiful charts
  percent_indicator: ^4.2.5 # Progress indicators

  # Storage
  shared_preferences: ^2.5.3 # Key-value storage

  # Localization
  easy_localization: ^3.0.3
```

---

## 📂 Project Structure

```
lib/
├── 📁 core/
│   ├── constants/          # App-wide constants
│   ├── errors/             # Error handling
│   ├── network/            # API client configuration
│   ├── themes/             # App themes and styles
│   └── utils/              # Helper functions and utilities
│
├── 📁 features/
│   ├── 🔐 auth/
│   │   ├── data/           # Data sources, models, repositories
│   │   └── presentation/   # UI, BLoC, widgets
│   │
│   ├── 🤖 chat/
│   │   ├── data/
│   │   └── presentation/
│   │
│   ├── 📚 courses/
│   │   ├── data/
│   │   └── presentation/
│   │
│   ├── 📝 exams/
│   │   ├── data/
│   │   └── presentation/
│   │
│   └── 👤 profile/
│       ├── data/
│       └── presentation/
│
├── 📁 services/            # Third-party integrations
│   ├── firebase_service.dart
│   ├── audio_service.dart
│   └── notification_service.dart
│
├── 📁 shared/
│   ├── widgets/            # Reusable widgets
│   └── extensions/         # Dart extensions
│
├── 📁 config/
│   ├── routes/             # Navigation configuration
│   ├── dependencies/       # Dependency injection
│   └── environment/        # Environment variables
│
└── main.dart               # App entry point
```

---

## ⚙️ Getting Started

### Prerequisites

Before you begin, ensure you have the following installed:

- **Flutter SDK:** Version 3.24 or higher ([Install Flutter](https://flutter.dev/docs/get-started/install))
- **Dart SDK:** Version 3.5 or higher (included with Flutter)
- **Android Studio** or **VS Code** with Flutter extensions
- **Git:** For version control
- **Firebase CLI:** For Firebase configuration (optional)

### Installation

1. **Clone the Repository**

   ```bash
   git clone https://github.com/AmmarAlkady49/el-center.git
   cd elcenter-mobile
   ```

2. **Install Dependencies**

   ```bash
   flutter pub get
   ```

3. **Generate Required Files**
   ```bash
   # Generate code for dependency injection, JSON serialization, etc.
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

---

## 🖼 Screenshots

<p align="center">
  <img src="assets/screens/1.png" alt="OnBoarding Screen" width="200"/>
  <img src="assets/screens/login.png" alt="Login" width="200"/>
  <img src="assets/screens/home.png" alt="Home" width="200"/>
    <img src="assets/screens/3.png" alt="Course Detail" width="200"/>

</p>

<p align="center">
  <img src="assets/screens/4.png" alt="AI Chat" width="200"/>
  <img src="assets/screens/2.png" alt="Exam" width="200"/>
</p>

---

## 🔗 Related Repositories

| Repository          | Description           | Link                                                                          |
| ------------------- | --------------------- | ----------------------------------------------------------------------------- |
| 🖥 **Backend API**   | C#/.Net backend       | [View Repository](https://github.com/WalidTawfik1/elcentre-learning-platfrom) |
| 🌐 **Web Platform** | React web application | [View Website](https://elcentre-learn.vercel.app/)                            |

---

## 📞 Contact

<p align="center">
  <strong>Ammar AlKady</strong><br>
  Lead Developer & Project Maintainer
</p>

<p align="center">
  <a href="mailto:ammaralkady49@gmail.com">
    <img src="https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=gmail&logoColor=white" alt="Email"/>
  </a>
  <a href="https://www.linkedin.com/in/ammar-alkady-97417b273/">
    <img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn"/>
  </a>
  <a href="https://github.com/AmmarAlkady49">
    <img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white" alt="GitHub"/>
  </a>
  <a href="https://www.behance.net/gallery/228592763/AI-Powered-E-commerce-App">
    <img src="https://img.shields.io/badge/behance-1DA1F2?style=for-the-badge&logo=behance&logoColor=white" alt="Behance"/>
  </a>
</p>

---

## 🌟 Support the Project

If you find this project helpful, please consider:

<p align="center">
  <a href="https://github.com/AmmarAlkady49/el-center">
    <img src="https://img.shields.io/github/stars/yourusername/elcenter-mobile?style=social" alt="Star on GitHub"/>
  </a>
  <a href="https://github.com/AmmarAlkady49/el-center/fork">
    <img src="https://img.shields.io/github/forks/yourusername/elcenter-mobile?style=social" alt="Fork on GitHub"/>
  </a>
</p>

⭐ **Starring this repository** — It helps others discover the project and motivates continued development

🐛 **Reporting bugs** — Help us improve by reporting issues

💡 **Suggesting features** — Share your ideas for new features

📖 **Improving documentation** — Help make our docs better

🔀 **Contributing code** — Submit pull requests for fixes or features

---

<p align="center">
  <strong>Built with ❤️ using Flutter, AI, and modern development practices</strong><br>
</p>

<p align="center">
  <a href="#-elcenter-mobile-app">⬆️ Back to Top</a>
</p>

---
