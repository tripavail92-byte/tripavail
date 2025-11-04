import 'package:flutter/material.dart';
import 'package:tripavail/utils/app_text_styles.dart';
class MessagesTab extends StatelessWidget {
  const MessagesTab({super.key});

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

          Text(
            'Messages',
            style: AppTextStyle.headlineSmall.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: height * 0.02),

          // Message List
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 8,
            itemBuilder: (context, index) {
              return _MessageCard(index: index);
            },
          ),
        ],
      ),
    );
  }
}

class _MessageCard extends StatelessWidget {
  final int index;

  const _MessageCard({required this.index});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final contacts = [
      'Hotel Manager',
      'Tour Guide',
      'Support Team',
      'Flight Booking',
      'Customer Service',
      'Trip Advisor',
      'Car Rental',
      'Restaurant',
    ];

    final messages = [
      'Your booking has been confirmed!',
      'Tour starts at 9:00 AM tomorrow',
      'How can we help you today?',
      'Your flight ticket is ready',
      'We\'re here to assist you',
      'New recommendation available',
      'Vehicle is ready for pickup',
      'Table reserved for tonight',
    ];

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
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
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  theme.primaryColor.withValues(alpha:0.3),
                  theme.primaryColor.withValues(alpha:0.1),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                contacts[index][0],
                style: AppTextStyle.bodyLarge.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.primaryColor,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      contacts[index],
                      style: AppTextStyle.bodyMedium
                          .copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Text(
                      '${index + 1}h ago',
                      style: AppTextStyle.bodySmall
                          .copyWith(
                            color: Colors.grey[600],
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  messages[index],
                  style: AppTextStyle.bodySmall.copyWith(
                    color: Colors.grey[600],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          if (index < 3) ...[
            const SizedBox(width: 8),
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: theme.primaryColor,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
