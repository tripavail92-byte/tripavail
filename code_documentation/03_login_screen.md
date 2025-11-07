# Login Screen

## File Path
`lib/features/authentication/login_screen.dart`

## Purpose
User authentication screen with email/password login and social sign-in options.

## Code Structure

### Main Widget
```dart
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
```

### Form Controllers
```dart
class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
```

### Validation Functions
```dart
String? _validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email is required';
  }
  if (!value.contains('@')) {
    return 'Please enter a valid email';
  }
  return null;
}

String? _validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  }
  return null;
}
```

### Form Fields
1. **Email Field**
   - Type: EmailAddress keyboard
   - Capitalization: none
   - Input action: next
   - Validation: required, must contain @

2. **Password Field**
   - Type: PasswordTextField (obscured)
   - Input action: done
   - Validation: required

### Features
- **Auth Header** - Logo/branding at top
- **Forgot Password** - TextButton (right-aligned)
- **Primary Button** - Login action (centered, 55% width)
- **Sign Up Link** - Bottom, redirects to SignupScreen
- **Social Buttons** - Apple (iOS only) + Google

### Navigation
```dart
void _handleLogin() {
  // Validation...
  Get.offAll(() => const BottomNavBar());
}
```

### Platform-Specific UI
```dart
if (Platform.isIOS)
  SocialButtons(
    title: "Sign in with Apple",
    image: "https://pngimg.com/uploads/apple_logo/apple_logo_PNG19666.png",
    onTap: () async {},
  ),
```

### Dependencies
- `dart:io` - Platform detection
- `get` - Navigation
- Custom widgets: PrimaryButton, PrimaryTextField, SocialButtons
- Custom utilities: show_snackbar, app_labels, app_text_styles

## Code Rules Applied
✅ Dispose controllers in dispose()  
✅ Validation before submission  
✅ Error messaging via snackbar  
✅ Platform-specific conditional rendering  
✅ Responsive sizing (percentage-based)  
✅ Single responsibility methods  
✅ Reusable validation functions  
