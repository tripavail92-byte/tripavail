# TripAvail - Complete Screen Flow Documentation

## 📱 Application Entry Flow

```
App Launch
    │
    ▼
┌─────────────────────────────────────────────────────────────┐
│ 1. SPLASH SCREEN                                            │
│    Route: /splash                                            │
│    File: lib/features/splash_screen/splash_screen.dart       │
│    Duration: ~4 seconds                                      │
│                                                              │
│    Features:                                                 │
│    • Animated logo with elastic bounce                       │
│    • Floating travel elements (hotel, plane, car, tour bus) │
│    • Particle effects and glow animations                    │
│    • Brand name "TripAvail"                                  │
│                                                              │
│    Navigation: → /onboarding                                 │
└─────────────────────────────────────────────────────────────┘
    │
    ▼
┌─────────────────────────────────────────────────────────────┐
│ 2. ONBOARDING SCREEN                                        │
│    Route: /onboarding                                        │
│    File: lib/features/onboarding/onboarding_screen.dart      │
│                                                              │
│    Features:                                                 │
│    • Animated suitcase illustration                          │
│    • Single page with "Skip" button                          │
│    • "Get Started" / "Next" button                          │
│                                                              │
│    Actions:                                                  │
│    • Skip → Saves `hasOnboarded: true` → /auth/welcome      │
│    • Next → Saves `hasOnboarded: true` → /auth/welcome      │
└─────────────────────────────────────────────────────────────┘
    │
    ▼
┌─────────────────────────────────────────────────────────────┐
│ 3. AUTH WELCOME SCREEN                                      │
│    Route: /auth/welcome                                      │
│    File: lib/features/authentication/auth_welcome_screen.dart│
│                                                              │
│    Features:                                                 │
│    • Welcome message                                         │
│    • "Sign In" button → /auth/email                          │
│    • "Create Account" button → /auth/email                   │
│                                                              │
│    Navigation: → /auth/email                                 │
└─────────────────────────────────────────────────────────────┘
    │
    ▼
┌─────────────────────────────────────────────────────────────┐
│ 4. EMAIL ENTRY SCREEN                                       │
│    Route: /auth/email                                        │
│    File: lib/features/authentication/email_entry_screen.dart │
│                                                              │
│    Features:                                                 │
│    • Email input field                                       │
│    • Continue button                                         │
│                                                              │
│    Navigation: → /auth/otp (with email argument)            │
└─────────────────────────────────────────────────────────────┘
    │
    ▼
┌─────────────────────────────────────────────────────────────┐
│ 5. OTP VERIFICATION SCREEN                                  │
│    Route: /auth/otp                                          │
│    File: lib/features/authentication/otp_screen.dart         │
│                                                              │
│    Features:                                                 │
│    • 6-digit OTP input                                       │
│    • Resend code button                                      │
│    • Verify button                                           │
│                                                              │
│    Navigation: → /auth/setup/name                           │
└─────────────────────────────────────────────────────────────┘
    │
    ▼
┌─────────────────────────────────────────────────────────────┐
│ 6. SETUP NAME SCREEN                                        │
│    Route: /auth/setup/name                                   │
│    File: lib/features/authentication/setup_name_screen.dart  │
│                                                              │
│    Features:                                                 │
│    • Full name input                                         │
│    • Continue button                                         │
│                                                              │
│    Navigation: → /auth/setup/location                       │
└─────────────────────────────────────────────────────────────┘
    │
    ▼
┌─────────────────────────────────────────────────────────────┐
│ 7. SETUP LOCATION SCREEN                                    │
│    Route: /auth/setup/location                               │
│    File: lib/features/authentication/setup_location_screen   │
│                                                              │
│    Features:                                                 │
│    • Location picker (Geolocator + Geocoding)                │
│    • Current location button                                 │
│    • Continue button                                         │
│                                                              │
│    Navigation: → /main (Traveler Dashboard)                 │
└─────────────────────────────────────────────────────────────┘
```

---

## 🏠 Traveler Dashboard (Main Navigation)

