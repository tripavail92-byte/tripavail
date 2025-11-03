import 'package:flutter/material.dart';
import 'package:tripavail/utils/theme/constants/app_spacing.dart';
import 'package:tripavail/widgets/app_scaffold.dart';
import 'package:tripavail/widgets/primary_appbar.dart';

class TourCalendarScreen extends StatelessWidget {
  const TourCalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const PrimaryAppBar(
        title: 'Calendar & Availability',
        showBackArrowIcon: true,
      ),
      child: Padding(
        padding: AppSpacing.horizontalPadding(context),
        child: const Center(child: Text('Calendar coming soon')),
      ),
    );
  }
}
