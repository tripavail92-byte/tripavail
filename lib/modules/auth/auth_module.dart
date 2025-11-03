import 'package:get/get.dart';
import 'package:tripavail/features/authentication/flow/auth_welcome_screen.dart';
import 'package:tripavail/features/authentication/flow/email_entry_screen.dart';
import 'package:tripavail/features/authentication/flow/otp_screen.dart';
import 'package:tripavail/features/authentication/flow/setup_location_screen.dart';
import 'package:tripavail/features/authentication/flow/setup_name_screen.dart';

import '../app_module.dart';
import 'auth_routes.dart';

class AuthModule extends AppModule {
  @override
  String get name => 'auth';

  @override
  List<GetPage<dynamic>> get pages => [
    GetPage(name: AuthRoutes.welcome, page: AuthWelcomeScreen.new),
    GetPage(name: AuthRoutes.emailEntry, page: EmailEntryScreen.new),
    GetPage(
      name: AuthRoutes.verifyOtp,
      page: () {
        final arg = Get.arguments;
        final email = arg is String ? arg : '';
        return OtpVerificationScreen(email: email);
      },
    ),
    GetPage(name: AuthRoutes.setupName, page: SetupNameScreen.new),
    GetPage(name: AuthRoutes.setupLocation, page: SetupLocationScreen.new),
  ];
}
