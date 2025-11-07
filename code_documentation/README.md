# Code Documentation Index

## 🎯 For New Developers - Start Here!

### Essential Guides (Read in Order):
1. **[QUICK_START.md](./QUICK_START.md)** ⭐ - Start here! Quick onboarding guide
2. **[DIRECTORY_STRUCTURE.md](./DIRECTORY_STRUCTURE.md)** - Complete directory guide
3. **[CODING_STANDARDS.md](./CODING_STANDARDS.md)** - Coding rules and patterns

### Then Explore:
- **Screen Documentation** (below) - Detailed code examples for each screen

---

## Overview
This folder contains comprehensive documentation for the TripAvail Flutter application, including architecture, coding standards, and detailed screen implementations.

## Authentication Flow Screens
1. **[01_splash_screen.md](./01_splash_screen.md)** - Animated splash with travel elements
2. **[02_onboarding_screen.md](./02_onboarding_screen.md)** - Single-page onboarding
3. **[03_login_screen.md](./03_login_screen.md)** - Email/password login + social auth
4. **[04_signup_screen.md](./04_signup_screen.md)** - User registration
5. **[05_email_entry_screen.md](./05_email_entry_screen.md)** - Email capture for OTP
6. **[06_otp_screen.md](./06_otp_screen.md)** - 6-digit OTP verification
7. **[07_setup_name_screen.md](./07_setup_name_screen.md)** - Name capture
8. **[08_setup_location_screen.md](./08_setup_location_screen.md)** - Location permission & capture

## Profile & Settings
9. **[09_profile_screen.md](./09_profile_screen.md)** - User profile with edit/view modes

## Partner Screens
10. **[10_partner_entry_screen.md](./10_partner_entry_screen.md)** - Choose partner role
11. **[11_partner_workspace_screen.md](./11_partner_workspace_screen.md)** - Partner dashboard

## Code Rules Established

### 1. State Management
- ✅ Use StatefulWidget for screens with TextControllers or animations
- ✅ Use StatelessWidget for static/presentational screens
- ✅ Always dispose controllers in dispose() method
- ✅ Use GetX for navigation and state when needed

### 2. Validation
- ✅ Separate validation functions for each field
- ✅ Return null for valid, string for error message
- ✅ Validate before submission
- ✅ Show errors via SnackBar

### 3. Navigation
- ✅ Use Get.to() for forward navigation
- ✅ Use Get.offAll() to clear navigation stack
- ✅ Pass required data as constructor parameters
- ✅ Check mounted before navigation in async functions

### 4. Responsive Design
- ✅ Use MediaQuery for screen dimensions
- ✅ Percentage-based spacing (e.g., height * 0.02)
- ✅ ConstrainedBox with maxWidth for large screens
- ✅ Responsive padding (width * 0.08 = 8%)

### 5. Form Fields
- ✅ Proper textCapitalization (words for names, none for emails)
- ✅ Correct keyboardType (emailAddress, name, etc.)
- ✅ Input actions (next, done) for better UX
- ✅ Mandatory flag for required fields

### 6. Animations
- ✅ Use AnimationController with TickerProviderStateMixin
- ✅ Dispose all controllers
- ✅ Use Curves for smooth transitions
- ✅ Separate concerns (one controller per animation type)

### 7. Code Organization
- ✅ Constants at class level
- ✅ Private widgets with underscore prefix
- ✅ Validation methods prefixed with _validate
- ✅ Event handlers prefixed with _handle or _on

### 8. Platform-Specific
- ✅ Use dart:io for Platform.isIOS checks
- ✅ Conditional rendering for platform features
- ✅ Platform-specific assets/widgets

### 9. Error Handling
- ✅ Loading states for async operations
- ✅ Error states with user-friendly messages
- ✅ Null safety with proper checks
- ✅ Mounted checks before setState

### 10. Reusability
- ✅ Extract common widgets
- ✅ Use const constructors where possible
- ✅ Create data models with copy() methods
- ✅ Centralize labels, styles, constants

## File Naming Convention
- Format: `##_screen_name.md` (e.g., `01_splash_screen.md`)
- Numbers for ordering
- Snake_case for readability
- .md extension for Markdown

## Document Structure
Each screen documentation includes:
1. **File Path** - Exact location in project
2. **Purpose** - What the screen does
3. **Code Structure** - Main widgets, state, methods
4. **Key Features** - Notable functionality
5. **Navigation** - How it fits in app flow
6. **Dependencies** - Packages and utilities used
7. **Code Rules Applied** - Checklist of patterns followed

## 📂 Documentation Files

### 📘 Essential Guides (Start Here!)
1. **[QUICK_START.md](./QUICK_START.md)** ⭐ - Quick reference for common tasks
2. **[ONBOARDING.md](./ONBOARDING.md)** - 30-day developer onboarding plan
3. **[ARCHITECTURE.md](./ARCHITECTURE.md)** - System architecture and design patterns
4. **[DIRECTORY_STRUCTURE.md](./DIRECTORY_STRUCTURE.md)** - Complete folder structure
5. **[CODING_STANDARDS.md](./CODING_STANDARDS.md)** - Coding rules and patterns

