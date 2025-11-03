import 'package:get/get.dart';
import 'package:tripavail/features/home/main_navigation.dart';
import 'package:tripavail/features/onboarding/onboarding_screen.dart';
import 'package:tripavail/features/partner/partner_entry_screen.dart';
import 'package:tripavail/features/splash_screen/splash_screen.dart';

import '../app_module.dart';
import 'traveler_routes.dart';

class TravelerModule extends AppModule {
  @override
  String get name => 'traveler';

  @override
  List<GetPage<dynamic>> get pages => [
    GetPage(name: TravelerRoutes.splash, page: SplashScreen.new),
    GetPage(name: TravelerRoutes.onboarding, page: OnboardingScreen.new),
    GetPage(name: TravelerRoutes.main, page: MainNavigation.new),
    GetPage(name: TravelerRoutes.partnerEntry, page: PartnerEntryScreen.new),
  ];
}
