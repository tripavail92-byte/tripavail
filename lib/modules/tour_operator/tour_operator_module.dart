import 'package:get/get.dart';
import 'package:tripavail/features/partner/domain/repositories/partner_dashboard_repository.dart';
import 'package:tripavail/features/partner/domain/usecases/get_partner_dashboard_summary.dart';
import 'package:tripavail/features/partner/models/partner_role.dart';
import 'package:tripavail/features/partner/presentation/controllers/partner_dashboard_controller.dart';
import 'package:tripavail/features/partner/partner_workspace_screen.dart';
import 'package:tripavail/features/tour_operator/data/datasources/tour_operator_dashboard_data_source.dart';
import 'package:tripavail/features/tour_operator/data/repositories/tour_operator_dashboard_repository.dart';

import '../app_module.dart';
import '../partner/partner_routes.dart';
import 'tour_operator_routes.dart';
import 'package:tripavail/features/tour_operator/presentation/screens/tour_create_screen.dart';
import 'package:tripavail/features/tour_operator/presentation/screens/tour_packages_screen.dart';
import 'package:tripavail/features/tour_operator/presentation/screens/tour_calendar_screen.dart';
import 'package:tripavail/features/tour_operator/presentation/screens/tour_bookings_screen.dart';
import 'package:tripavail/features/tour_operator/presentation/screens/tour_verification_screen.dart';

class TourOperatorModule extends AppModule {
  @override
  String get name => 'tour_operator';

  @override
  List<GetPage<dynamic>> get pages => [
    GetPage(
      name: PartnerRoutes.tourWorkspace,
      page: () =>
          const PartnerWorkspaceScreen(initialRole: PartnerRole.tourOperator),
    ),
    GetPage(name: TourOperatorRoutes.createTour, page: TourCreateScreen.new),
    GetPage(name: TourOperatorRoutes.packages, page: TourPackagesScreen.new),
    GetPage(name: TourOperatorRoutes.calendar, page: TourCalendarScreen.new),
    GetPage(name: TourOperatorRoutes.bookings, page: TourBookingsScreen.new),
    GetPage(
      name: TourOperatorRoutes.verification,
      page: TourVerificationScreen.new,
    ),
  ];

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
