import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripavail/features/hotel_manager/presentation/theme/hotel_manager_theme.dart';
import 'package:tripavail/features/hotel_manager/presentation/widgets/property_type_icon.dart';
import 'package:tripavail/utils/app_text_styles.dart';
import 'package:tripavail/widgets/primary_button.dart';

class Step1PropertyTypeScreen extends StatefulWidget {
  const Step1PropertyTypeScreen({super.key});

  @override
  State<Step1PropertyTypeScreen> createState() =>
      _Step1PropertyTypeScreenState();
}

class _Step1PropertyTypeScreenState extends State<Step1PropertyTypeScreen> {
  String? selectedType;

  final List<Map<String, dynamic>> propertyTypes = const [
    {'id': 'hotel', 'name': 'Hotel', 'icon': Icons.apartment},
    {'id': 'boutique', 'name': 'Boutique Hotel', 'icon': Icons.business},
    {'id': 'resort', 'name': 'Resort', 'icon': Icons.beach_access},
    {'id': 'motel', 'name': 'Motel', 'icon': Icons.local_hotel},
    {'id': 'lodge', 'name': 'Lodge', 'icon': Icons.cabin},
    {'id': 'inn', 'name': 'Inn', 'icon': Icons.home},
    {'id': 'guesthouse', 'name': 'Guest House', 'icon': Icons.house},
    {'id': 'hostel', 'name': 'Hostel', 'icon': Icons.bed},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark
        ? HotelManagerTheme.backgroundDark
        : HotelManagerTheme.backgroundLight;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Get.back(),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Step 1 of 5',
                          style: AppTextStyle.bodySmall.copyWith(
                            color: isDark
                                ? HotelManagerTheme.textSecondaryDark
                                : HotelManagerTheme.textSecondaryLight,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Property Type',
                          style: AppTextStyle.titleLarge.copyWith(
                            fontWeight: FontWeight.bold,
                            color: isDark
                                ? Colors.white
                                : HotelManagerTheme.textPrimaryLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Progress bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: LinearProgressIndicator(
                value: 0.2,
                backgroundColor: isDark
                    ? Colors.white.withValues(alpha:0.1)
                    : Colors.grey.shade200,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  Color(0xFF9D4EDD),
                ),
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    // Animated Icon
                    const PropertyTypeIcon(size: 140),
                    const SizedBox(height: 32),

                    // Description
                    Text(
                      'Select your property category',
                      style: AppTextStyle.bodyLarge.copyWith(
                        color: isDark
                            ? HotelManagerTheme.textSecondaryDark
                            : HotelManagerTheme.textSecondaryLight,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),

                    // Property Type Grid
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 1.3,
                          ),
                      itemCount: propertyTypes.length,
                      itemBuilder: (context, index) {
                        final type = propertyTypes[index];
                        final isSelected = selectedType == type['id'];
                        return _PropertyTypeCard(
                          name: type['name'] as String,
                          icon: type['icon'] as IconData,
                          isSelected: isSelected,
                          onTap: () {
                            setState(() {
                              selectedType = type['id'] as String;
                            });
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Continue Button
            Padding(
              padding: const EdgeInsets.all(24),
              child: PrimaryButton(
                onPressed: selectedType != null
                    ? () {
                        // TODO: Navigate to Step 2
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Selected: $selectedType')),
                        );
                      }
                    : () {},
                title: 'Continue',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PropertyTypeCard extends StatelessWidget {
  final String name;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _PropertyTypeCard({
    required this.name,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isDark
              ? HotelManagerTheme.cardBackgroundDark
              : HotelManagerTheme.backgroundLight,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            width: 2,
            color: isSelected
                ? const Color(0xFF9D4EDD)
                : (isDark
                      ? Colors.white.withValues(alpha:0.1)
                      : Colors.grey.shade200),
          ),
          gradient: isSelected ? HotelManagerTheme.brandGradient : null,
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: const Color(0xFF9D4EDD).withValues(alpha:0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ]
              : [],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: isSelected
                  ? Colors.white
                  : (isDark
                        ? HotelManagerTheme.textSecondaryDark
                        : HotelManagerTheme.textSecondaryLight),
            ),
            const SizedBox(height: 12),
            Text(
              name,
              style: AppTextStyle.bodyMedium.copyWith(
                color: isSelected
                    ? Colors.white
                    : (isDark
                          ? Colors.white
                          : HotelManagerTheme.textPrimaryLight),
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
