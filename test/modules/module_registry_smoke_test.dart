import 'package:flutter_test/flutter_test.dart';
import 'package:tripavail/modules/hotel_manager/hotel_manager_module.dart';
import 'package:tripavail/modules/module_registry.dart';
import 'package:tripavail/modules/traveler/traveler_module.dart';
import 'package:tripavail/modules/tour_operator/tour_operator_module.dart';

void main() {
  setUp(() {
    ModuleRegistry.registerDefaults([]);
  });

  test('Traveler module registered', () {
    ModuleRegistry.registerDefaults([TravelerModule()]);
    // TravelerModule now uses direct navigation, so no routes are registered
    final pages = ModuleRegistry.pages;
    expect(pages, isEmpty);
  });

  test('Partner modules registered', () {
    ModuleRegistry.registerDefaults([
      HotelManagerModule(),
      TourOperatorModule(),
    ]);
    // Partner workspace routes are now accessed via direct navigation, not routes
    // Only module-specific routes remain registered
    final pages = ModuleRegistry.pages;
    expect(pages, isNotEmpty);
  });
}
