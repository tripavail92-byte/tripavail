import 'package:flutter_test/flutter_test.dart';
import 'package:tripavail/modules/hotel_manager/hotel_manager_module.dart';
import 'package:tripavail/modules/module_registry.dart';
import 'package:tripavail/modules/partner/partner_routes.dart';
import 'package:tripavail/modules/traveler/traveler_module.dart';
import 'package:tripavail/modules/traveler/traveler_routes.dart';
import 'package:tripavail/modules/tour_operator/tour_operator_module.dart';

void main() {
  setUp(() {
    ModuleRegistry.registerDefaults([]);
  });

  test('Traveler routes registered', () {
    ModuleRegistry.registerDefaults([TravelerModule()]);
    final names = ModuleRegistry.pages.map((e) => e.name).toList();
    expect(names, contains(TravelerRoutes.partnerEntry));
    expect(names, contains(TravelerRoutes.onboarding));
  });

  test('Partner routes registered', () {
    ModuleRegistry.registerDefaults([
      HotelManagerModule(),
      TourOperatorModule(),
    ]);
    final names = ModuleRegistry.pages.map((e) => e.name).toList();
    expect(names, contains(PartnerRoutes.hotelWorkspace));
    expect(names, contains(PartnerRoutes.tourWorkspace));
  });
}
