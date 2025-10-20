import 'package:flutter/material.dart';
import 'package:tripavail/utils/app_text_styles.dart';
import 'package:tripavail/utils/theme/constants/app_spacing.dart';

class ToursTab extends StatelessWidget {
  const ToursTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: AppSpacing.horizontalPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSpacing.v24(),

          Text(
            'Explore Tours',
            style: AppTextStyle.headlineSmall.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          AppSpacing.v16(),

          // Tour Cards
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            itemBuilder: (context, index) {
              return _TourCard(index: index);
            },
          ),
        ],
      ),
    );
  }
}

class _TourCard extends StatelessWidget {
  final int index;

  const _TourCard({required this.index});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final tourTypes = [
      {'icon': Icons.hiking, 'name': 'Mountain Hiking'},
      {
        'icon': Icons.beach_access,
        'name': 'Beach Adventure',
      },
      {'icon': Icons.museum, 'name': 'City Culture'},
      {'icon': Icons.landscape, 'name': 'Scenic Views'},
      {'icon': Icons.water, 'name': 'Water Sports'},
      {'icon': Icons.nightlife, 'name': 'Night Tour'},
    ];

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  theme.primaryColor.withOpacity(0.3),
                  theme.primaryColor.withOpacity(0.1),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              tourTypes[index]['icon'] as IconData,
              size: 36,
              color: theme.primaryColor,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tourTypes[index]['name'] as String,
                  style: AppTextStyle.bodyLarge.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${3 + index} days • ${2 + index} activities',
                  style: AppTextStyle.bodySmall.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
                AppSpacing.v8(),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${(index + 2) * 100}',
                      style: AppTextStyle.bodyLarge
                          .copyWith(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey[600],
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