```
┌─────────────────────────────────────────────────────────────┐
│ MAIN NAVIGATION                                             │
│ Route: /main                                                │
│ File: lib/features/home/main_navigation.dart                │
│                                                             │
│ Features:                                                   │
│ • Bottom navigation bar (Home, Hotels, Tours, Messages)    │
│ • Hamburger menu → Drawer                                   │
│ • Role: Traveler                                            │
└─────────────────────────────────────────────────────────────┘
    │
    ├─→ HOME TAB
    │   └─> File: lib/features/home/screens/home_tab.dart
    │       • Welcome banner with gradient
    │       • Quick action cards (Explore, Flights, Car Rental, Restaurants)
    │       • Popular destinations horizontal scroll
    │
    ├─→ HOTELS TAB
    │   └─> File: lib/features/home/screens/hotels_tab.dart
    │       • Hotel listings grid
    │
    ├─→ TOURS TAB
    │   └─> File: lib/features/home/screens/tours_tab.dart
    │       • Tour packages grid
    │
    └─→ MESSAGES TAB
        └─> File: lib/features/home/screens/messages_tab.dart
            • Conversations list
```

### Traveler Drawer Menu (from Main Navigation)

```
┌─────────────────────────────────────────────────────────────┐
│ TRAVELER DRAWER                                             │
│ Items from DrawerDefinitions.travelerItems:                 │
│                                                             │
│ 📱 Profile        → ProfileScreen                           │
│ 📅 My Bookings    → (Coming soon)                           │
│ ⭐ Favorites      → (Coming soon)                           │
│ 💳 Wallet         → (Coming soon)                           │
│ ⚙️  Settings      → (Coming soon)                           │
│ ❓ Support        → (Coming soon)                           │
│ ℹ️  About         → (Coming soon)                           │
│                                                             │
│ ────────────────────────────────────────────────────────   │
│                                                             │
│ 🏢 BECOME A PARTNER → Partner Entry Screen                  │
└─────────────────────────────────────────────────────────────┘
```

---

## 🏢 Partner Conversion Flow

