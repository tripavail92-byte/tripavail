import 'package:flutter/material.dart';
import 'package:tripavail/utils/theme/constants/app_constants.dart';

class RoleThemeExtension extends ThemeExtension<RoleThemeExtension> {
  final Gradient primaryGradient;

  const RoleThemeExtension({required this.primaryGradient});

  @override
  RoleThemeExtension copyWith({Gradient? primaryGradient}) {
    return RoleThemeExtension(
      primaryGradient: primaryGradient ?? this.primaryGradient,
    );
  }

  @override
  RoleThemeExtension lerp(ThemeExtension<RoleThemeExtension>? other, double t) {
    if (other is! RoleThemeExtension) return this;
    // Gradient.lerp isn't available; choose end at >0.5
    return RoleThemeExtension(
      primaryGradient: t < 0.5 ? primaryGradient : other.primaryGradient,
    );
  }

  static const RoleThemeExtension traveller = RoleThemeExtension(
    primaryGradient: AppRoleGradients.traveller,
  );
}


