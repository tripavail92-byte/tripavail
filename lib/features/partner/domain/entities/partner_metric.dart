class PartnerMetric {
  final String id;
  final String label;
  final String value;
  final String? trendLabel;
  final double? trendValue;

  const PartnerMetric({
    required this.id,
    required this.label,
    required this.value,
    this.trendLabel,
    this.trendValue,
  });
}
