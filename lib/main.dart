import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tripavail/modules/auth/auth_module.dart';
import 'package:tripavail/modules/core/core_module.dart';
import 'package:tripavail/modules/hotel_manager/hotel_manager_module.dart';
import 'package:tripavail/modules/module_registry.dart';
import 'package:tripavail/modules/tour_operator/tour_operator_module.dart';
import 'package:tripavail/modules/traveler/traveler_module.dart';
import 'package:tripavail/modules/traveler/traveler_routes.dart';
import 'package:tripavail/utils/app_labels.dart';
import 'package:tripavail/utils/preference_labels.dart';
import 'package:tripavail/utils/theme/app_dark_theme.dart';
import 'package:tripavail/utils/theme/app_light_theme.dart';

import 'app_bindings.dart';
import 'common/controllers/preference_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set edge-to-edge mode - status bar visible but integrated
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  ModuleRegistry.registerDefaults([
    CoreModule(),
    AuthModule(),
    TravelerModule(),
    HotelManagerModule(),
    TourOperatorModule(),
  ]);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppPreferencesController appPreferencesController = Get.put(
    AppPreferencesController(),
  );

  ThemeMode themeMode = ThemeMode.system;

  @override
  void initState() {
    super.initState();
    loadTheme();
  }

  Future<void> loadTheme() async {
    String? savedTheme = await appPreferencesController.getString(
      key: AppPreferenceLabels.userTheme,
    );

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
      initialRoute: TravelerRoutes.splash,
      getPages: ModuleRegistry.pages,
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
