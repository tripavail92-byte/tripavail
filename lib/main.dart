import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripavail/features/splash_screen/splash_screen.dart';
import 'package:tripavail/utils/app_labels.dart';
import 'package:tripavail/utils/preference_labels.dart';
import 'package:tripavail/utils/theme/app_dark_theme.dart';
import 'package:tripavail/utils/theme/app_light_theme.dart';

import 'app_bindings.dart';
import 'common/controllers/preference_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppPreferencesController appPreferencesController =
      Get.put(AppPreferencesController());

  ThemeMode themeMode = ThemeMode.system;

  @override
  void initState() {
    super.initState();
    loadTheme();
  }

  Future<void> loadTheme() async {
    String? savedTheme = await appPreferencesController
        .getString(key: AppPreferenceLabels.userTheme);

    setState(() {
      themeMode = ThemeMode.values.firstWhere(
        (e) => e.toString() == savedTheme,
        orElse: () => ThemeMode.system,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppLabels.appName,
      debugShowCheckedModeBanner: false,
      initialBinding: createBindings(context),
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      home: const SplashScreen(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: TextScaler.noScaling),
          child: child!,
        );
      },
    );
  }
}
