# Coding Standards & Rules

## Established from Screen Analysis

### Widget Patterns

#### Stateful vs Stateless
```dart
// USE STATEFUL when:
- Managing TextEditingController
- Using AnimationController
- Tracking boolean flags (isEditing, isLoading)
- Handling async operations

// USE STATELESS when:
- Pure presentation
- No local state needed
- Receiving all data via constructor
```

#### Constructor Patterns
```dart
// Required parameters first, then optional
class MyScreen extends StatefulWidget {
  final String requiredParam;
  final String? optionalParam;
  
  const MyScreen({
    super.key,
    required this.requiredParam,
    this.optionalParam,
  });
}
```

### State Management

#### Controller Disposal
```dart
// ALWAYS dispose controllers
@override
void dispose() {
  emailController.dispose();
  passwordController.dispose();
  animationController.dispose();
  super.dispose();
}
```

#### Async State Updates
```dart
// CHECK mounted before setState after async
Future<void> loadData() async {
  final result = await apiCall();
  if (!mounted) return;  // ← CRITICAL
  setState(() {
    data = result;
  });
}
```

### Validation Patterns

#### Standard Structure
```dart
String? _validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email is required';
  }
  if (!value.contains('@')) {
    return 'Please enter a valid email';
  }
  return null;  // ← null means valid
}
```

#### Common Validations
```dart
// Name: min 2 chars
if (value == null || value.trim().length < 2) {
  return 'Name must be at least 2 characters';
}

// Password: min 6 chars
if (value == null || value.length < 6) {
  return 'Password must be at least 6 characters';
}

// Email: contains @
if (!value.contains('@')) {
  return 'Please enter a valid email';
}

// Match fields
if (value != passwordController.text) {
  return 'Passwords do not match';
}
```

### Responsive Design Rules

#### Spacing Constants
```dart
// Use percentages for consistent spacing
static const double _spacingSmall = 0.01;   // 1% height
static const double _spacingMedium = 0.015; // 1.5% height
static const double _spacingLarge = 0.02;   // 2% height
static const double _spacingXLarge = 0.03;  // 3% height

// Horizontal padding
static const double _horizontalPadding = 0.08; // 8% width

// Max content width
static const double _maxContentWidth = 560.0;
```

#### Usage
```dart
final size = MediaQuery.of(context).size;
final height = size.height;
final width = size.width;

// Vertical spacing
SizedBox(height: height * 0.02),

// Horizontal padding
padding: EdgeInsets.symmetric(horizontal: width * 0.08),

// Max width constraint
ConstrainedBox(
  constraints: const BoxConstraints(maxWidth: 560),
  child: content,
)
```

### Form Field Configuration

#### Standard TextField
```dart
PrimaryTextField(
  controller: controller,
  label: 'Label',
  hintText: 'Hint text',
  mandatory: true,  // Shows * indicator
  keyboardType: TextInputType.emailAddress,
  textCapitalization: TextCapitalization.none,
  inputAction: TextInputAction.next,
)
```

#### Capitalization Rules
```dart
TextCapitalization.words      // For names
TextCapitalization.none       // For emails, passwords
TextCapitalization.sentences  // For bio, descriptions
```

#### Keyboard Types
```dart
TextInputType.emailAddress    // Email fields
TextInputType.name            // Name fields
TextInputType.phone           // Phone numbers
TextInputType.number          // Numeric input
```

#### Input Actions
```dart
TextInputAction.next          // Move to next field
TextInputAction.done          // Close keyboard
TextInputAction.go            // Submit action
```

### Navigation Patterns

#### Forward Navigation
```dart
Get.to(() => const NextScreen());
```

#### Replace Current
```dart
Get.off(() => const NextScreen());
```

#### Clear Stack
```dart
Get.offAll(() => const HomeScreen());
```

#### Pass Data
```dart
Get.to(() => OtpScreen(email: emailController.text.trim()));
```

### Animation Standards

#### Controller Setup
```dart
class _MyScreenState extends State<MyScreen> 
    with TickerProviderStateMixin {
  
  late AnimationController _controller;
  late Animation<double> _animation;
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
```

#### Common Curves
```dart
Curves.easeInOut      // Smooth start and end
Curves.easeOut        // Fast start, slow end
Curves.easeOutCubic   // More pronounced ease out
Curves.elasticOut     // Bounce effect
Curves.linear         // Constant speed
```

### Error Handling

#### Loading State
```dart
bool isLoading = false;

Future<void> submit() async {
  setState(() => isLoading = true);
  try {
    await apiCall();
  } catch (e) {
    showErrorMessage(e.toString());
  } finally {
    if (mounted) setState(() => isLoading = false);
  }
}
```

#### Error Messages
```dart
// Use SnackBar for errors
void showErrorMessage(String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}
```

### Code Organization

#### Private Methods
```dart
// Validation
String? _validateEmail(String? value) { }

// Event handlers
void _handleLogin() { }

// UI builders
Widget _buildHeader() { }

// Utilities
int _calculateCompletion() { }
```

#### Private Widgets
```dart
// Use underscore for file-scoped widgets
class _HeroCard extends StatelessWidget { }
class _MetricRow extends StatelessWidget { }
```

### Constants Pattern

#### Class-Level Constants
```dart
class _MyScreenConstants {
  static const double padding = 20.0;
  static const double borderRadius = 12.0;
  static const String title = 'My Screen';
  static const int itemsPerPage = 10;
}
```

#### Usage
```dart
Container(
  padding: EdgeInsets.all(_MyScreenConstants.padding),
  // ...
)
```

### Data Models

#### Copy Method
```dart
class ProfileData {
  final String name;
  final String email;
  
  ProfileData({required this.name, required this.email});
  
  ProfileData copy({String? name, String? email}) {
    return ProfileData(
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }
}
```

#### Edit Pattern
```dart
late ProfileData profileData;
late ProfileData editData;

void _toggleEdit() {
  setState(() {
    editData = profileData.copy();
    isEditing = true;
  });
}

void _save() {
  setState(() {
    profileData = editData.copy();
    isEditing = false;
  });
}
```

### Platform-Specific Code

```dart
import 'dart:io';

if (Platform.isIOS) {
  // iOS-specific UI
}

if (Platform.isAndroid) {
  // Android-specific UI
}
```

### Null Safety

```dart
// Null-aware operators
final value = nullableValue ?? defaultValue;

// Null-aware method calls
nullableObject?.method();

// Null assertion (use sparingly)
final value = nullableValue!;

// Safe navigation
if (data != null) {
  // Use data safely
}
```

## Checklist for New Screens

- [ ] StatefulWidget if using controllers/state
- [ ] Dispose all controllers
- [ ] Validation functions return String? (null = valid)
- [ ] Use MediaQuery for responsive sizing
- [ ] Constants for spacing (percentages)
- [ ] ConstrainedBox(maxWidth: 560) for large screens
- [ ] Proper textCapitalization
- [ ] Correct keyboardType
- [ ] Input actions (next/done)
- [ ] Check mounted before async setState
- [ ] Get.offAll() to clear stack
- [ ] Private methods/widgets with underscore
- [ ] const constructors where possible
- [ ] Platform checks for specific features
- [ ] Loading and error states
- [ ] SnackBar for user feedback
