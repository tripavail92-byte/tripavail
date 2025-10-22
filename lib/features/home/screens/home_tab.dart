import 'package:flutter/material.dart';
import 'package:tripavail/utils/app_text_styles.dart';
import 'package:tripavail/utils/theme/constants/app_spacing.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: AppSpacing.horizontalPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSpacing.v24(),

          // Welcome Banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  theme.primaryColor,
                  theme.primaryColor.withValues(alpha: 0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Discover Your Next',
                  style: AppTextStyle.headlineMedium
                      .copyWith(color: Colors.white),
                ),
                Text(
                  'Adventure',
                  style: AppTextStyle.headlineMedium
                      .copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                AppSpacing.v12(),
                Text(
                  'AI-powered recommendations just for you',
                  style: AppTextStyle.bodyMedium.copyWith(
                    color: Colors.white.withValues(
                      alpha: 0.9,
                    ),
                  ),
                ),
              ],
            ),
          ),

          AppSpacing.v32(),

          // Quick Actions
          Text(
            'Quick Actions',
            style: AppTextStyle.headlineSmall.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          AppSpacing.v16(),
          Row(
            children: [
              Expanded(
                child: _QuickActionCard(
                  icon: Icons.explore,
                  title: 'Explore',
                  color: theme.primaryColor,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _QuickActionCard(
                  icon: Icons.flight,
                  title: 'Flights',
                  color: const Color(0xFF2196F3),
                ),
              ),
            ],
          ),
          AppSpacing.v12(),
          Row(
            children: [
              Expanded(
                child: _QuickActionCard(
                  icon: Icons.directions_car,
                  title: 'Car Rental',
                  color: const Color(0xFF4CAF50),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _QuickActionCard(
                  icon: Icons.restaurant,
                  title: 'Restaurants',
                  color: const Color(0xFFFF9800),
                ),
              ),
            ],
          ),

          AppSpacing.v32(),

          // Popular Destinations
          Text(
            'Popular Destinations',
            style: AppTextStyle.headlineSmall.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          AppSpacing.v16(),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return _DestinationCard(index: index);
              },
            ),
          ),

          AppSpacing.v24(),
        ],
      ),
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;

  const _QuickActionCard({
    required this.icon,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark
            ? const Color(0xFF2E2E2E)
            : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark
              ? const Color(0xFF444444)
              : const Color(0xFFE0E0E0),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          AppSpacing.v8(),
          Text(
            title,
            style: AppTextStyle.bodyMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _DestinationCard extends StatelessWidget {
  final int index;

  const _DestinationCard({required this.index});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final destinations = [
      'Paris',
      'Tokyo',
      'New York',
      'London',
      'Dubai',
    ];

    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: isDark
            ? const Color(0xFF2E2E2E)
            : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark
              ? const Color(0xFF444444)
              : const Color(0xFFE0E0E0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  theme.primaryColor.withValues(alpha: 0.6),
                  theme.primaryColor.withValues(alpha: 0.3),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
            child: Center(
              child: Icon(
                Icons.location_city,
                size: 48,
                color: Colors.white.withValues(alpha: 0.8),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  destinations[index],
                  style: AppTextStyle.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Explore now',
                  style: AppTextStyle.bodySmall.copyWith(
                    color: theme.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
