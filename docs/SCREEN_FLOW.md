# TripAvail - Complete Screen Flow Documentation

## 📱 Application Entry Flow

```
App Launch
    │
    ▼
┌─────────────────────────────────────────────────────────────┐
│ 1. SPLASH SCREEN                                            │
│    Class: SplashScreen                                       │
│    File: lib/features/splash_screen/splash_screen.dart      │
│    Duration: 4 seconds                                       │
│                                                              │
│    Features:                                                 │
│    • Animated logo with elastic bounce                       │
│    • Floating travel elements (hotel, plane, car, tour bus) │
│    • Particle effects and glow animations                    │
│    • Brand name "TripAvail"                                  │
│                                                              │
│    Navigation: → OnboardingScreen                            │
└─────────────────────────────────────────────────────────────┘
    │
    ▼
┌─────────────────────────────────────────────────────────────┐
│ 2. ONBOARDING SCREEN                                        │
│    Class: OnboardingScreen                                   │
│    File: lib/features/onboarding/onboarding_screen.dart      │
│                                                              │
│    Features:                                                 │
│    • Animated suitcase illustration                          │
│    • Single page with "Skip" button                          │
│    • "Get Started" / "Next" button                          │
│                                                              │
│    Actions:                                                  │
│    • Skip → Saves `hasOnboarded: true` → AuthWelcomeScreen │
│    • Next → Saves `hasOnboarded: true` → AuthWelcomeScreen │
└─────────────────────────────────────────────────────────────┘
    │
    ▼
┌─────────────────────────────────────────────────────────────┐
│ 3. AUTH WELCOME SCREEN                                      │
│    Class: AuthWelcomeScreen                                  │
│    File: lib/features/authentication/flow/auth_welcome_screen.dart│
│                                                              │
│    Features:                                                 │
│    • Welcome message                                         │
│    • Social login buttons (Google, Apple, Email)            │
│                                                              │
│    Navigation: → EmailEntryScreen                            │
└─────────────────────────────────────────────────────────────┘
    │
    ▼
┌─────────────────────────────────────────────────────────────┐
│ 4. EMAIL ENTRY SCREEN                                       │
│    Class: EmailEntryScreen                                   │
│    File: lib/features/authentication/flow/email_entry_screen.dart │
│                                                              │
│    Features:                                                 │
│    • Email input field                                       │
│    • Continue button                                         │
│                                                              │
│    Navigation: → OtpVerificationScreen (with email argument)│
└─────────────────────────────────────────────────────────────┘
    │
    ▼
┌─────────────────────────────────────────────────────────────┐
│ 5. OTP VERIFICATION SCREEN                                  │
│    Class: OtpVerificationScreen                              │
│    File: lib/features/authentication/flow/otp_screen.dart    │
│                                                              │
│    Features:                                                 │
│    • 6-digit OTP input                                       │
│    • Resend code button                                      │
│    • Verify button                                           │
│                                                              │
│    Navigation: → SetupNameScreen                            │
└─────────────────────────────────────────────────────────────┘
    │
    ▼
┌─────────────────────────────────────────────────────────────┐
│ 6. SETUP NAME SCREEN                                        │
│    Class: SetupNameScreen                                    │
│    File: lib/features/authentication/flow/setup_name_screen.dart │
│                                                              │
│    Features:                                                 │
│    • Full name input                                         │
│    • Continue button                                         │
│    • Skip button                                             │
│                                                              │
│    Navigation: → SetupLocationScreen                        │
└─────────────────────────────────────────────────────────────┘
    │
    ▼
┌─────────────────────────────────────────────────────────────┐
│ 7. SETUP LOCATION SCREEN                                    │
│    Class: SetupLocationScreen                                │
│    File: lib/features/authentication/flow/setup_location_screen.dart │
│                                                              │
│    Features:                                                 │
│    • Location picker (Geolocator + Geocoding)                │
│    • Current location button                                 │
│    • Skip button                                             │
│                                                              │
│    Navigation: → MainNavigation (Traveler Dashboard)        │
└─────────────────────────────────────────────────────────────┘
```

---

## 🏠 Traveler Dashboard (Main Navigation)

