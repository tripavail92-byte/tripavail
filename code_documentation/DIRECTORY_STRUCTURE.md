# TripAvail Directory Structure Guide

## 📁 Project Root Structure

```
tripavail92/
├── android/                 # Android platform code
├── ios/                     # iOS platform code
├── web/                     # Web platform code
├── windows/                 # Windows platform code
├── linux/                   # Linux platform code
├── macos/                   # macOS platform code
├── assets/                  # Static assets (images, fonts, etc.)
├── lib/                     # Main Flutter application code ⭐
├── test/                    # Test files
├── build/                   # Build output (auto-generated)
├── code_documentation/      # Code documentation and standards
├── pubspec.yaml            # Dependencies and project metadata
├── analysis_options.yaml   # Linting rules
└── README.md              # Project documentation
```

---

## 📱 lib/ - Main Application Code

### Overview
The `lib/` directory contains all Dart code for the Flutter application, organized using a **feature-first architecture**.

```
lib/
├── main.dart              # App entry point
├── app_bindings.dart      # GetX bindings setup
├── common/                # Shared across features
├── features/              # Feature modules ⭐
├── utils/                 # Utilities and helpers
└── widgets/               # Reusable UI components
```

---

## 🎯 features/ - Feature Modules

### Architecture Pattern
**Feature-First Organization**: Each feature is self-contained with its own screens, widgets, controllers, and models.

```
features/
├── authentication/        # Login, signup, OTP flows
├── onboarding/           # First-time user experience
├── splash_screen/        # App launch screen
├── home/                 # Main navigation and home screen
├── profile/              # User profile management
├── partner/              # Partner workspace (Hotel/Tour)
├── hotel_manager/        # Hotel management features
├── tour_operator/        # Tour operator features
└── drawer/               # Navigation drawer
```

### Feature Structure Pattern
Each feature typically follows this structure:

```
feature_name/
├── feature_screen.dart           # Main screen file
├── widgets/                      # Feature-specific widgets
├── models/                       # Data models
├── controllers/                  # State management (GetX)
├── presentation/                 # Presentation layer (clean arch)
│   ├── screens/
│   ├── widgets/
│   └── controllers/
└── utils/                        # Feature-specific utilities
```

---

## 🔐 features/authentication/

**Purpose**: Complete authentication flow including login, signup, email verification, and user setup.

```
authentication/
├── login_screen.dart             # Email/password login
├── signup_screen.dart            # User registration
├── email_entry_screen.dart       # Email capture for OTP
├── otp_screen.dart              # OTP verification (6-digit)
├── setup_name_screen.dart        # Name capture
├── setup_location_screen.dart    # Location permission
└── widgets/
    ├── auth_header.dart         # Shared header with logo
    └── social_buttons.dart      # Google/Apple sign-in buttons
```

**Flow**: EmailEntry → OTP → SetupName → SetupLocation → Home

**Key Files**:
- `login_screen.dart` - Main login entry point
- `signup_screen.dart` - New user registration
- `otp_screen.dart` - Validates email with 6-digit code

---

## 🎨 features/splash_screen/

**Purpose**: Animated splash screen with premium travel aesthetics.

```
splash_screen/
└── splash_screen.dart           # Animated splash with travel elements
```

**Features**:
- Custom animations (globe, plane, hotel icons)
- 4-second duration
- Auto-navigation to onboarding

---

## 👋 features/onboarding/

**Purpose**: First-time user introduction to the app.

```
onboarding/
├── onboarding_screen.dart       # Main onboarding screen
└── widgets/
    └── animated_suitcases.dart  # Custom illustration
```

**Features**:
- PageView with smooth indicators
- Skip button
- Preference storage for completion tracking

---

## 🏠 features/home/

**Purpose**: Main navigation hub after authentication.

```
home/
└── bottom_nav_bar.dart          # Bottom navigation with tabs
```

**Tabs**: Typically includes Home, Explore, Bookings, Profile

---

## 👤 features/profile/

**Purpose**: User profile viewing and editing.

```
profile/
├── profile_screen.dart          # Main profile screen
└── widgets/
    ├── profile_header_card.dart  # Avatar, name, completion
    ├── contact_info_card.dart    # Email, phone, address
    └── payment_methods_card.dart # Payment options
```

**Features**:
- Edit/View modes
- Profile completion tracking
- Phone verification
- Photo upload
- Date of birth picker

---

## 🤝 features/partner/

**Purpose**: Partner workspace for Hotel Managers and Tour Operators.

