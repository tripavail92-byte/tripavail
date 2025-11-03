import 'partner_metric.dart';
import 'partner_quick_action.dart';

class PartnerDashboardSummary {
  final String heroTitle;
  final String heroSubtitle;
  final List<String> heroHighlights;
  final List<PartnerMetric> metrics;
  final List<PartnerQuickAction> quickActions;

  const PartnerDashboardSummary({
    required this.heroTitle,
    required this.heroSubtitle,
    required this.heroHighlights,
    required this.metrics,
    required this.quickActions,
  });
}
