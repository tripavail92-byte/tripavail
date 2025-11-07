# Partner Entry Screen

## File Path
`lib/features/partner/partner_entry_screen.dart`

## Purpose
Gateway screen for partners to choose between Hotel Manager or Tour Operator workspace.

## Code Structure

### Main Widget
```dart
class PartnerEntryScreen extends StatelessWidget {
  const PartnerEntryScreen({super.key});
  
  void _openWorkspace(PartnerRole role) {
    Get.to(() => PartnerWorkspaceScreen(initialRole: role));
  }
}
```

### Partner Roles
```dart
enum PartnerRole {
  hotelManager,
  tourOperator,
}
```

### Role Cards
```dart
_PartnerRoleCard(
  title: 'Hotel Manager',
  subtitle: 'Manage rates, availability, and guest experiences...',
  gradient: AppRoleGradients.hotelManager,
  icon: Icons.apartment_rounded,
  onTap: () => _openWorkspace(PartnerRole.hotelManager),
  actionLabel: 'Enter Hotel Manager Suite',
),

_PartnerRoleCard(
  title: 'Tour Operator',
  subtitle: 'Design unforgettable journeys, automate itineraries...',
  gradient: AppRoleGradients.tourOperator,
  icon: Icons.route_outlined,
  onTap: () => _openWorkspace(PartnerRole.tourOperator),
  actionLabel: 'Enter Tour Operator Suite',
),
```

### Card Design
```dart
class _PartnerRoleCard {
  // InkWell with gradient background
  // Icon container with translucent white background
  // Title, subtitle text
  // PrimaryButton at bottom
  // Box shadow with gradient colors
  // BorderRadius: 28
}
```

### Visual Features
- **Gradient Backgrounds** - Role-specific colors
- **Icon Containers** - Rounded with opacity
- **Shadow Effects** - Colored shadows matching gradient
- **White Buttons** - Contrast against gradient
- **Responsive Padding** - 8% horizontal, vertical spacing

### Layout
```dart
SafeArea(
  child: SingleChildScrollView(
    padding: EdgeInsets.symmetric(
      horizontal: width * 0.08,
      vertical: 32
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Title & subtitle
        // Hotel Manager card
        // Tour Operator card
      ],
    ),
  ),
)
```

## Code Rules Applied
✅ Stateless widget (no state needed)  
✅ Enum for role types  
✅ Gradient theming per role  
✅ Reusable card component  
✅ Navigation with parameter passing  
✅ Responsive design  
✅ Visual consistency  