```
partner/
├── partner_entry_screen.dart     # Role selection screen
├── partner_workspace_screen.dart # Dashboard for partners
├── models/
│   ├── partner_role.dart        # Enum: hotelManager, tourOperator
│   ├── partner_dashboard_data.dart
│   └── partner_action.dart
├── presentation/
│   └── controllers/
│       └── partner_dashboard_controller.dart
├── utils/
│   └── partner_branding.dart    # Gradients, colors per role
└── widgets/
    └── (partner-specific widgets)
```

**Roles**:
- **Hotel Manager**: Manage properties, rates, availability
- **Tour Operator**: Create tours, manage bookings

---

## 🏨 features/hotel_manager/

**Purpose**: Hotel property management features.

```
hotel_manager/
└── presentation/
    ├── screens/
    │   ├── hotel_list_screen.dart         # List all properties
    │   ├── hotel_packages_screen.dart     # Package deals
    │   ├── hotel_verification_screen.dart # Property verification
    │   └── hotel_listing_flow/
    │       └── step1_property_type_screen.dart
    ├── widgets/
    │   └── (hotel-specific widgets)
    ├── theme/
    │   └── hotel_manager_theme.dart
    └── constants/
```

**Features**:
- Property listing
- Package management
- Verification process
- Multi-step listing flow

---

## 🚌 features/tour_operator/

**Purpose**: Tour operator package and booking management.

```
tour_operator/
├── tour_create_screen.dart       # Create new tour packages
├── tour_packages_screen.dart     # View/manage packages
├── tour_calendar_screen.dart     # Tour scheduling
├── tour_bookings_screen.dart     # Booking management
└── tour_verification_screen.dart # Operator verification
```

**Features**:
- Tour package creation
- Calendar management
- Booking tracking
- Operator verification

---

## 🎨 features/drawer/

**Purpose**: Navigation drawer for app sections.

```
drawer/
└── app_drawer.dart              # Main navigation drawer
```

**Features**:
- Role-based menu items
- Partner/Traveler switching
- Dynamic branding

---

## 🛠️ utils/ - Utilities & Helpers

**Purpose**: Shared utilities, services, and helper functions.

```
utils/
├── app_assets.dart              # Asset path constants
├── app_labels.dart              # Text constants/labels
├── app_text_styles.dart         # Typography definitions
├── date_formatter.dart          # Date formatting utilities
├── location_service.dart        # GPS/location helpers
├── profile_storage.dart         # User data persistence
├── preference_labels.dart       # SharedPreferences keys
├── show_snackbar.dart          # Snackbar helper
├── performance_optimizations.dart
├── choose_photo_bottom_sheet.dart
└── theme/
    ├── app_light_theme.dart    # Light theme config
    ├── app_dark_theme.dart     # Dark theme config
    ├── theme_controller.dart   # Theme state management
    ├── theme_selection_screen.dart
    ├── constants/
    │   └── app_constants.dart  # Colors, gradients, sizes
    └── extension/
        └── role_theme_extension.dart
```

### Key Utilities

#### app_labels.dart
```dart
// Centralized text constants
class AppLabels {
  static const String appName = 'TripAvail';
  static const String login = 'Login';
  // ... all text constants
}
```

#### app_text_styles.dart
```dart
// Typography system
class AppTextStyle {
  static TextStyle headlineMedium = ...;
  static TextStyle bodyMedium = ...;
  // ... all text styles
}
```

#### location_service.dart
```dart
// GPS and location utilities
class LocationService {
  static Future<LocationResult?> getCurrentLocation();
}
```

---

## 🧩 widgets/ - Reusable Components

**Purpose**: App-wide reusable UI components.

```
widgets/
├── primary_button.dart          # Main CTA button
├── primary_text_field.dart      # Standard input field
├── primary_appbar.dart          # Consistent app bar
├── otp_input.dart              # 6-digit OTP input
├── app_logo.dart               # App branding
├── arrow_back_button.dart      # Back navigation
├── info_items.dart             # Info display widgets
├── loading_indicator.dart      # Loading spinners
├── loading_image.dart          # Image loading with placeholder
├── internet_check_connectivity.dart
├── not_found_wifi.dart
└── animations/
    └── (animation widgets)
```

### Widget Guidelines

**When to create a widget here**:
- ✅ Used in 3+ different features
- ✅ Follows consistent design system
- ✅ Has clear, focused purpose
- ✅ Minimal external dependencies

**When to keep in feature folder**:
- ❌ Feature-specific functionality
- ❌ Uses feature-specific data models
- ❌ Only used in one feature

---

## 🎛️ common/ - Shared Code

**Purpose**: Code shared across multiple features but not general utilities.

```
common/
└── controllers/
    └── preference_controller.dart  # App preferences (GetX)
```

