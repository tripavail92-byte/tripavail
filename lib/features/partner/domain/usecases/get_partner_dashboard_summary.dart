import '../entities/partner_dashboard_summary.dart';
import '../repositories/partner_dashboard_repository.dart';

class GetPartnerDashboardSummary {
  final PartnerDashboardRepository repository;

  const GetPartnerDashboardSummary(this.repository);

  Future<PartnerDashboardSummary> call() {
    return repository.fetchDashboard();
  }
}
