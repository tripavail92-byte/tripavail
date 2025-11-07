# Developer Quick Start Guide

## 🎯 Welcome to TripAvail!

This guide will help you get started quickly with the codebase.

---

## 📚 Essential Reading (30 minutes)

### Read These First:
1. **[DIRECTORY_STRUCTURE.md](./DIRECTORY_STRUCTURE.md)** (15 min)
   - Understand where everything lives
   - Learn feature-first architecture
   - Quick reference for common paths

2. **[CODING_STANDARDS.md](./CODING_STANDARDS.md)** (10 min)
   - Coding patterns we follow
   - Validation, navigation, responsive design rules
   - Checklist for new screens

3. **[README.md](./README.md)** (5 min)
   - Index of all screen documentation
   - Overview of what's documented

---

## 🏗️ Project Architecture

### Feature-First Structure
```
lib/
  features/           ← Each feature is self-contained
    authentication/   ← Login, signup, etc.
    profile/          ← User profile
    partner/          ← Partner workspace
  widgets/            ← Reusable components
  utils/              ← Helpers and utilities
```

### Where to Find Things

| I Need... | Look In... |
|-----------|-----------|
| Login screen | `lib/features/authentication/login_screen.dart` |
| Splash animation | `lib/features/splash_screen/splash_screen.dart` |
| Profile page | `lib/features/profile/profile_screen.dart` |
| Reusable button | `lib/widgets/primary_button.dart` |
| Text constants | `lib/utils/app_labels.dart` |
| Colors/themes | `lib/utils/theme/constants/app_constants.dart` |
| App entry point | `lib/main.dart` |

---

## 🚀 Common Tasks

### Task 1: Create a New Screen

**Example**: Create a Settings Screen

```dart
// 1. Create file: lib/features/settings/settings_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripavail/utils/app_text_styles.dart';
import 'package:tripavail/widgets/primary_appbar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      appBar: const PrimaryAppBar(
        title: 'Settings',
        showBackArrowIcon: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
          child: Column(
            children: [
              // Your content here
            ],
          ),
        ),
      ),
    );
  }
}
```

**Checklist**:
- ✅ Use StatefulWidget if managing state
- ✅ Import GetX if using navigation
- ✅ Use MediaQuery for responsive sizing
- ✅ Add to `features/` folder
- ✅ Follow naming: `feature_name_screen.dart`

---

### Task 2: Create a Reusable Widget

**Example**: Create a Custom Card

```dart
// lib/widgets/info_card.dart
import 'package:flutter/material.dart';
import 'package:tripavail/utils/app_text_styles.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback? onTap;

  const InfoCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(icon, size: 24),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppTextStyle.titleMedium),
                    Text(subtitle, style: AppTextStyle.bodySmall),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

**When to create a widget**:
- ✅ Used in 3+ places
- ✅ Has clear single purpose
- ✅ Follows design system

---

### Task 3: Navigate Between Screens

```dart
// Forward navigation
import 'package:get/get.dart';
import 'package:tripavail/features/profile/profile_screen.dart';

// Push new screen
Get.to(() => const ProfileScreen());

// Replace current screen
Get.off(() => const LoginScreen());

// Clear stack and go to screen
Get.offAll(() => const HomeScreen());

// With parameters
Get.to(() => DetailScreen(id: '123'));
```

---

### Task 4: Add Form Validation

```dart
class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  
  @override
  void dispose() {
    emailController.dispose();  // ← ALWAYS dispose!
    super.dispose();
  }
  
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!value.contains('@')) {
      return 'Please enter a valid email';
    }
    return null;  // ← null means valid
  }
  
  void _handleSubmit() {
    final error = _validateEmail(emailController.text);
    if (error != null) {
      showErrorMessage(error);
      return;
    }
    // Proceed with submission
  }
}
```

---

### Task 5: Use App Constants

```dart
// Import constants
import 'package:tripavail/utils/app_labels.dart';
import 'package:tripavail/utils/app_text_styles.dart';
import 'package:tripavail/utils/theme/constants/app_constants.dart';

// Use text labels
Text(AppLabels.login)  // Don't hardcode strings!

// Use text styles
Text('Hello', style: AppTextStyle.headlineMedium)

// Use colors
Container(color: AppColors.primaryColor)

// Use gradients
Container(
  decoration: BoxDecoration(
    gradient: AppRoleGradients.traveller,
  ),
)
```

---

### Task 6: Make Responsive Layouts

```dart
class MyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.08,  // 8% padding
      ),
      child: Column(
        children: [
          SizedBox(height: height * 0.02),  // 2% spacing
          // Content
          SizedBox(height: height * 0.03),  // 3% spacing
        ],
      ),
    );
  }
}

