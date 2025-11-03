import 'package:tripavail/features/partner/domain/entities/partner_dashboard_summary.dart';
import 'package:tripavail/features/partner/domain/repositories/partner_dashboard_repository.dart';

import '../datasources/tour_operator_dashboard_data_source.dart';

class TourOperatorDashboardRepository implements PartnerDashboardRepository {
  final TourOperatorDashboardDataSource dataSource;

  TourOperatorDashboardRepository({required this.dataSource});

  @override
  Future<PartnerDashboardSummary> fetchDashboard() {
    return dataSource.loadSummary();
  }
}
