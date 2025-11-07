# Onboarding Screen

## File Path
`lib/features/onboarding/onboarding_screen.dart`

## Purpose
Single-page onboarding with animated suitcases illustration and smooth page indicators.

## Code Structure

### Main Widget
```dart
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}
```

### State Management
```dart
class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  final int pageCount = 1; // Single onboarding screen
  
  final List<_OnboardPageData> pages = const [
    _OnboardPageData(
      title: AppLabels.onboardingDiscoverTitle,
      subtitle: AppLabels.onboardingDiscoverSubtitle,
      type: _OnboardType.suitcases,
    ),
  ];
}
```

### Key Features
1. **PageView Builder** - Supports multiple pages (currently 1)
2. **Skip Button** - Top-right, allows bypassing onboarding
3. **Animated Illustration** - `AnimatedTravelerIllustration` widget
4. **SmoothPageIndicator** - Visual page progress
5. **Primary Button** - "Next" action
6. **Responsive Layout** - Percentage-based spacing

### Navigation Flow
```dart
Future<void> _completeOnboarding() async {
  await Get.find<AppPreferencesController>().setBool(
    key: AppPreferenceLabels.hasOnboarded,
    value: true,
  );
  Get.offAll(() => const LoginScreen());
}
```

### Layout Structure
- **Top**: Skip button (right-aligned)
- **Center**: Illustration + Title + Subtitle
- **Bottom**: Page indicator + Next button

### Dependencies
- `smooth_page_indicator` - Dot indicators
- `get` - State management and navigation
- Custom preference controller
- Custom widgets and styles

## Code Rules Applied
✅ Stateful for PageController  
✅ Single responsibility per widget  
✅ Responsive spacing with MediaQuery percentages  
✅ Const constructors for data classes  
✅ Clean navigation with preference storage  
✅ Reusable widget composition  
