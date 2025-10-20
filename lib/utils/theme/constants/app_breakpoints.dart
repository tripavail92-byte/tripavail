import 'package:flutter/widgets.dart';

class AppBreakpoints {
  static const double mobileMax = 600;
  static const double tabletMax = 1024;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= mobileMax;
  static bool isTablet(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return w > mobileMax && w <= tabletMax;
  }
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > tabletMax;
}


