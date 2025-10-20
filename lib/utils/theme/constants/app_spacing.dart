import 'package:flutter/material.dart';

class AppSpacing {
  static const double contentMaxWidth = 560; // keeps forms readable on wide screens

  static EdgeInsets horizontalPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final horizontal = width * 0.08;
    return EdgeInsets.symmetric(
      horizontal: horizontal.clamp(16.0, 28.0),
    );
  }

  static SizedBox v8() => const SizedBox(height: 8);
  static SizedBox v12() => const SizedBox(height: 12);
  static SizedBox v16() => const SizedBox(height: 16);
  static SizedBox v20() => const SizedBox(height: 20);
  static SizedBox v24() => const SizedBox(height: 24);
  static SizedBox v32() => const SizedBox(height: 32);
  static SizedBox v40() => const SizedBox(height: 40);
  static SizedBox v48() => const SizedBox(height: 48);
  static SizedBox v64() => const SizedBox(height: 64);
}


