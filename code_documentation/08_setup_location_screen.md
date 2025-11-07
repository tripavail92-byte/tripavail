# Setup Location Screen

## File Path
`lib/features/authentication/setup_location_screen.dart`

## Purpose
Final authentication step - request and capture user's location for personalization.

## Code Structure

### Main Widget
```dart
class SetupLocationScreen extends StatefulWidget {
  const SetupLocationScreen({super.key});

  @override
  State<SetupLocationScreen> createState() => _SetupLocationScreenState();
}
```

### State Management
```dart
class _SetupLocationScreenState extends State<SetupLocationScreen> {
  bool loading = false;
  String? error;
}
```

### Location Capture Flow
```dart
Future<void> _capture() async {
  setState(() {
    loading = true;
    error = null;
  });
  
  final result = await LocationService.getCurrentLocation();
  
  if (result == null) {
    setState(() {
      loading = false;
      error = 'Location permission is required...';
    });
    return;
  }
  
  await ProfileStorage.saveLocation(
    latitude: result.latitude,
    longitude: result.longitude,
    city: result.city,
    label: result.formatted,
  );
  
  if (!mounted) return;
  Get.offAll(() => const BottomNavBar());
}
```

### Features
1. **Loading State** - Shows while fetching location
2. **Error Handling** - Displays permission errors
3. **Location Service** - Uses LocationService utility
4. **Profile Storage** - Saves to persistent storage
5. **Skip Option** - Allows bypassing location

### UI States
```dart
// Button state
PrimaryButton(
  onPressed: () { _capture(); },
  enabled: !loading,
  title: loading ? 'Getting location...' : AppLabels.getStarted,
  // ...
)

// Error display
if (error != null) ...[
  Text(
    error!,
    style: AppTextStyle.bodySmall.copyWith(color: Colors.red),
  ),
  SizedBox(height: height * 0.015),
],
```

### Navigation
- **Success**: `BottomNavBar` (main app)
- **Skip**: `BottomNavBar` (same destination)

### Mounted Check
```dart
if (!mounted) return;  // Before navigation
```

## Code Rules Applied
✅ Async/await for location fetching  
✅ Loading state management  
✅ Error state with user feedback  
✅ Mounted check before setState  
✅ Permission handling  
✅ Data persistence  
✅ Optional feature (skip allowed)  
