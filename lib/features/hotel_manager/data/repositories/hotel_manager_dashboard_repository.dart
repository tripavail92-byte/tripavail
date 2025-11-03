import 'package:tripavail/features/partner/domain/entities/partner_dashboard_summary.dart';
import 'package:tripavail/features/partner/domain/repositories/partner_dashboard_repository.dart';

import '../datasources/hotel_manager_dashboard_data_source.dart';

class HotelManagerDashboardRepository implements PartnerDashboardRepository {
  final HotelManagerDashboardDataSource dataSource;

  HotelManagerDashboardRepository({required this.dataSource});

  @override
  Future<PartnerDashboardSummary> fetchDashboard() {
    return dataSource.loadSummary();
  }
}