```
┌─────────────────────────────────────────────────────────────┐
│ MAIN NAVIGATION                                             │
│ Class: MainNavigation                                       │
│ File: lib/features/home/main_navigation.dart                │
│                                                             │
│ Features:                                                   │
│ • Bottom navigation bar (Home, Hotels, Tours, Messages)    │
│ • Hamburger menu → Drawer                                   │
│ • Role: Traveler                                            │
└─────────────────────────────────────────────────────────────┘
    │
    ├─→ HOME TAB
    │   └─> Class: HomeTab
    │       File: lib/features/home/screens/home_tab.dart
    │       • Welcome banner with gradient
    │       • Quick action cards (Explore, Flights, Car Rental, Restaurants)
    │       • Popular destinations horizontal scroll
    │
    ├─→ HOTELS TAB
    │   └─> Class: HotelsTab
    │       File: lib/features/home/screens/hotels_tab.dart
    │       • Hotel listings grid
    │
    ├─→ TOURS TAB
    │   └─> Class: ToursTab
    │       File: lib/features/home/screens/tours_tab.dart
    │       • Tour packages grid
    │
    └─→ MESSAGES TAB
        └─> Class: MessagesTab
            File: lib/features/home/screens/messages_tab.dart
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
│ Class: PartnerEntryScreen                                   │
│ File: lib/features/partner/partner_entry_screen.dart        │
│                                                             │
│ Features:                                                   │
│ • Two role cards with gradients:                            │
│   1. Hotel Manager (purple→cyan gradient)                   │
│   2. Tour Operator (coral gradient)                         │
│                                                             │
│ Navigation:                                                 │
│ • Hotel Manager → PartnerWorkspaceScreen(role: hotelManager)│
│ • Tour Operator → PartnerWorkspaceScreen(role: tourOperator)│
└─────────────────────────────────────────────────────────────┘
    │
    ├─→ HOTEL MANAGER WORKSPACE
    │   │
    │   ▼
    │   ┌───────────────────────────────────────────────────┐
    │   │ HOTEL MANAGER WORKSPACE                           │
    │   │ Class: PartnerWorkspaceScreen                      │
    │   │ File: lib/features/partner/partner_workspace_screen.dart│
    │   │                                                    │
    │   │ Features:                                          │
    │   │ • Hero card with metrics (gradient)                │
    │   │ • Quick action grid                                │
    │   │ • Hamburger menu → Hotel Manager Drawer            │
    │   │ • Switch to Traveler button                        │
    │   └───────────────────────────────────────────────────┘
    │               │
    │               ├─→ LIST YOUR HOTEL (Overview)
    │               │   Class: HotelListScreen
    │               │   File: lib/features/hotel_manager/presentation/screens/hotel_list_screen.dart
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
    │               │   Navigation: → Step1PropertyTypeScreen
    │               │
    │               ├─→ STEP 1: PROPERTY TYPE
    │               │   Class: Step1PropertyTypeScreen
    │               │   File: lib/features/hotel_manager/presentation/screens/hotel_listing_flow/step1_property_type_screen.dart
    │               │   
    │               │   Features:
    │               │   • Animated property type icon
    │               │   • Grid of property type cards
    │               │   • Continue button
    │               │
    │               ├─→ HOTEL PACKAGES
    │               │   Class: HotelPackagesScreen
    │               │   File: lib/features/hotel_manager/presentation/screens/hotel_packages_screen.dart
    │               │   Status: Placeholder
    │               │
    │               └─→ HOTEL VERIFICATION
    │                   Class: HotelVerificationScreen
    │                   File: lib/features/hotel_manager/presentation/screens/hotel_verification_screen.dart
    │                   Status: Placeholder
    │
    │   Hotel Manager Drawer Menu:
    │   ┌───────────────────────────────────────────────────┐
    │   │ 🏠 Dashboard      → PartnerWorkspaceScreen        │
    │   │ 📝 List Your Hotel → HotelListScreen              │
    │   │ 📦 Packages        → HotelPackagesScreen          │
    │   │ ✅ Verification    → HotelVerificationScreen      │
    │   │                                                    │
    │   │ ────────────────────────────────────────────────   │
    │   │                                                    │
    │   │ 🧳 SWITCH TO TRAVELER → MainNavigation            │
    │   └───────────────────────────────────────────────────┘
    │
    │
    └─→ TOUR OPERATOR WORKSPACE
        │
        ▼
        ┌───────────────────────────────────────────────────┐
        │ TOUR OPERATOR WORKSPACE                           │
        │ Class: PartnerWorkspaceScreen                      │
        │ File: lib/features/partner/partner_workspace_screen.dart│
        │                                                    │
        │ Features:                                          │
        │ • Hero card with metrics (coral gradient)          │
        │ • Quick action grid                                │
        │ • Hamburger menu → Tour Operator Drawer            │
        │ • Switch to Traveler button                        │
        └───────────────────────────────────────────────────┘
                    │
                    ├─→ CREATE TOUR
                    │   Class: TourCreateScreen
                    │   File: lib/features/tour_operator/presentation/screens/tour_create_screen.dart
                    │   Status: Placeholder
                    │
                    ├─→ TOUR PACKAGES
                    │   Class: TourPackagesScreen
                    │   File: lib/features/tour_operator/presentation/screens/tour_packages_screen.dart
                    │   Status: Placeholder
                    │
                    ├─→ TOUR CALENDAR
                    │   Class: TourCalendarScreen
                    │   File: lib/features/tour_operator/presentation/screens/tour_calendar_screen.dart
                    │   Status: Placeholder
                    │
                    ├─→ TOUR BOOKINGS
                    │   Class: TourBookingsScreen
                    │   File: lib/features/tour_operator/presentation/screens/tour_bookings_screen.dart
                    │   Status: Placeholder
                    │
                    └─→ TOUR VERIFICATION
                        Class: TourVerificationScreen
                        File: lib/features/tour_operator/presentation/screens/tour_verification_screen.dart
                        Status: Placeholder
        
        Tour Operator Drawer Menu:
        ┌───────────────────────────────────────────────────┐
        │ 🏠 Dashboard       → PartnerWorkspaceScreen       │
        │ ➕ Create Tour      → TourCreateScreen             │
        │ 📦 Packages         → TourPackagesScreen           │
        │ 📅 Calendar         → TourCalendarScreen           │
        │ 📋 Bookings         → TourBookingsScreen           │
        │ ✅ Verification     → TourVerificationScreen       │
        │                                                    │
        │ ────────────────────────────────────────────────   │
        │                                                    │
        │ 🧳 SWITCH TO TRAVELER → MainNavigation            │
        │ └───────────────────────────────────────────────────┘
```