**Use Cases**:
- Cross-feature controllers
- Shared business logic
- Multi-feature data models

---

## 📦 assets/ - Static Assets

```
assets/
├── images/              # PNG, JPG images
├── icons/               # SVG, PNG icons
├── fonts/               # Custom fonts
├── lottie/              # Lottie animation files
│   ├── onboarding_ai.json
│   ├── onboarding_discover.json
│   └── onboarding_plan.json
└── data/                # JSON data files
```

---

## 🧪 test/ - Test Files

```
test/
├── widget_test.dart     # Widget tests
├── unit/                # Unit tests
└── integration/         # Integration tests
```

**Naming Convention**: `feature_name_test.dart` mirrors `feature_name.dart`

---

## 📋 Naming Conventions

### Files
- **Screens**: `feature_name_screen.dart`
- **Widgets**: `widget_name.dart` (no suffix)
- **Controllers**: `feature_name_controller.dart`
- **Models**: `model_name.dart`
- **Utils**: `purpose_name.dart`

### Folders
- **lowercase_with_underscores**
- **Plural for collections**: `widgets/`, `models/`, `screens/`
- **Singular for single purpose**: `authentication/`, `profile/`

### Classes
- **PascalCase**: `LoginScreen`, `PrimaryButton`
- **Private classes**: `_PrivateWidget` (underscore prefix)

---

## 🗂️ Architecture Patterns

### Feature Organization
```
✅ GOOD - Feature-first
features/
  authentication/
    login_screen.dart
    widgets/
    controllers/

❌ BAD - Type-first
screens/
  login_screen.dart
  profile_screen.dart
widgets/
  login_form.dart
  profile_card.dart
```

### File Size Guidelines
- **Screens**: 200-500 lines (extract widgets if larger)
- **Widgets**: < 200 lines
- **Controllers**: < 300 lines
- **Utils**: < 200 lines per file

### When to Split
- **Extract Widget**: > 50 lines AND reused OR improves readability
- **New File**: > 500 lines OR handles multiple concerns
- **New Feature**: 3+ related screens

---

## 🔍 Finding Code

### "Where should this go?"

| Code Type | Location | Example |
|-----------|----------|---------|
| Screen for login | `features/authentication/` | `login_screen.dart` |
| Reusable button | `widgets/` | `primary_button.dart` |
| Text constants | `utils/` | `app_labels.dart` |
| Feature widget | `features/X/widgets/` | `auth_header.dart` |
| Theme colors | `utils/theme/constants/` | `app_constants.dart` |
| GetX controller | `features/X/controllers/` | `login_controller.dart` |
| Data model | `features/X/models/` | `user_model.dart` |
| Helper function | `utils/` | `date_formatter.dart` |

---

## 🚀 Developer Workflow

### Adding a New Feature
1. Create folder in `features/`: `features/new_feature/`
2. Add main screen: `new_feature_screen.dart`
3. Create subfolders as needed: `widgets/`, `models/`, `controllers/`
4. Update documentation: Add to this guide

### Adding a Reusable Widget
1. Check if truly reusable (3+ features)
2. Add to `widgets/`: `my_widget.dart`
3. Document in widget file
4. Use across features

### Adding Utility
1. Determine scope (app-wide vs feature)
2. App-wide → `utils/`
3. Feature-specific → `features/X/utils/`
4. Follow naming convention

---

## 📚 Related Documentation

- **[README.md](./README.md)** - Overview of all screen documentation
- **[CODING_STANDARDS.md](./CODING_STANDARDS.md)** - Coding rules and patterns
- **Screen docs** - `01_splash_screen.md` through `11_partner_workspace_screen.md`

---

## 🎯 Quick Reference

### Common Paths
```dart
// Screens
'lib/features/authentication/login_screen.dart'
'lib/features/profile/profile_screen.dart'

// Widgets
'lib/widgets/primary_button.dart'
'lib/features/authentication/widgets/auth_header.dart'

// Utils
'lib/utils/app_labels.dart'
'lib/utils/theme/constants/app_constants.dart'

// Controllers
'lib/common/controllers/preference_controller.dart'
'lib/features/partner/presentation/controllers/partner_dashboard_controller.dart'
```

### Import Examples
```dart
// Features
import 'package:tripavail/features/authentication/login_screen.dart';

// Widgets
import 'package:tripavail/widgets/primary_button.dart';

// Utils
import 'package:tripavail/utils/app_labels.dart';
import 'package:tripavail/utils/show_snackbar.dart';

// Theme
import 'package:tripavail/utils/theme/constants/app_constants.dart';
```

---

**Last Updated**: November 6, 2025  
**Maintainer**: Development Team  
**Version**: 1.0
