# Developer Onboarding Guide

## 👋 Welcome to the TripAvail Development Team!

This guide will help you become productive quickly with our Flutter codebase.

---

## 📅 30-Day Onboarding Plan

### Week 1: Setup & Exploration

#### Day 1-2: Environment Setup
- [ ] Install Flutter SDK (3.35.7 or later)
- [ ] Install Dart (3.9.2 or later)
- [ ] Setup Android Studio / VS Code
- [ ] Clone repository
- [ ] Run `flutter pub get`
- [ ] Build and run on emulator/device

#### Day 3-4: Documentation
- [ ] Read **[QUICK_START.md](./QUICK_START.md)** (30 min)
- [ ] Study **[DIRECTORY_STRUCTURE.md](./DIRECTORY_STRUCTURE.md)** (45 min)
- [ ] Review **[CODING_STANDARDS.md](./CODING_STANDARDS.md)** (30 min)

#### Day 5: Code Exploration
- [ ] Explore `lib/features/authentication/` folder
- [ ] Read `01_splash_screen.md` through `04_signup_screen.md`
- [ ] Run app and test authentication flow
- [ ] Identify 3 reusable widgets in `lib/widgets/`

---

### Week 2: First Contributions

#### Day 6-7: Small Bug Fixes
- [ ] Pick a "good first issue" from task board
- [ ] Fix a UI alignment issue
- [ ] Submit first pull request
- [ ] Address code review feedback

#### Day 8-10: Simple Feature
- [ ] Create a new screen using template
- [ ] Add form validation
- [ ] Implement navigation
- [ ] Write basic documentation

#### Day 11-12: Testing
- [ ] Learn project testing patterns
- [ ] Write widget tests for your screen
- [ ] Test on different screen sizes
- [ ] Test light/dark themes

---

### Week 3: Medium Complexity

#### Day 13-15: State Management
- [ ] Study GetX patterns in codebase
- [ ] Create a GetX controller
- [ ] Implement reactive UI updates
- [ ] Handle loading states

#### Day 16-18: Complex UI
- [ ] Build a multi-step form
- [ ] Create custom animations
- [ ] Implement responsive grid layouts
- [ ] Optimize for performance

#### Day 19: Code Review
- [ ] Review 3 pull requests
- [ ] Provide constructive feedback
- [ ] Learn from others' code

---

### Week 4: Advanced Topics

#### Day 20-22: Feature Development
- [ ] Design and implement complete feature
- [ ] Create models, controllers, screens
- [ ] Write comprehensive tests
- [ ] Document your work

#### Day 23-25: Performance
- [ ] Profile app performance
- [ ] Optimize heavy screens
- [ ] Reduce widget rebuilds
- [ ] Implement lazy loading

#### Day 26-30: Independence
- [ ] Take ownership of a module
- [ ] Mentor newer developers
- [ ] Contribute to architecture decisions
- [ ] Update documentation

---

## 🎓 Learning Resources

### Flutter Essentials
```dart
// Master these concepts:
1. StatefulWidget vs StatelessWidget
2. BuildContext and MediaQuery
3. Navigation (Get.to, Get.off, Get.offAll)
4. Form validation
5. Async/await
6. GetX state management
```

### Project-Specific Patterns

#### 1. Screen Template
```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripavail/utils/app_labels.dart';
import 'package:tripavail/utils/app_text_styles.dart';
import 'package:tripavail/widgets/primary_appbar.dart';
import 'package:tripavail/widgets/primary_button.dart';

class MyFeatureScreen extends StatefulWidget {
  const MyFeatureScreen({super.key});

  @override
  State<MyFeatureScreen> createState() => _MyFeatureScreenState();
}

class _MyFeatureScreenState extends State<MyFeatureScreen> {
  // Controllers
  final TextEditingController _controller = TextEditingController();
  
  // State variables
  bool _isLoading = false;
  
  @override
  void initState() {
    super.initState();
    _loadData();
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    try {
      // Load data
    } catch (e) {
      // Handle error
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }
  
  String? _validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }
  
  void _handleSubmit() {
    final error = _validateInput(_controller.text);
    if (error != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error)),
      );
      return;
    }
    // Process submission
  }
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      appBar: const PrimaryAppBar(
        title: 'My Feature',
        showBackArrowIcon: true,
      ),
      body: SafeArea(
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : _buildContent(size),
      ),
    );
  }
  
  Widget _buildContent(Size size) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 560),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: size.height * 0.02),
              // Your content here
            ],
          ),
        ),
      ),
    );
  }
}
```

#### 2. Widget Template
```dart
import 'package:flutter/material.dart';
import 'package:tripavail/utils/app_text_styles.dart';

class MyCustomWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;

  const MyCustomWidget({
    super.key,
    required this.title,
    this.subtitle,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyle.titleMedium),
              if (subtitle != null) ...[
                const SizedBox(height: 4),
                Text(subtitle!, style: AppTextStyle.bodySmall),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
```

#### 3. Controller Template (GetX)
```dart
import 'package:get/get.dart';

class MyFeatureController extends GetxController {
  // Observable state
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final Rx<MyData?> data = Rx<MyData?>(null);
  
  @override
  void onInit() {
    super.onInit();
    loadData();
  }
  
  Future<void> loadData() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      
      // Fetch data from API
      final result = await fetchFromApi();
      data.value = result;
      
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
  
  Future<MyData> fetchFromApi() async {
    // API call
    throw UnimplementedError();
  }
}
```

---

## 🛠️ Development Workflow