### 📄 Screen Documentation (11 files)
Individual screen implementations with detailed code examples:
- **01-08**: Authentication flow screens
- **09**: Profile management
- **10-11**: Partner workspace screens

---

## 🎯 How to Use This Documentation

### 🆕 For New Developers
1. **Day 1**: Read **[ONBOARDING.md](./ONBOARDING.md)** - Your 30-day plan
2. **Day 2**: Study **[QUICK_START.md](./QUICK_START.md)** - Common tasks
3. **Day 3**: Review **[ARCHITECTURE.md](./ARCHITECTURE.md)** - Understand the system
4. **Day 4**: Explore **[DIRECTORY_STRUCTURE.md](./DIRECTORY_STRUCTURE.md)** - Know where things go
5. **Ongoing**: Reference **[CODING_STANDARDS.md](./CODING_STANDARDS.md)** - Write consistent code

### 👨‍💼 For Team Leads
1. Share **[ONBOARDING.md](./ONBOARDING.md)** with new hires
2. Reference **[CODING_STANDARDS.md](./CODING_STANDARDS.md)** in code reviews
3. Use **[ARCHITECTURE.md](./ARCHITECTURE.md)** for technical discussions
4. Update documentation when patterns change
5. Ensure team follows **[DIRECTORY_STRUCTURE.md](./DIRECTORY_STRUCTURE.md)**

### 💻 For Developers
- **Need quick answer?** → **[QUICK_START.md](./QUICK_START.md)**
- **Where does this go?** → **[DIRECTORY_STRUCTURE.md](./DIRECTORY_STRUCTURE.md)**
- **How to implement?** → Screen docs (01-11)
- **Why this pattern?** → **[ARCHITECTURE.md](./ARCHITECTURE.md)**
- **What's the standard?** → **[CODING_STANDARDS.md](./CODING_STANDARDS.md)**

### 📝 For Code Reviews
- ✅ Check against **[CODING_STANDARDS.md](./CODING_STANDARDS.md)** checklist
- ✅ Verify folder structure matches **[DIRECTORY_STRUCTURE.md](./DIRECTORY_STRUCTURE.md)**
- ✅ Compare with similar screen in documentation (01-11)
- ✅ Ensure architectural patterns from **[ARCHITECTURE.md](./ARCHITECTURE.md)**

---

## 📊 Documentation Coverage

| Category | Files | Status | Description |
|----------|-------|--------|-------------|
| **Core Guides** | 5 | ✅ Complete | Essential developer documentation |
| **Authentication** | 6 | ✅ Complete | Login, signup, OTP flows |
| **Core Screens** | 3 | ✅ Complete | Splash, onboarding, profile |
| **Partner Screens** | 2 | ✅ Complete | Partner workspace docs |
| **Hotel/Tour Screens** | 0 | 🔄 Pending | Detailed screen documentation |
| **Widget Docs** | 0 | 🔄 Future | Reusable widget documentation |

### Documentation Files

#### 📘 Core Guides (5 files)
- ✅ **QUICK_START.md** - Quick reference guide
- ✅ **ONBOARDING.md** - 30-day onboarding plan  
- ✅ **ARCHITECTURE.md** - System architecture
- ✅ **DIRECTORY_STRUCTURE.md** - Folder structure
- ✅ **CODING_STANDARDS.md** - Coding patterns

#### 📱 Screen Documentation (11 files)
- ✅ **01_splash_screen.md** - Animated splash
- ✅ **02_onboarding_screen.md** - Onboarding flow
- ✅ **03_login_screen.md** - Login implementation
- ✅ **04_signup_screen.md** - Signup flow
- ✅ **05_email_entry_screen.md** - Email capture
- ✅ **06_otp_screen.md** - OTP verification
- ✅ **07_setup_name_screen.md** - Name setup
- ✅ **08_setup_location_screen.md** - Location setup
- ✅ **09_profile_screen.md** - Profile management
- ✅ **10_partner_entry_screen.md** - Partner selection
- ✅ **11_partner_workspace_screen.md** - Partner dashboard

---

## 🔄 Keeping Documentation Updated

### When to Update
- ✏️ Adding new screens → Create new `##_screen_name.md`
- ✏️ New patterns emerge → Update **CODING_STANDARDS.md**
- ✏️ Folder structure changes → Update **DIRECTORY_STRUCTURE.md**
- ✏️ New features → Update relevant guides

### Documentation Standards
- Use Markdown formatting
- Include code examples
- Keep consistent structure
- Add to index (this README)

---

## Last Updated
Created: November 6, 2025  
Last Modified: November 6, 2025
