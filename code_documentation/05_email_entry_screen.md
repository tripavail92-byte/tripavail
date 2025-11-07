# Email Entry Screen

## File Path
`lib/features/authentication/email_entry_screen.dart`

## Purpose
First step in authentication flow - captures user's email address for OTP verification.

## Code Structure

### Main Widget
```dart
class EmailEntryScreen extends StatefulWidget {
  const EmailEntryScreen({super.key});

  @override
  State<EmailEntryScreen> createState() => _EmailEntryScreenState();
}
```

### State Management
```dart
class _EmailEntryScreenState extends State<EmailEntryScreen> {
  final TextEditingController emailController = TextEditingController();
  
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
```

### Layout Features
- **LayoutBuilder + ConstrainedBox** - Max width: 560px for large screens
- **IntrinsicHeight** - Ensures proper vertical spacing
- **Back Button** - IconButton with arrow_back
- **Title & Subtitle** - Clear instructions
- **Email Field** - Single input field
- **Primary Button** - Bottom-aligned with Expanded spacer

### Navigation Flow
```dart
PrimaryButton(
  onPressed: () {
    Get.to(
      () => OtpVerificationScreen(
        email: emailController.text.trim(),
      ),
    );
  },
  title: AppLabels.continueAction,
  height: 52,
  width: double.infinity,
),
```

### Field Configuration
- **Label**: AppLabels.email
- **Hint**: AppLabels.emailHint
- **Keyboard**: EmailAddress
- **Capitalization**: none
- **Action**: done
- **Required**: Yes (mandatory: true)

### Responsive Design
```dart
Center(
  child: ConstrainedBox(
    constraints: const BoxConstraints(maxWidth: 560),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.08),
      // ...
    ),
  ),
)
```

## Code Rules Applied
✅ Stateful for text controller  
✅ Dispose controller  
✅ Responsive max-width constraint  
✅ Proper input configuration  
✅ Email trimming before passing  
✅ Clear navigation with data passing  