```
TRAVELER DASHBOARD
    │
    │ (Click "Become a Partner" in Drawer)
    │
    ▼
┌─────────────────────────────────────────────────────────────┐
│ PARTNER ENTRY SCREEN                                        │
│ Route: /partner/entry                                       │
│ File: lib/features/partner/partner_entry_screen.dart        │
│                                                             │
│ Features:                                                   │
│ • Two role cards with gradients:                            │
│   1. Hotel Manager (purple→cyan gradient)                   │
│   2. Tour Operator (coral gradient)                         │
│                                                             │
│ Navigation:                                                 │
│ • Hotel Manager → /partner/hotel                            │
│ • Tour Operator → /partner/tour                             │
└─────────────────────────────────────────────────────────────┘
    │
    ├─→ HOTEL MANAGER WORKSPACE
    │   │
    │   ▼
    │   ┌───────────────────────────────────────────────────┐
    │   │ HOTEL MANAGER WORKSPACE                           │
    │   │ Route: /partner/hotel                             │
    │   │ File: lib/features/partner/partner_workspace_scr..│
    │   │                                                    │
    │   │ Features:                                          │
    │   │ • Hero card with metrics (gradient)                │
    │   │ • Quick action grid                                │
    │   │ • Hamburger menu → Hotel Manager Drawer            │
    │   │ • Switch to Traveler button                        │
    │   └───────────────────────────────────────────────────┘
    │               │
    │               ├─→ LIST YOUR HOTEL (Overview)
    │               │   Route: /partner/hotel/list
    │               │   File: lib/features/hotel_manager/...
    │               │         .../hotel_list_screen.dart
    │               │   
    │               │   Features:
    │               │   • Animated hotel hero icon (colorful)
    │               │   • 5 step cards:
    │               │     1. Property Type (morphing icons)
    │               │     2. Location (pin→compass→map)
    │               │     3. Amenities (orbiting icons)
    │               │     4. Photos (camera→frame→gallery)
    │               │     5. Pricing ($→€→coupon)
    │               │   • "List Your Hotel" CTA button
    │               │
    │               │   Navigation: → /partner/hotel/listing/step1
    │               │
    │               ├─→ STEP 1: PROPERTY TYPE
    │               │   Route: /partner/hotel/listing/step1
    │               │   File: lib/features/hotel_manager/...
    │               │         .../step1_property_type_screen.dart
    │               │   
    │               │   Features:
    │               │   • Animated property type icon
    │               │   • Grid of property type cards
    │               │   • Continue button (placeholder)
    │               │
    │               ├─→ HOTEL PACKAGES
    │               │   Route: /partner/hotel/packages
    │               │   File: lib/features/hotel_manager/...
    │               │         .../hotel_packages_screen.dart
    │               │   Status: Placeholder
    │               │
    │               └─→ HOTEL VERIFICATION
    │                   Route: /partner/hotel/verification
    │                   File: lib/features/hotel_manager/...
    │                         .../hotel_verification_screen.dart
    │                   Status: Placeholder
    │
    │   Hotel Manager Drawer Menu:
    │   ┌───────────────────────────────────────────────────┐
    │   │ 🏠 Dashboard      → /partner/hotel                │
    │   │ 📝 List Your Hotel → /partner/hotel/list          │
    │   │ 📦 Packages        → /partner/hotel/packages      │
    │   │ ✅ Verification    → /partner/hotel/verification  │
    │   │                                                    │
    │   │ ────────────────────────────────────────────────   │
    │   │                                                    │
    │   │ 🧳 SWITCH TO TRAVELER → /main                     │
    │   └───────────────────────────────────────────────────┘
    │
    │
    └─→ TOUR OPERATOR WORKSPACE
        │
        ▼
        ┌───────────────────────────────────────────────────┐
        │ TOUR OPERATOR WORKSPACE                           │
        │ Route: /partner/tour                              │
        │ File: lib/features/partner/partner_workspace_scr..│
        │                                                    │
        │ Features:                                          │
        │ • Hero card with metrics (coral gradient)          │
        │ • Quick action grid                                │
        │ • Hamburger menu → Tour Operator Drawer            │
        │ • Switch to Traveler button                        │
        └───────────────────────────────────────────────────┘
                    │
                    ├─→ CREATE TOUR
                    │   Route: /partner/tour/create
                    │   File: lib/features/tour_operator/...
                    │         .../tour_create_screen.dart
                    │   Status: Placeholder
                    │
                    ├─→ TOUR PACKAGES
                    │   Route: /partner/tour/packages
                    │   File: lib/features/tour_operator/...
                    │         .../tour_packages_screen.dart
                    │   Status: Placeholder
                    │
                    ├─→ TOUR CALENDAR
                    │   Route: /partner/tour/calendar
                    │   File: lib/features/tour_operator/...
                    │         .../tour_calendar_screen.dart
                    │   Status: Placeholder
                    │
                    ├─→ TOUR BOOKINGS
                    │   Route: /partner/tour/bookings
                    │   File: lib/features/tour_operator/...
                    │         .../tour_bookings_screen.dart
                    │   Status: Placeholder
                    │
                    └─→ TOUR VERIFICATION
                        Route: /partner/tour/verification
                        File: lib/features/tour_operator/...
                              .../tour_verification_screen.dart
                        Status: Placeholder
        
        Tour Operator Drawer Menu:
        ┌───────────────────────────────────────────────────┐
        │ 🏠 Dashboard       → /partner/tour                │
        │ ➕ Create Tour      → /partner/tour/create         │
        │ 📦 Packages         → /partner/tour/packages       │
        │ 📅 Calendar         → /partner/tour/calendar       │
        │ 📋 Bookings         → /partner/tour/bookings       │
        │ ✅ Verification     → /partner/tour/verification   │
        │                                                    │
        │ ────────────────────────────────────────────────   │
        │                                                    │
        │ 🧳 SWITCH TO TRAVELER → /main                     │
        │ └───────────────────────────────────────────────────┘
```

---

## 🔐 Profile Screen (Shared)

```
┌─────────────────────────────────────────────────────────────┐
│ PROFILE SCREEN                                              │
│ Route: (via drawer navigation)                              │
│ File: lib/features/profile/profile_screen.dart              │
│                                                             │
│ Features:                                                   │
│ • Profile header with avatar and name                       │
│ • Contact info card (email, phone, location)               │
│ • Payment methods card                                      │
│ • Theme toggle                                              │
│                                                             │
│ Accessible from:                                            │
│ • Traveler drawer → Profile                                 │
│ • (Future: Partner drawers)                                 │
└─────────────────────────────────────────────────────────────┘
```

