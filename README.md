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

## Theming & UI Rules

We follow a ThemeData-first approach for all visual styling:

1. Use `Theme.of(context).colorScheme`, `textTheme`, `iconTheme`, and component themes for all colors and text styles. Avoid direct `Colors.*` and hex literals in widgets.
2. Gradients or brand visuals: define as static constants (e.g. `HotelManagerTheme.brandGradient`) only when they represent a unique brand asset; do not inline gradients in screens.
3. Shared widgets (`PrimaryButton`, `PrimaryTextField`, etc.) must derive their colors from `ThemeData` (e.g. `colorScheme.primary`, `onPrimary`, `primaryContainer`).
4. No feature-specific `ThemeExtension`s unless a cross-cutting concern truly cannot be expressed with existing `ThemeData` primitives. (Hotel Manager role extension was removed in favor of core theme primitives.)
5. Exceptions: CustomPainter art/icons may use fixed artistic colors for illustration; these should not be reused for general UI elements.
6. Disabled states: Use `colorScheme.primaryContainer` (background) and `onPrimaryContainer` (text/icons) for consistency.
7. If a new repeated semantic color emerges (e.g. status badges), add it to `colorScheme` mapping or a single `CustomThemeExtension` approved in code review—don't scatter constants.

## Layout & Spacing Rules

Use responsive sizing based on MediaQuery to ensure consistent UI across different screen sizes:

1. **Always use MediaQuery percentages for layout spacing**:
   ```dart
   final size = MediaQuery.of(context).size;
   final double width = size.width;
   final double height = size.height;
   
   // Horizontal padding: 8% of screen width
   padding: EdgeInsets.symmetric(horizontal: width * 0.08)
   
   // Vertical spacing: percentages of screen height
   SizedBox(height: height * 0.02)  // 2% spacing
   SizedBox(height: height * 0.03)  // 3% spacing
   ```

2. **Never use hardcoded fixed padding/margins for layout structure** (e.g., `padding: const EdgeInsets.all(24)`). Fixed values don't scale across devices.

3. **Small decorative spacing (< 12px) can remain fixed**: Icon-to-text gaps, border radius, small internal padding within components.

4. **Use Expanded/Flexible for flex layouts** to prevent overflow on constrained screens.

5. **Constants for semantic design tokens only**: Border radius, icon sizes, elevation values—not layout padding or container dimensions.

### Migration Notes
The project removed `HotelManagerRoleThemeExtension` and consolidated all role-specific button styling into `PrimaryButton`, relying on `colorScheme`. Existing screens that referenced `highContrastFill` now use `colorScheme.primary` and `onPrimary` for text contrast.

### Quick Checklist Before PR Merge
- No `Colors.` usage outside painters.
- Buttons/text fields inherit from `ThemeData` only.
- Gradients referenced via constant, not duplicated.
- Dark mode verified (contrast, cursor visibility, borders).
- Disabled component colors follow rule #6.
- MediaQuery percentages used for all layout padding/spacing.
- No hardcoded padding > 12px in layout structure.

