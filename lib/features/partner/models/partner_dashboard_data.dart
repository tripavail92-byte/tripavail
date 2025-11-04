import 'package:flutter/material.dart';

import 'partner_role.dart';

class PartnerDashboardData {
  final String heroTitle;
  final String heroSubtitle;
  final List<String> heroHighlights;
  final List<PartnerMetric> metrics;
  final List<PartnerQuickAction> quickActions;

  PartnerDashboardData({
    required this.heroTitle,
    required this.heroSubtitle,
    required this.heroHighlights,
    required this.metrics,
    required this.quickActions,
  });

  static PartnerDashboardData mockData(PartnerRole role) {
    switch (role) {
      case PartnerRole.hotelManager:
        return PartnerDashboardData(
          heroTitle: 'Welcome to Hotel Manager',
          heroSubtitle: 'Manage your properties and grow your business',
          heroHighlights: [
            'List Properties',
            'Manage Bookings',
            'Track Revenue',
          ],
          metrics: [
            PartnerMetric(
              label: 'Properties',
              value: '12',
              trendLabel: '+2 this month',
            ),
            PartnerMetric(label: 'Bookings', value: '156', trendLabel: '+23%'),
            PartnerMetric(
              label: 'Revenue',
              value: '\$45.2K',
              trendLabel: '+18%',
            ),
          ],
          quickActions: [
            PartnerQuickAction(
              title: 'List Hotel',
              subtitle: 'Add new property',
              icon: Icons.apartment_outlined,
              background: Colors.purple,
            ),
            PartnerQuickAction(
              title: 'Packages',
              subtitle: 'Manage offers',
              icon: Icons.card_giftcard_outlined,
              background: Colors.cyan,
            ),
            PartnerQuickAction(
              title: 'Verification',
              subtitle: 'Verify property',
              icon: Icons.verified_outlined,
              background: Colors.blue,
            ),
            PartnerQuickAction(
              title: 'Analytics',
              subtitle: 'View insights',
              icon: Icons.analytics_outlined,
              background: Colors.indigo,
            ),
          ],
        );
      case PartnerRole.tourOperator:
        return PartnerDashboardData(
          heroTitle: 'Welcome to Tour Operator',
          heroSubtitle: 'Create amazing tours and manage your business',
          heroHighlights: ['Create Tours', 'Manage Calendar', 'Track Bookings'],
          metrics: [
            PartnerMetric(
              label: 'Active Tours',
              value: '8',
              trendLabel: '+1 this month',
            ),
            PartnerMetric(label: 'Bookings', value: '89', trendLabel: '+15%'),
            PartnerMetric(
              label: 'Revenue',
              value: '\$28.5K',
              trendLabel: '+12%',
            ),
          ],
          quickActions: [
            PartnerQuickAction(
              title: 'Create Tour',
              subtitle: 'Add new tour',
              icon: Icons.route_outlined,
              background: Colors.deepOrange,
            ),
            PartnerQuickAction(
              title: 'Packages',
              subtitle: 'Manage packages',
              icon: Icons.inventory_2_outlined,
              background: Colors.orange,
            ),
            PartnerQuickAction(
              title: 'Calendar',
              subtitle: 'Schedule tours',
              icon: Icons.calendar_today_outlined,
              background: Colors.red,
            ),
            PartnerQuickAction(
              title: 'Bookings',
              subtitle: 'View bookings',
              icon: Icons.book_online_outlined,
              background: Colors.pink,
            ),
          ],
        );
    }
  }
}

class PartnerMetric {
  final String label;
  final String value;
  final String? trendLabel;

  PartnerMetric({required this.label, required this.value, this.trendLabel});
}

class PartnerQuickAction {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color background;

  PartnerQuickAction({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.background,
  });
}
