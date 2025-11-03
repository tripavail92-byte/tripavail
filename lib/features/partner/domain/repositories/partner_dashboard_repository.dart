import '../entities/partner_dashboard_summary.dart';

abstract class PartnerDashboardRepository {
  Future<PartnerDashboardSummary> fetchDashboard();
}
