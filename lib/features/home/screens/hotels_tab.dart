import 'package:flutter/material.dart';
import 'package:tripavail/utils/app_text_styles.dart';
import 'package:tripavail/utils/theme/constants/app_spacing.dart';

class HotelsTab extends StatelessWidget {
  const HotelsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: AppSpacing.horizontalPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSpacing.v24(),

          // Search Bar
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: theme.brightness == Brightness.dark
                  ? const Color(0xFF2E2E2E)
                  : Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(Icons.search, color: Colors.grey[600]),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Search hotels...',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ],
            ),
          ),

          AppSpacing.v24(),

          Text(
            'Featured Hotels',
            style: AppTextStyle.headlineSmall.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          AppSpacing.v16(),

          // Hotel Cards
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return _HotelCard(index: index);
            },
          ),
        ],
      ),
    );
  }
}

class _HotelCard extends StatelessWidget {
  final int index;

  const _HotelCard({required this.index});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
            height: 180,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  theme.primaryColor.withValues(alpha: 0.4),
                  theme.primaryColor.withValues(alpha: 0.2),
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
                Icons.hotel,
                size: 64,
                color: Colors.white.withValues(alpha: 0.7),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Luxury Hotel ${index + 1}',
                  style: AppTextStyle.bodyLarge.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 16,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Downtown Area',
                      style: AppTextStyle.bodySmall
                          .copyWith(
                            color: Colors.grey[600],
                          ),
                    ),
                  ],
                ),
                AppSpacing.v8(),
                Row(
                  children: [
                    ...List.generate(
                      5,
                      (i) => Icon(
                        Icons.star,
                        size: 16,
                        color: i < 4
                            ? Colors.amber
                            : Colors.grey[400],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '4.${8 - index}',
                      style: AppTextStyle.bodySmall
                          .copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
                AppSpacing.v12(),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${150 + (index * 50)}/night',
                      style: AppTextStyle.bodyLarge
                          .copyWith(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      'View Details',
                      style: AppTextStyle.bodySmall
                          .copyWith(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
