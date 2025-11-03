import 'package:flutter/material.dart';
import 'package:tripavail/utils/theme/constants/app_spacing.dart';
import 'package:tripavail/widgets/app_scaffold.dart';
import 'package:tripavail/widgets/primary_appbar.dart';
import 'package:tripavail/utils/app_text_styles.dart';

class TourBookingsScreen extends StatelessWidget {
  const TourBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const PrimaryAppBar(
        title: 'Bookings (Trips)',
        showBackArrowIcon: true,
      ),
      child: Padding(
        padding: AppSpacing.horizontalPadding(context),
        child: ListView.separated(
          itemCount: 8,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (context, index) => ListTile(
            title: Text(
              'Booking #${1200 + index}',
              style: AppTextStyle.bodyLarge,
            ),
            subtitle: const Text('Traveler: Jane Doe • 2 guests'),
            trailing: const Icon(Icons.chevron_right),
          ),
        ),
      ),
    );
  }
}
