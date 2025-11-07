# Signup Screen

## File Path
`lib/features/authentication/signup_screen.dart`

## Purpose
User registration screen with name, email, password, and password confirmation fields.

## Code Structure

### Main Widget
```dart
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}
```

### Form Controllers
```dart
final TextEditingController nameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController confirmPasswordController = TextEditingController();
```

### Validation Rules
```dart
String? _validateName(String? value) {
  if (value == null || value.isEmpty) return 'Name is required';
  if (value.length < 2) return 'Name must be at least 2 characters';
  return null;
}

String? _validateEmail(String? value) {
  if (value == null || value.isEmpty) return 'Email is required';
  if (!value.contains('@')) return 'Please enter a valid email';
  return null;
}

String? _validatePassword(String? value) {
  if (value == null || value.isEmpty) return 'Password is required';
  if (value.length < 6) return 'Password must be at least 6 characters';
  return null;
}

String? _validateConfirmPassword(String? value) {
  if (value == null || value.isEmpty) return 'Please confirm your password';
  if (value != passwordController.text) return 'Passwords do not match';
  return null;
}
```

### Form Fields Order
1. **Full Name** - Capitalization: words, Action: next
2. **Email** - Capitalization: none, Action: next
3. **Password** - Obscured, Action: next
4. **Confirm Password** - Obscured, Action: done

### Signup Flow
```dart
void _handleSignup() {
  // Validate all fields in sequence
  final nameError = _validateName(nameController.text);
  if (nameError != null) { showErrorMessage(nameError); return; }
  
  // ... validate email, password, confirm password
  
  // Navigate to main app
  Get.offAll(() => const BottomNavBar());
}
```

### Features
- **Auth Header** - Consistent branding
- **Form Validation** - Sequential validation with early exit
- **Primary Button** - Centered, 55% width
- **Login Link** - Redirect to existing users
- **Social Signup** - Apple (iOS) + Google

### Dependencies
- `dart:io` - Platform detection
- `get` - Navigation
- Custom widgets and utilities

## Code Rules Applied
✅ All controllers disposed properly  
✅ Comprehensive validation  
✅ Password matching verification  
✅ Minimum length requirements  
✅ Sequential validation with feedback  
✅ Platform-specific rendering  
✅ Consistent error handling  