---

## 🔐 Profile Screen (Shared)

```
┌─────────────────────────────────────────────────────────────┐
│ PROFILE SCREEN                                              │
│ Class: ProfileScreen                                        │
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

## 🔄 State Management & Navigation

### GetX Navigation
- All navigation via direct widget instantiation (`Get.to()`, `Get.offAll()`)
- Controllers registered via `Get.put()` with tags per role
- No named routes - direct widget navigation for simplicity

### Controller Management
- Controllers initialized in `initState()` or `onInit()` methods
- PartnerDashboardController uses mock data for UI development
- Controllers tagged by role for separate state management

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

## 📂 File Structure

```
lib/
├── features/
│   ├── splash_screen/     # SplashScreen + animations
│   ├── onboarding/        # OnboardingScreen + animated suitcases
│   ├── authentication/    # Auth flow screens
│   │   └── flow/          # AuthWelcomeScreen, EmailEntryScreen, OtpVerificationScreen, SetupNameScreen, SetupLocationScreen
│   ├── home/              # MainNavigation + 4 tabs (HomeTab, HotelsTab, ToursTab, MessagesTab)
│   ├── profile/           # ProfileScreen + widgets
│   ├── partner/           # PartnerEntryScreen, PartnerWorkspaceScreen + models
│   ├── hotel_manager/     # HotelListScreen, Step1PropertyTypeScreen, HotelPackagesScreen, HotelVerificationScreen
│   ├── tour_operator/     # TourCreateScreen, TourPackagesScreen, TourCalendarScreen, TourBookingsScreen, TourVerificationScreen
│   └── drawer/            # DrawerManager, DrawerDefinitions
│
├── widgets/               # Shared UI components
│   ├── animations/        # LoopingIcon base
│   ├── primary_button.dart
│   ├── primary_text_field.dart
│   └── [other widgets]
│
├── utils/                 # Utilities and helpers
│   ├── theme/             # Theme configuration
│   ├── app_labels.dart
│   ├── app_text_styles.dart
│   └── [other utilities]
│
└── common/                # Common controllers
    └── controllers/        # AppPreferencesController, etc.
```

---

## 🚀 Quick Reference

### Navigation Commands
- `Get.to(() => const Widget())` - Push new screen
- `Get.offAll(() => const Widget())` - Replace all screens
- `Get.back()` - Pop current screen
- `Get.put(Controller())` - Register controller
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
3. **Direct widget navigation**: All navigation uses direct widget instantiation (no named routes)
4. **UI-focused architecture**: Removed domain/data/repository layers; using mock data for UI development
5. **Simple state management**: Controllers registered with `Get.put()` per role
6. **Monochrome icons**: Step icons adapt to theme (light/dark)
7. **Gradient branding**: Role-specific gradients (HM: purple→cyan, TO: coral)
8. **Animated polish**: Custom painters for smooth looping animations

---

## 📝 Notes

- Placeholder screens (Packages, Verification, etc.) show "Coming soon" messages
- All drawers have "Switch to Traveler" option
- Only Hotel Manager has implemented "List Your Hotel" flow
- Tour Operator flow is scaffolding ready for implementation
- Profile is accessible from Traveler drawer only (for now)

---

**Last Updated:** January 2025  
**Architecture:** UI-Focused (Cleaned & Simplified)  
**State Management:** GetX  
**Navigation:** Direct Widget Navigation (Get.to, Get.offAll)


