import 'package:flutter/material.dart';

import 'package:tripavail/features/partner/domain/entities/partner_dashboard_summary.dart';
import 'package:tripavail/features/partner/domain/entities/partner_metric.dart';
import 'package:tripavail/features/partner/domain/entities/partner_quick_action.dart';

class HotelManagerDashboardDataSource {
  Future<PartnerDashboardSummary> loadSummary() async {
    await Future.delayed(const Duration(milliseconds: 200));

    return PartnerDashboardSummary(
      heroTitle: 'Hotel Manager HQ',
      heroSubtitle:
          'Monitor occupancy, streamline operations, and delight every guest in one command center.',
      heroHighlights: const [
        '3 live listings',
        '1 draft awaiting review',
        '75% verification complete',
      ],
      metrics: const [
        PartnerMetric(
          id: 'occupancy',
          label: 'Occupancy',
          value: '82%',
          trendLabel: '+4.5% vs last week',
          trendValue: 4.5,
        ),
        PartnerMetric(
          id: 'reviews',
          label: 'Guest Rating',
          value: '4.6',
          trendLabel: '12 new reviews',
        ),
      ],
      quickActions: const [
        PartnerQuickAction(
          id: 'list_hotel',
          title: 'List Your Hotel',
          subtitle: 'Launch a new property effortlessly.',
          icon: Icons.apartment_outlined,
          background: Color(0xFF9D4EDD),
        ),
        PartnerQuickAction(
          id: 'list_packages',
          title: 'Create Packages',
          subtitle: 'Bundle stays with perks and upsells.',
          icon: Icons.inventory_2_outlined,
          background: Color(0xFF6A2DC9),
        ),
        PartnerQuickAction(
          id: 'calendar',
          title: 'Manage Calendar',
          subtitle: 'Adjust rates and availability instantly.',
          icon: Icons.calendar_today_outlined,
          background: Color(0xFF4CB7FF),
        ),
        PartnerQuickAction(
          id: 'verification',
          title: 'Finish Verification',
          subtitle: 'Upload documents to reach 100%.',
          icon: Icons.verified_user_outlined,
          background: Color(0xFF00D4FF),
        ),
      ],
    );
  }
}
