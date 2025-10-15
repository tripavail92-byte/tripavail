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
