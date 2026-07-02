# Event Hub (event_hup)

A comprehensive Flutter application designed for managing and exploring events.

## Features

*   **State Management:** Powered by BLoC for predictable state management.
*   **Routing:** Utilizes GoRouter for declarative routing.
*   **Networking:** Robust API calls using Dio and Retrofit, with Pretty Dio Logger for debugging.
*   **Data Models:** Freezed and JSON Serializable for immutable models and seamless JSON parsing.
*   **Local Storage:** Securely store data using Flutter Secure Storage, SharedPreferences, and Sqflite.
*   **Localization:** Built-in multi-language support.
*   **UI/UX:** Responsive layouts with Flutter ScreenUtil, Skeletonizer for loading states, and custom typography (AirbnbCereal).
*   **Maps & Location:** Interactive maps integrated via flutter_map and latlong2.

## Tech Stack

- **Framework:** [Flutter](https://flutter.dev/)
- **State Management:** [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- **Dependency Injection:** [get_it](https://pub.dev/packages/get_it)
- **Networking:** [dio](https://pub.dev/packages/dio), [retrofit](https://pub.dev/packages/retrofit)
- **Routing:** [go_router](https://pub.dev/packages/go_router)
- **Local Database:** [sqflite](https://pub.dev/packages/sqflite), [shared_preferences](https://pub.dev/packages/shared_preferences)
- **UI Components:** [flutter_svg](https://pub.dev/packages/flutter_svg), [cached_network_image](https://pub.dev/packages/cached_network_image)

## Getting Started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (Version >= 3.11.5)
- Dart SDK

### Installation

1. Clone the repository
   ```bash
   git clone <repository-url>
   ```
2. Navigate to the project directory
   ```bash
   cd event_hup
   ```
3. Install dependencies
   ```bash
   flutter pub get
   ```
4. Run code generation (for Freezed, Retrofit, etc.)
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```
5. Run the application
   ```bash
   flutter run
   ```

## Code Generation

This project uses `build_runner` for code generation. If you make changes to files annotated with Freezed or Retrofit, make sure to run:

```bash
dart run build_runner build --delete-conflicting-outputs
```