### Daily Workflow
```bash
# 1. Start day - pull latest
git checkout main
git pull origin main

# 2. Create feature branch
git checkout -b feature/my-feature

# 3. Make changes
# ... code ...

# 4. Test locally
flutter run -d chrome  # Web
flutter run -d emulator-5554  # Android

# 5. Commit
git add .
git commit -m "feat: add my feature"

# 6. Push and create PR
git push origin feature/my-feature
```

### Before Committing
```bash
# Run these checks:
flutter analyze                    # Check for issues
flutter test                       # Run tests
flutter format lib/                # Format code
```

### Git Commit Messages
```bash
# Format: type: description

feat: add user profile screen
fix: resolve login validation bug
docs: update coding standards
refactor: improve authentication flow
style: format code
test: add profile screen tests
```

---

## 🎯 Key Files to Know

### Most Important Files
```dart
// 1. App Entry
lib/main.dart

// 2. Navigation
lib/features/home/bottom_nav_bar.dart

// 3. Theme
lib/utils/theme/constants/app_constants.dart
lib/utils/theme/app_light_theme.dart
lib/utils/theme/app_dark_theme.dart

// 4. Constants
lib/utils/app_labels.dart
lib/utils/app_text_styles.dart

// 5. Reusable Widgets
lib/widgets/primary_button.dart
lib/widgets/primary_text_field.dart
lib/widgets/primary_appbar.dart
```

### Configuration Files
```yaml
# pubspec.yaml - Dependencies
# analysis_options.yaml - Linting rules
# android/app/build.gradle.kts - Android config
# ios/Podfile - iOS dependencies
```

---

## 🐛 Common Issues & Solutions

### Issue 1: App Won't Build
```bash
# Solution:
flutter clean
flutter pub get
flutter run
```

### Issue 2: Import Errors
```dart
// ❌ Wrong
import '../widgets/button.dart';

// ✅ Correct
import 'package:tripavail/widgets/primary_button.dart';
```

### Issue 3: Responsive Layout Broken
```dart
// ❌ Fixed sizes
Container(
  width: 300,
  height: 200,
)

// ✅ Responsive
final size = MediaQuery.of(context).size;
Container(
  width: size.width * 0.8,
  height: size.height * 0.3,
)
```

### Issue 4: Navigation Not Working
```dart
// ✅ Must import GetX
import 'package:get/get.dart';

// Then use:
Get.to(() => const NextScreen());
```

### Issue 5: State Not Updating
```dart
// ❌ Forgot setState
isLoading = true;

// ✅ Use setState
setState(() {
  isLoading = true;
});

// ✅ Or use GetX
final isLoading = false.obs;
isLoading.value = true;  // Automatically updates UI
```

---

## 📝 Pull Request Checklist

Before submitting a PR:

### Code Quality
- [ ] No errors in `flutter analyze`
- [ ] All tests passing
- [ ] Code formatted (`flutter format lib/`)
- [ ] No hardcoded strings (use AppLabels)
- [ ] Controllers disposed properly
- [ ] No warnings in IDE

### Functionality
- [ ] Feature works as expected
- [ ] Tested on Android/iOS/Web
- [ ] Tested different screen sizes
- [ ] Tested light and dark themes
- [ ] Error cases handled

### Documentation
- [ ] Code comments for complex logic
- [ ] Update screen documentation if needed
- [ ] Update DIRECTORY_STRUCTURE.md if new folders
- [ ] Clear PR description

### Standards
- [ ] Follows CODING_STANDARDS.md
- [ ] File in correct features/ folder
- [ ] Naming conventions followed
- [ ] Responsive design implemented

---

## 🎨 UI/UX Guidelines

### Spacing
```dart
// Use percentage-based spacing
SizedBox(height: height * 0.01)  // Small (1%)
SizedBox(height: height * 0.02)  // Medium (2%)
SizedBox(height: height * 0.03)  // Large (3%)

// Horizontal padding
EdgeInsets.symmetric(horizontal: width * 0.08)  // 8%
```

### Colors
```dart
// Always use theme colors
AppColors.primaryColor
AppColors.backgroundColor

// For partner roles
AppRoleGradients.hotelManager
AppRoleGradients.tourOperator
AppRoleGradients.traveller
```

### Typography
```dart
// Use predefined styles
AppTextStyle.headlineLarge
AppTextStyle.headlineMedium
AppTextStyle.bodyMedium

// Don't hardcode font sizes!
```

### Widgets
```dart
// Use existing widgets first
PrimaryButton
PrimaryTextField
PrimaryAppBar
OtpInput

// Before creating new ones
```

---

## 🤝 Team Communication

### Daily Standup
- What did you do yesterday?
- What will you do today?
- Any blockers?

### Code Review
- Be constructive and respectful
- Point to specific standards
- Suggest improvements
- Approve when ready

### Questions
1. Check documentation first
2. Search codebase for examples
3. Ask in team chat
4. Schedule 1-on-1 if needed

---

## 🎉 You're Ready!

You now have everything you need to start contributing effectively. Remember:

- **Start small** - Build confidence with simple tasks
- **Ask questions** - No question is too small
- **Read code** - Learn from existing implementations
- **Be patient** - Mastery takes time
- **Have fun** - We're building something awesome!

Welcome to the team! 🚀

---

## 📚 Additional Resources

- **Flutter Docs**: https://flutter.dev/docs
- **Dart Docs**: https://dart.dev/guides
- **GetX Docs**: https://pub.dev/packages/get
- **Material Design**: https://material.io/design

---

**Questions?** Contact your team lead or check the documentation files in this folder.

**Happy Coding!** 💙
