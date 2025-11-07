# Profile Screen

## File Path
`lib/features/profile/profile_screen.dart`

## Purpose
Display and edit user profile information with completion tracking and verification features.

## Code Structure

### Data Model
```dart
class ProfileData {
  String name;
  String email;
  String phone;
  String location;
  String address;
  String city;
  String bio;
  bool emailVerified;
  bool phoneVerified;
  bool locationVerified;
  String joinDate;
  DateTime? dateOfBirth;
  String? avatarUrl;
  String? profileImage;
  
  ProfileData copy() { /* deep copy */ }
}
```

### Main Widget
```dart
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}
```

### State Variables
```dart
class _ProfileScreenState extends State<ProfileScreen> {
  bool isEditing = false;
  late ProfileData profileData;
  late ProfileData editData;  // Temporary edit copy
  final _formKey = GlobalKey<FormState>();
}
```

### Constants
```dart
static const double _spacingSmall = 0.01;
static const double _spacingMedium = 0.015;
static const double _spacingLarge = 0.02;
static const double _spacingXLarge = 0.03;
static const double _horizontalPadding = 0.08;
static const double _maxContentWidth = 560.0;
```

### Edit/Save Flow
```dart
void _toggleEdit() {
  setState(() {
    editData = profileData.copy();
    isEditing = !isEditing;
  });
}

void _saveProfile() {
  if (_formKey.currentState?.validate() ?? false) {
    _formKey.currentState?.save();
    setState(() {
      profileData = editData.copy();
      isEditing = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile updated'))
    );
  }
}
```

### Validation Functions
```dart
String? _validateName(String? val) {
  if (val == null || val.trim().length < 2) {
    return 'Name must be at least 2 characters';
  }
  return null;
}

String? _validateBio(String? val) {
  if (val != null && val.length > 200) {
    return 'Bio must be under 200 characters';
  }
  return null;
}
```

### Profile Completion Calculation
```dart
int _calculateCompletion(ProfileData p) {
  int total = 0;
  if (p.name.isNotEmpty) total += 15;
  if (p.email.isNotEmpty && p.emailVerified) total += 15;
  if (p.phone.isNotEmpty && p.phoneVerified) total += 15;
  if (p.address.isNotEmpty) total += 15;
  if (p.location.isNotEmpty) total += 10;
  if (p.bio.isNotEmpty && p.bio.length >= 20) total += 10;
  if (p.dateOfBirth != null) total += 10;
  final hasAvatar = /* check avatar */;
  if (hasAvatar) total += 10;
  return total.clamp(0, 100);
}
```

### Key Components
1. **ProfileHeaderCard** - Name, bio, completion, avatar
2. **About Me Card** - Editable bio section
3. **ContactInfoCard** - Email, phone, address with verification
4. **PaymentMethodsCard** - Wallet and card management

### Features
- **View/Edit Modes** - Toggle between display and edit
- **Photo Upload** - Bottom sheet for camera/gallery
- **Phone Verification** - OTP-based verification flow
- **Date Picker** - Custom themed date picker for DOB
- **Saved Location** - Loads from ProfileStorage

## Code Rules Applied
✅ Data model with copy method  
✅ Temporary edit state pattern  
✅ Form validation  
✅ Profile completion logic  
✅ Widget composition (cards)  
✅ Async data loading  
✅ Verification workflows  
✅ Responsive constraints  
