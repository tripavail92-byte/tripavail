import 'package:get/get.dart';
import 'package:tripavail/features/partner/domain/repositories/partner_dashboard_repository.dart';
import 'package:tripavail/features/partner/domain/usecases/get_partner_dashboard_summary.dart';
import 'package:tripavail/features/partner/models/partner_role.dart';
import 'package:tripavail/features/partner/presentation/controllers/partner_dashboard_controller.dart';
import 'package:tripavail/features/tour_operator/data/datasources/tour_operator_dashboard_data_source.dart';
import 'package:tripavail/features/tour_operator/data/repositories/tour_operator_dashboard_repository.dart';

import '../app_module.dart';

class TourOperatorModule extends AppModule {
  @override
  String get name => 'tour_operator';

  @override
  List<GetPage<dynamic>> get pages => [];

  @override
  void registerDependencies() {
    Get.lazyPut<PartnerDashboardRepository>(
      () => TourOperatorDashboardRepository(
        dataSource: TourOperatorDashboardDataSource(),
      ),
      tag: PartnerRole.tourOperator.name,
    );

    Get.lazyPut<PartnerDashboardController>(
      () => PartnerDashboardController(
        GetPartnerDashboardSummary(
          Get.find<PartnerDashboardRepository>(
            tag: PartnerRole.tourOperator.name,
          ),
        ),
      ),
      tag: PartnerRole.tourOperator.name,
    );
  }
}
