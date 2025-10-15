import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripavail/utils/app_assets.dart';
import 'package:tripavail/utils/theme/theme_controller.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.height, this.width, this.fit});
  final double? height;
  final double? width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    var screenSize = MediaQuery.of(context).size;

    return Obx(() {
      String logoAsset;

      switch (themeController.selectedTheme.value) {
        case ThemeMode.light:
          logoAsset = AppAssets.appLogo;
          break;
        case ThemeMode.dark:
          logoAsset = AppAssets.appLogo;
          break;
        case ThemeMode.system:
          final Brightness brightness = MediaQuery.of(
            context,
          ).platformBrightness;
          logoAsset = brightness == Brightness.dark
              ? AppAssets.appLogo
              : AppAssets.appLogo;
          break;
      }

      return Image.asset(
        logoAsset,
        height: height ?? screenSize.height * 0.2,
        width: width ?? screenSize.height * 0.2,
        fit: fit ?? BoxFit.contain,
      );
    });
  }
}
