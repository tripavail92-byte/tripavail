# Partner Workspace Screen

## File Path
`lib/features/partner/partner_workspace_screen.dart`

## Purpose
Main dashboard for Hotel Managers and Tour Operators with metrics, quick actions, and navigation.

## Code Structure

### Main Widget
```dart
class PartnerWorkspaceScreen extends StatefulWidget {
  final PartnerRole initialRole;
  
  const PartnerWorkspaceScreen({super.key, required this.initialRole});
  
  @override
  State<PartnerWorkspaceScreen> createState() => 
      _PartnerWorkspaceScreenState();
}
```

### State Variables
```dart
class _PartnerWorkspaceScreenState extends State<PartnerWorkspaceScreen> {
  late PartnerRole _activeRole;
  bool _drawerOpen = false;
}
```

### Constants Class
```dart
class _PartnerWorkspaceConstants {
  static const double horizontalPadding = 20.0;
  static const double heroCardPadding = 28.0;
  static const double metricCardWidth = 180.0;
  static const int gridCrossAxisCount = 2;
  static const double gridChildAspectRatio = 1.1;
  // ... many more layout constants
}
```

### Controller Initialization
```dart
@override
void initState() {
  super.initState();
  _activeRole = widget.initialRole;
  
  if (!Get.isRegistered<PartnerDashboardController>(tag: _activeRole.name)) {
    Get.put(PartnerDashboardController(_activeRole), tag: _activeRole.name);
  }
  
  WidgetsBinding.instance.addPostFrameCallback((_) {
    setState(() => _drawerOpen = true);
  });
}
```

### Navigation Handlers
```dart
void _handleHotelManagerNavigation(String id) {
  switch (id) {
    case 'list_hotel': Get.to(() => const HotelListScreen()); break;
    case 'packages': Get.to(() => const HotelPackagesScreen()); break;
    case 'verification': Get.to(() => const HotelVerificationScreen()); break;
    // ... more cases
  }
}

void _handleTourOperatorNavigation(String id) {
  switch (id) {
    case 'create_tour': Get.to(() => const TourCreateScreen()); break;
    case 'post_packages': Get.to(() => const TourPackagesScreen()); break;
    // ... more cases
  }
}
```

### Dashboard Components

#### 1. Hero Card
```dart
_HeroCard(
  role: _activeRole,
  data: data,
)
// Shows: Title, subtitle, highlight badges
// Uses: Role-specific gradient
```

#### 2. Metrics Row
```dart
_MetricsRow(
  metrics: data.metrics,
  accent: accent,
)
// Shows: Key performance indicators
// Features: Colored borders, shadows, trend labels
```

#### 3. Quick Actions Grid
```dart
_QuickActionsGrid(
  actions: data.quickActions,
)
// Grid: 2 columns
// Cards: Icon, title, subtitle
// Tappable: Navigation to specific screens
```

### Drawer Integration
```dart
AppDrawer(
  isOpen: _drawerOpen,
  onClose: () => _toggleDrawer(false),
  meta: _currentMeta,
  items: _currentDrawerItems,
  onItemTap: _handleDrawerItem,
  onSwitchToTraveler: _switchToTraveler,
  showPartnerButton: false,
)
```

### Data Flow
```dart
GetX<PartnerDashboardController>(
  tag: _activeRole.name,
  builder: (controller) {
    if (controller.isLoading.value) {
      return const Center(child: CircularProgressIndicator());
    }
    
    final data = controller.data.value;
    // ... render dashboard
  },
)
```

### Role-Specific Features
- **Hotel Manager**: List hotels, packages, verification
- **Tour Operator**: Create tours, packages, calendar, bookings

## Code Rules Applied
✅ Tagged GetX controllers for multi-role support  
✅ Constants class for maintainability  
✅ Switch/case navigation patterns  
✅ Component composition (cards, metrics, grid)  
✅ Drawer integration  
✅ Loading states  
✅ Error handling  
✅ Responsive layout with constraints  
