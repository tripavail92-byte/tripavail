# Setup Name Screen

## File Path
`lib/features/authentication/setup_name_screen.dart`

## Purpose
Third step in authentication - capture user's full name for personalization.

## Code Structure

### Main Widget
```dart
class SetupNameScreen extends StatefulWidget {
  const SetupNameScreen({super.key});

  @override
  State<SetupNameScreen> createState() => _SetupNameScreenState();
}
```

### State Management
```dart
class _SetupNameScreenState extends State<SetupNameScreen> {
  final TextEditingController nameController = TextEditingController();
  
  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }
}
```

### Layout Structure
- **Title**: "What's your name?"
- **Subtitle**: Personalization explanation
- **Name Field**: Single text input
- **Expanded Spacer**: Pushes button to bottom
- **Primary Button**: "Next" action
- **Skip Button**: TextButton below main button

### Field Configuration
```dart
PrimaryTextField(
  controller: nameController,
  label: AppLabels.fullName,
  hintText: AppLabels.fullNameHint,
  keyboardType: TextInputType.name,
  textCapitalization: TextCapitalization.words,
  inputAction: TextInputAction.done,
),
```

### Navigation Options
1. **Next Button** - Save name, go to location setup
2. **Skip Button** - Skip name, still go to location setup

```dart
// Next button
PrimaryButton(
  onPressed: () {
    Get.offAll(() => const SetupLocationScreen());
  },
  title: AppLabels.nextAction,
  // ...
)

// Skip button
TextButton(
  onPressed: () {
    Get.offAll(() => const SetupLocationScreen());
  },
  child: Text(AppLabels.skipForNow),
)
```

### Responsive Constraints
```dart
ConstrainedBox(
  constraints: const BoxConstraints(maxWidth: 560),
  child: // ...
)
```

## Code Rules Applied
✅ Controller disposal  
✅ Proper capitalization for names  
✅ Optional field (skip allowed)  
✅ Consistent navigation (both paths lead to location)  
✅ Max-width constraint for large screens  
✅ IntrinsicHeight for proper layout  