---

## 🎨 Navigation Patterns

### Route Constants

**Traveler Routes** (`lib/modules/traveler/traveler_routes.dart`):
- `/splash` - Splash screen
- `/onboarding` - Onboarding
- `/main` - Main navigation (traveler dashboard)
- `/partner/entry` - Partner entry selection

**Auth Routes** (`lib/modules/auth/auth_routes.dart`):
- `/auth/welcome` - Welcome screen
- `/auth/email` - Email entry
- `/auth/otp` - OTP verification
- `/auth/setup/name` - Name setup
- `/auth/setup/location` - Location setup

**Partner Routes** (`lib/modules/partner/partner_routes.dart`):
- `/partner/hotel` - Hotel manager workspace
- `/partner/tour` - Tour operator workspace

**Hotel Manager Routes** (`lib/modules/hotel_manager/hotel_manager_routes.dart`):
- `/partner/hotel/list` - List overview
- `/partner/hotel/packages` - Packages
- `/partner/hotel/verification` - Verification
- `/partner/hotel/listing/step1` - Property type
- `/partner/hotel/listing/step2` - Location (coming)
- `/partner/hotel/listing/step3` - Amenities (coming)
- `/partner/hotel/listing/step4` - Photos (coming)
- `/partner/hotel/listing/step5` - Pricing (coming)

**Tour Operator Routes** (`lib/modules/tour_operator/tour_operator_routes.dart`):
- `/partner/tour/create` - Create tour
- `/partner/tour/packages` - Packages
- `/partner/tour/calendar` - Calendar
- `/partner/tour/bookings` - Bookings
- `/partner/tour/verification` - Verification

---

## 🔄 State Management & Navigation

### GetX Navigation
- All navigation via `Get.toNamed()` or `Get.offAllNamed()`
- Named routes registered through `ModuleRegistry`
- Controllers registered via `Get.lazyPut()` with tags per role

### Module System
```
main.dart → ModuleRegistry.registerDefaults([
  CoreModule(),      // Network, storage, logger
  AuthModule(),      // Authentication routes
  TravelerModule(),  // Traveler routes & main dashboard
  HotelManagerModule(), // Hotel manager routes & DI
  TourOperatorModule(), // Tour operator routes & DI
])
```

### Drawer System
- `DrawerManager` widget handles all drawer rendering
- Dynamic content based on role
- Three drawer types:
  1. Traveler drawer (from main navigation)
  2. Hotel Manager drawer (from hotel workspace)
  3. Tour Operator drawer (from tour workspace)

---

## 🎯 User Roles

### 1. **Traveler**
- Default role when user first launches app
- Access: Home, Hotels, Tours, Messages tabs
- Can convert to partner via "Become a Partner" drawer action
- Main hub for browsing and booking travel experiences

### 2. **Hotel Manager**
- Partner role for hotel/accommodation owners
- Dedicated workspace with gradient theme (purple→cyan)
- Features: List properties, manage packages, verification
- Can switch back to traveler role anytime

### 3. **Tour Operator**
- Partner role for tour/travel organizers
- Dedicated workspace with gradient theme (coral)
- Features: Create tours, manage calendar, bookings
- Can switch back to traveler role anytime

---

## 📂 File Structure by Module

```
lib/
├── modules/
│   ├── core/              # Core dependencies
│   │   ├── network/       # API client, Dio setup
│   │   ├── storage/       # SharedPreferences wrapper
│   │   └── logger/        # App logger
│   ├── auth/              # Authentication module
│   │   ├── auth_module.dart
│   │   └── auth_routes.dart
│   ├── traveler/          # Traveler module
│   │   ├── traveler_module.dart
│   │   └── traveler_routes.dart
│   ├── partner/           # Partner routes
│   │   └── partner_routes.dart
│   ├── hotel_manager/     # Hotel manager module
│   │   ├── hotel_manager_module.dart
│   │   └── hotel_manager_routes.dart
│   └── tour_operator/     # Tour operator module
│       ├── tour_operator_module.dart
│       └── tour_operator_routes.dart
│
├── features/
│   ├── splash_screen/     # Splash + animations
│   ├── onboarding/        # Onboarding + animated suitcases
│   ├── authentication/    # Auth flow screens
│   ├── home/              # Main navigation + 4 tabs
│   ├── profile/           # Profile screen + cards
│   ├── partner/           # Partner entry + workspace
│   ├── hotel_manager/     # Hotel listing flow
│   ├── tour_operator/     # Tour management screens
│   └── drawer/            # Drawer system components
│
└── widgets/
    ├── animations/        # LoopingIcon base
    └── [shared widgets]   # Buttons, text fields, etc.
```

