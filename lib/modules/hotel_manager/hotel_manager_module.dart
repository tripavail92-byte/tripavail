import 'package:get/get.dart';
import 'package:tripavail/features/hotel_manager/data/datasources/hotel_manager_dashboard_data_source.dart';
import 'package:tripavail/features/hotel_manager/data/repositories/hotel_manager_dashboard_repository.dart';
import 'package:tripavail/features/partner/domain/repositories/partner_dashboard_repository.dart';
import 'package:tripavail/features/partner/domain/usecases/get_partner_dashboard_summary.dart';
import 'package:tripavail/features/partner/models/partner_role.dart';
import 'package:tripavail/features/partner/presentation/controllers/partner_dashboard_controller.dart';
import 'package:tripavail/features/partner/partner_workspace_screen.dart';

import '../app_module.dart';
import '../partner/partner_routes.dart';
import 'hotel_manager_routes.dart';
import 'package:tripavail/features/hotel_manager/presentation/screens/hotel_list_screen.dart';
import 'package:tripavail/features/hotel_manager/presentation/screens/hotel_packages_screen.dart';
import 'package:tripavail/features/hotel_manager/presentation/screens/hotel_verification_screen.dart';
import 'package:tripavail/features/hotel_manager/presentation/screens/hotel_listing_flow/step1_property_type_screen.dart';

class HotelManagerModule extends AppModule {
  @override
  String get name => 'hotel_manager';

  @override
  List<GetPage<dynamic>> get pages => [
    GetPage(
      name: PartnerRoutes.hotelWorkspace,
      page: () =>
          const PartnerWorkspaceScreen(initialRole: PartnerRole.hotelManager),
    ),
    GetPage(name: HotelManagerRoutes.hotelList, page: HotelListScreen.new),
    GetPage(name: HotelManagerRoutes.packages, page: HotelPackagesScreen.new),
    GetPage(
      name: HotelManagerRoutes.verification,
      page: HotelVerificationScreen.new,
    ),
    GetPage(
      name: HotelManagerRoutes.step1PropertyType,
      page: Step1PropertyTypeScreen.new,
    ),
  ];

  @override
  void registerDependencies() {
    Get.lazyPut<PartnerDashboardRepository>(
      () => HotelManagerDashboardRepository(
        dataSource: HotelManagerDashboardDataSource(),
      ),
      tag: PartnerRole.hotelManager.name,
    );

    Get.lazyPut<PartnerDashboardController>(
      () => PartnerDashboardController(
        GetPartnerDashboardSummary(
          Get.find<PartnerDashboardRepository>(
            tag: PartnerRole.hotelManager.name,
          ),
        ),
      ),
      tag: PartnerRole.hotelManager.name,
    );
  }
}
