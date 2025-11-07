import 'package:flutter/material.dart';
import 'package:tripavail/utils/app_text_styles.dart';

class HotelsTab extends StatelessWidget {
  const HotelsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: width * 0.08),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height * 0.03),

          // Search Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(Icons.search, color: Theme.of(context).iconTheme.color?.withValues(alpha: 0.6)),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Search hotels...',
                    style: TextStyle(color: Theme.of(context).textTheme.bodySmall?.color?.withValues(alpha: 0.7)),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: height * 0.03),

          Text(
            'Featured Hotels',
            style: AppTextStyle.headlineSmall.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: height * 0.02),

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

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.dividerColor.withValues(alpha: 0.6)),
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
                color: Theme.of(context).colorScheme.onPrimary.withValues(alpha: 0.85),
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
                    Icon(Icons.location_on, size: 16, color: Theme.of(context).iconTheme.color?.withValues(alpha: 0.6)),
                    const SizedBox(width: 4),
                    Text(
                      'Downtown Area',
                      style: AppTextStyle.bodySmall.copyWith(
                        color: Theme.of(context).textTheme.bodySmall?.color?.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Row(
                  children: [
                    ...List.generate(
                      5,
                      (i) => Icon(
                        Icons.star,
                        size: 16,
                        color: i < 4
                            ? Colors.amber // keep star amber as semantic rating color
                            : Theme.of(context).iconTheme.color?.withValues(alpha: 0.4),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '4.${8 - index}',
                      style: AppTextStyle.bodySmall.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${150 + (index * 50)}/night',
                      style: AppTextStyle.bodyLarge.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'View Details',
                      style: AppTextStyle.bodySmall.copyWith(
                        color: theme.colorScheme.primary,
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