---

## 🚀 Quick Reference

### Navigation Commands
- `Get.toNamed(route)` - Push new route
- `Get.offAllNamed(route)` - Replace all routes
- `Get.back()` - Pop current route
- `Get.find<T>(tag: name)` - Find controller by tag

### Key Screen Features

**Splash Screen:**
- 4-second animation
- Animated logo, particles, travel elements

**Onboarding:**
- 1 page with animated suitcases
- Skip or Next → Auth welcome

**Auth Flow:**
- Welcome → Email → OTP → Name → Location

**Main Dashboard:**
- 4 tabs (Home, Hotels, Tours, Messages)
- Hamburger → Drawer with profile + partner conversion

**Partner Entry:**
- Choose Hotel Manager or Tour Operator

**Hotel Manager Workspace:**
- Hero metrics
- List Your Hotel with 5 animated step icons
- Drawer navigation

**Tour Operator Workspace:**
- Hero metrics
- Create/manage tours
- Drawer navigation

---

## 📊 Visual Flow Diagram

```
[App Start]
     │
     ▼
[Splash] ──4s──> [Onboarding] ──Skip/Next──> [Auth Welcome]
                                                      │
                                                      ▼
                                              [Email Entry]
                                                      │
                                                      ▼
                                              [OTP Verification]
                                                      │
                                                      ▼
                                              [Name Setup]
                                                      │
                                                      ▼
                                              [Location Setup]
                                                      │
                                                      ▼
                                    ┌─────────────────┴─────────────────┐
                                    │                                   │
                                    ▼                                   ▼
                            [Traveler Dashboard]              [Partner Entry]
                                    │                                   │
                   ┌────────────────┼────────────────┐                 │
                   ▼                ▼                ▼                 │
                [Home]          [Hotels]         [Tours]               │
                   │                                                    │
                   │                                                   │
        Drawer → [Profile]                             ┌───────────────┴───────────────┐
                   │                                   │                                │
                   │                                   ▼                                ▼
                   │                          [Hotel Manager Workspace]      [Tour Operator Workspace]
                   │                                   │                                │
                   │                    ┌──────────────┼──────────────┐    ┌──────────┴──────────┐
                   │                    ▼              ▼              ▼    ▼                     ▼
                   │              [List Hotel]   [Packages]   [Verify] [Create]          [Packages]
                   │                    │                                                  │
                   │                    ▼                                                  │
                   │              [Step 1: Property]                                  [Calendar]
                   │                                                                      │
                   │                                                                 [Bookings]
                   │                                                                      │
                   │                                                                 [Verify]
                   │
                   └─── Drawer → [Become Partner] ──(cycle)──────────────────────────────┘
```

---

## 🔑 Key Design Decisions

1. **Strict role separation**: No role toggle within workspaces; dedicated workspaces per role
2. **Reactive state**: GetX Obx + Rx for efficient updates
3. **Modular routing**: Named routes via ModuleRegistry
4. **Lazy loading**: Controllers registered with `Get.lazyPut` per role
5. **Monochrome icons**: Step icons adapt to theme (light/dark)
6. **Gradient branding**: Role-specific gradients (HM: purple→cyan, TO: coral)
7. **Animated polish**: Custom painters for smooth looping animations

---

## 📝 Notes

- Placeholder screens (Packages, Verification, etc.) show "Coming soon" messages
- All drawers have "Switch to Traveler" option
- Only Hotel Manager has implemented "List Your Hotel" flow
- Tour Operator flow is scaffolding ready for implementation
- Profile is accessible from Traveler drawer only (for now)

---

**Last Updated:** January 2025  
**Architecture:** Modular (Domain-Driven Design)  
**State Management:** GetX  
**Navigation:** Named routes via ModuleRegistry


