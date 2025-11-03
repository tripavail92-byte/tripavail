# TripAvail

A Flutter-based travel application for managing trips, accommodations, and travel experiences.

## Getting Started

### Prerequisites

- Flutter SDK (latest stable version) - Installed at `C:\develop\flutter`
- Android Studio / Visual Studio Code
- Android SDK (for Android development)
- Xcode (for iOS development on macOS)

**Note:** Flutter is already installed at `C:\develop\flutter`. If you need to add it to PATH permanently, run:
```bash
.\setup_flutter_path.bat
```

### Running the Project

**Quick Start (Windows)**
```bash
# Run the provided batch file
.\run_app.bat
```

**Option 1: Using Flutter CLI**
```bash
flutter pub get
flutter run                    # Run on default device
flutter run -d windows         # Run on Windows desktop
flutter run -d chrome          # Run on Chrome browser
```

**Option 2: Using VS Code**
- Open the project in VS Code
- Press `F5` or use the "Run" menu

**Option 3: Using Android Studio**
- Open the project in Android Studio
- Click the green "Run" button

### Platform-Specific Notes

- **Windows**: Pre-built executable available in `build/windows/x64/runner/Debug/tripavail.exe`
- **Android**: Run on connected device or emulator
- **iOS**: Requires macOS and Xcode

### Development Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Flutter Get Package](https://pub.dev/packages/get)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
