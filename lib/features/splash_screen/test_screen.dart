import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripavail/utils/app_text_styles.dart';
import 'package:tripavail/utils/theme/theme_controller.dart';
import 'package:tripavail/widgets/primary_appbar.dart';
import 'package:tripavail/widgets/primary_button.dart';
import 'package:tripavail/widgets/primary_text_field.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});
  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final ThemeController themeController =
      Get.find<ThemeController>();

  void _toggleTheme() {
    if (themeController.selectedTheme.value ==
        ThemeMode.light) {
      themeController.setTheme(ThemeMode.dark);
    } else if (themeController.selectedTheme.value ==
        ThemeMode.dark) {
      themeController.setTheme(ThemeMode.system);
    } else {
      themeController.setTheme(ThemeMode.light);
    }
  }

  IconData _getThemeIcon() {
    switch (themeController.selectedTheme.value) {
      case ThemeMode.light:
        return Icons.light_mode;
      case ThemeMode.dark:
        return Icons.dark_mode;
      case ThemeMode.system:
        return Icons.brightness_auto;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return Scaffold(
      appBar: PrimaryAppBar(
        leadingWidget: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu_rounded),
        ),
        title: 'Trip Avail',
        actions: [
          Obx(
            () => IconButton(
              onPressed: _toggleTheme,
              icon: Icon(_getThemeIcon()),
              tooltip: 'Toggle Theme',
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.05,
        ),
        child: Column(
          children: [
            SizedBox(height: height * 0.02),

            ///
            /// Text
            ///
            Text(
              'Splash Screen',
              style: AppTextStyle.headlineSmall,
            ),

            SizedBox(height: height * 0.02),

            ///
            /// Primary Button
            ///
            PrimaryButton(
              onPressed: () {},
              title: 'Login',
              height: height * 0.06,
              width: width * 0.8,
            ),

            SizedBox(height: height * 0.02),

            ///
            /// PrimaryTextField
            ///
            PrimaryTextField(
              controller: TextEditingController(),
              label: 'Email',
              hintText: "Please enter your email",
              mandatory: true,
              keyboardType: TextInputType.emailAddress,
              inputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.none,
              textInputFormatter: [],
            ),
          ],
        ),
      ),
    );
  }
}
