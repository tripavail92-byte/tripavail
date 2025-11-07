# Splash Screen

## File Path
`lib/features/splash_screen/splash_screen.dart`

## Purpose
Premium luxury travel splash screen with animated travel elements and smooth transitions.

## Code Structure

### Main Widget
```dart
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
```

### Animation Controllers
- `_bgController` - Background fade animation (1500ms)
- `_logoController` - Logo entrance with scale, opacity, rotation (2000ms)
- `_textController` - Text slide and fade (1800ms)
- `_particlesController` - Continuous particle movement (8000ms, repeating)
- `_glowController` - Pulsing glow effect (3000ms, repeating)
- `_pulseController` - Logo pulse effect (2000ms, repeating reverse)
- `_hotelController` - Hotel floating animation (3000ms, repeating reverse)
- `_planeController` - Plane movement (4000ms, repeating)
- `_carController` - Car movement (3500ms, repeating)
- `_tourController` - Tour bus rotation (4500ms, repeating)
- `_mountainController` - Mountain floating (5000ms, repeating reverse)

### Key Features
1. **Animated Background** - Gradient with floating orbs
2. **Floating Particles** - Moving dots across screen
3. **Travel Elements**:
   - Hotel with glow effect
   - Plane with trail
   - Car with wheels
   - Tour bus with windows
   - Mountains (custom painter)
4. **Logo** - Centered with glow, scale, and rotation animations
5. **Text** - App name and tagline with slide-up animation
6. **Loading Indicator** - Three pulsing dots at bottom

### Animation Sequence
```dart
void _startAnimations() async {
  _bgController.forward();
  await Future.delayed(const Duration(milliseconds: 300));
  _logoController.forward();
  await Future.delayed(const Duration(milliseconds: 800));
  _textController.forward();
}
```

### Navigation
- **Duration**: 4000ms total
- **Next Screen**: `OnboardingScreen`
- **Method**: `Get.offAll()` (removes from stack)

### Dependencies
- `dart:math` - For trigonometric calculations
- `flutter/material.dart` - UI framework
- `get` - Navigation
- Custom utils for labels, styles, constants

## Code Rules Applied
✅ Stateful widget for animations  
✅ Dispose all controllers in dispose()  
✅ Use const constructors where possible  
✅ Animation curves for smooth transitions  
✅ Responsive sizing with MediaQuery  
✅ Custom painters for complex graphics  
✅ Proper widget composition  