// For large screens, add max width
Center(
  child: ConstrainedBox(
    constraints: const BoxConstraints(maxWidth: 560),
    child: content,
  ),
)
```

**Spacing percentages**:
- Small: `0.01` (1%)
- Medium: `0.02` (2%)
- Large: `0.03` (3%)
- Horizontal: `0.08` (8%)

---

## 🎨 Design System

### Colors
```dart
AppColors.primaryColor       // Main brand color
AppColors.secondaryColor     // Secondary brand
AppColors.backgroundColor    // Screen background
AppColors.greyColor          // Grey for text
```

### Text Styles
```dart
AppTextStyle.headlineLarge   // Big titles
AppTextStyle.headlineMedium  // Screen titles
AppTextStyle.titleLarge      // Section titles
AppTextStyle.bodyLarge       // Large body text
AppTextStyle.bodyMedium      // Normal body text
AppTextStyle.bodySmall       // Small text
```

### Widgets
```dart
PrimaryButton              // Main action button
PrimaryTextField           // Standard text input
PasswordTextField          // Password input
PrimaryAppBar             // App bar
OtpInput                  // 6-digit OTP
```

---

## ⚠️ Common Mistakes to Avoid

### ❌ DON'T
```dart
// Hardcoded strings
Text('Login')

// No controller disposal
@override
void dispose() {
  super.dispose();  // Missing controller.dispose()!
}

// Fixed sizes
SizedBox(height: 20)  // Not responsive!

// No validation
if (email.isEmpty) ...  // Use validation functions!

// Type-first folders
lib/screens/login.dart  // Wrong organization!
```

### ✅ DO
```dart
// Use constants
Text(AppLabels.login)

// Dispose controllers
@override
void dispose() {
  emailController.dispose();
  super.dispose();
}

// Responsive sizing
SizedBox(height: height * 0.02)

// Validation functions
String? _validateEmail(String? value) { ... }

// Feature-first folders
lib/features/authentication/login_screen.dart
```

---

## 🔍 Debugging Tips

### Find Text Labels
```bash
# Search for all text in app
grep -r "AppLabels\." lib/utils/app_labels.dart
```

### Find Screen Usage
```bash
# See where ProfileScreen is used
grep -r "ProfileScreen" lib/
```

### Check Navigation
```bash
# Find all navigation calls
grep -r "Get.to\|Get.off\|Get.offAll" lib/
```

---

## 📝 Code Review Checklist

Before submitting code, check:

- [ ] Controllers disposed in `dispose()`
- [ ] Used `AppLabels` instead of hardcoded strings
- [ ] Used `AppTextStyle` for text styling
- [ ] Responsive sizing with `MediaQuery`
- [ ] Validation functions for forms
- [ ] Proper navigation (Get.to, Get.off, Get.offAll)
- [ ] `const` constructors where possible
- [ ] File in correct `features/` folder
- [ ] Follows naming convention
- [ ] No warnings in VS Code
- [ ] Tested on different screen sizes

---

## 🆘 Getting Help

### Documentation
1. **Screen examples**: `01_splash_screen.md` - `11_partner_workspace_screen.md`
2. **Architecture**: `DIRECTORY_STRUCTURE.md`
3. **Standards**: `CODING_STANDARDS.md`

### Code Examples
Look at existing screens:
- **Simple form**: `lib/features/authentication/login_screen.dart`
- **Complex animations**: `lib/features/splash_screen/splash_screen.dart`
- **Edit mode**: `lib/features/profile/profile_screen.dart`
- **Dashboard**: `lib/features/partner/partner_workspace_screen.dart`

### Questions?
1. Check documentation first
2. Search existing code for similar patterns
3. Ask team lead

---

## 🎓 Learning Path

### Week 1: Basics
- [ ] Read all documentation
- [ ] Explore `lib/features/authentication/`
- [ ] Study `lib/widgets/` components
- [ ] Understand navigation flow

### Week 2: Practice
- [ ] Create a simple screen
- [ ] Add form validation
- [ ] Implement navigation
- [ ] Make it responsive

### Week 3: Advanced
- [ ] Work with GetX controllers
- [ ] Create complex layouts
- [ ] Add animations
- [ ] Optimize performance

---

## 🚀 You're Ready!

Start with small tasks and gradually take on bigger features. The codebase is well-organized and documented—you've got this! 💪

**Happy Coding!** 🎉

---

**Quick Links**:
- [Directory Structure](./DIRECTORY_STRUCTURE.md)
- [Coding Standards](./CODING_STANDARDS.md)
- [Screen Documentation](./README.md)
