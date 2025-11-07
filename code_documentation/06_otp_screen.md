# OTP Verification Screen

## File Path
`lib/features/authentication/otp_screen.dart`

## Purpose
Second step in authentication - verify email with 6-digit OTP code.

## Code Structure

### Main Widget
```dart
class OtpVerificationScreen extends StatefulWidget {
  final String email;
  const OtpVerificationScreen({super.key, required this.email});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}
```

### State Variables
```dart
class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  String otp = '';
  bool isComplete = false;
}
```

### OTP Input Widget
```dart
OtpInput(
  length: 6,
  onChanged: (value) {
    setState(() {
      otp = value;
      isComplete = value.length == 6;
    });
  },
  onCompleted: (value) {
    setState(() {
      otp = value;
      isComplete = true;
    });
  },
),
```

### Features
1. **Back Button** - Navigate to previous screen
2. **Dynamic Title** - Shows email where OTP was sent
3. **OTP Input** - 6-digit custom widget
4. **Resend Link** - TextButton for OTP resend
5. **Continue Button** - Enabled only when complete

### Button State Management
```dart
PrimaryButton(
  onPressed: isComplete
      ? () { Get.offAll(() => const SetupNameScreen()); }
      : () {},
  enabled: isComplete,
  title: AppLabels.continueAction,
  // ...
)
```

### Display Email
```dart
Text(
  AppLabels.otpSentTo(widget.email),
  style: AppTextStyle.bodyMedium.copyWith(
    color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.7),
  ),
),
```

### Navigation
- **Next**: `SetupNameScreen` (offAll - clears stack)
- **Trigger**: OTP completion + button press

## Code Rules Applied
✅ Required parameter (email)  
✅ State management for input tracking  
✅ Dynamic button enabling  
✅ Callback-based input handling  
✅ Clear visual feedback  
✅ Proper navigation clearing stack  
