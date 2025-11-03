import 'package:get/get.dart';
import 'package:tripavail/features/hotel_manager/data/datasources/hotel_manager_dashboard_data_source.dart';
import 'package:tripavail/features/hotel_manager/data/repositories/hotel_manager_dashboard_repository.dart';
import 'package:tripavail/features/partner/domain/repositories/partner_dashboard_repository.dart';
import 'package:tripavail/features/partner/domain/usecases/get_partner_dashboard_summary.dart';
import 'package:tripavail/features/partner/models/partner_role.dart';
import 'package:tripavail/features/partner/presentation/controllers/partner_dashboard_controller.dart';

import '../app_module.dart';

class HotelManagerModule extends AppModule {
  @override
  String get name => 'hotel_manager';

  @override
  List<GetPage<dynamic>> get pages => [];

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
