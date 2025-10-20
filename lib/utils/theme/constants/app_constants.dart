import 'package:flutter/material.dart';

/// Application color constants organized by theme
/// Contains base colors and semantic colors used throughout the app
class AppColors {
  // Base colors
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color transparent = Colors.transparent;
  static const Color primaryColor = Color(0xFFE11D48);
  static const Color greyColor = Color(0xFF9CA5B0);
  static const Color secondaryText = Color(0xFFABABAB);
  static const Color red = Colors.red;

  // Semantic colors
  static const Color positiveColor = Color(0xFF8CC73F);
  static const Color negativeColor = Color(0xFFFF6961);
}

/// Role-based visual definitions
class AppRoleGradients {
  // Traveller: linear-gradient(135deg, #FF385C 0%, #FF6B9D 100%)
  static const LinearGradient traveller = LinearGradient(
    colors: [Color(0xFFFF385C), Color(0xFFFF6B9D)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Placeholders for future roles
  static const LinearGradient hotelManager = LinearGradient(
    colors: [Color(0xFF3A7BD5), Color(0xFF00D2FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient tourOperator = LinearGradient(
    colors: [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

/// Light theme color definitions
/// Used when the app is in light mode
class AppLightThemeColors {
  static const Color appBackgroundColor = Color(0xFFFFFFFF);
  static const Color secondaryButtonColor = Color(
    0xFFEEEFF1,
  );
  static const Color primaryTextColor = Color(0xFF000229);
  static const Color primaryButtonTextColor = Color(
    0xFFFFFFFF,
  );
  static const Color secondaryButtonTextColor =
      AppColors.primaryColor;
  static const Color lightGreyColor = Color(0xFFEEEFF1);
  static const Color bottomSheetColor = Color(0xFFFFFFFF);
  static const Color iconColor = primaryTextColor;
}

/// Dark theme color definitions
/// Used when the app is in dark mode
class AppDarkThemeColors {
  static const Color appBackgroundColor = Color(0xFF2E2E2E);
  static const Color secondaryButtonColor = Color(
    0xFF454545,
  );
  static const Color primaryTextColor = Color(0xFFFFFFFF);
  static const Color primaryButtonTextColor = Color(
    0xFFFFFFFF,
  );
  static const Color secondaryButtonTextColor =
      AppColors.primaryColor;
  static const Color lightGreyColor = Color(0xFF454545);
  static const Color bottomSheetColor = Color(0xFF393939);
  static const Color iconColor = primaryTextColor;
}
