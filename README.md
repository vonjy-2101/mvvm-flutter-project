# 📮 PostApp

**PostApp** is a small Flutter application that allows users to post, retrieve, and comment on posts from the free API [JSONPlaceholder](https://jsonplaceholder.typicode.com). The project follows the **MVVM** architecture for clear code organization, uses **Riverpod** for state management, **Dio** for network requests, and supports both **dark** and **light** themes.

---

## 📱 Screenshot

<p align="center">
  <img src="https://github.com/vonjy-2101/mvvm-flutter-project/blob/main/assets/screenshots/screenshot_1.png" alt="Home page (Dark mode)" width="30%" />
  <img src="https://github.com/vonjy-2101/mvvm-flutter-project/blob/main/assets/screenshots/screenshot_2.png" alt="Home page (Light mode)" width="30%" />
  <img src="https://github.com/vonjy-2101/mvvm-flutter-project/blob/main/assets/screenshots/screenshot_3.png" alt="Post comment page" width="30%" />
</p>

---

## ✨ Features

- 🔍 Display posts fetched from the REST API
- ➕ Create new posts
- 💬 Add and view comments on posts
- 🌙 Dark and light theme support
- ✅ **MVVM** architecture for better maintainability

---

## 🛠️ Technologies Used

- **Flutter**
- **Dio** (for HTTP requests)
- **Provider** (state management)
- **MVVM** (Model - View - ViewModel)
- **Material Design**

## Structure (MVVM)
```
lib/
├── core/             # Global configurations (themes, constants, di.)
├── models/           # Models
├── service/api       # API services
├── view_model/       # Presentation logic and providers(riverpod)
├── view/             # UI (widgets, pages)
├── main.dart 
```

## 🚀 Installation

Make sure you have Flutter installed on your machine, then follow these steps:

```bash
# 1. Clone the repository
git clone https://github.com/vonjy-2101/mvvm-flutter-project.git
cd mvvm-flutter-project

# 2. Install dependencies
flutter pub get

# 3. Run the application
flutter run
