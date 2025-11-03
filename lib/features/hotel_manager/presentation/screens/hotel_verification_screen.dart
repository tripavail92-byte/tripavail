import 'package:flutter/material.dart';
import 'package:tripavail/utils/theme/constants/app_spacing.dart';
import 'package:tripavail/widgets/app_scaffold.dart';
import 'package:tripavail/widgets/primary_appbar.dart';
import 'package:tripavail/utils/app_text_styles.dart';

class HotelVerificationScreen extends StatelessWidget {
  const HotelVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const PrimaryAppBar(
        title: 'Verification',
        showBackArrowIcon: true,
      ),
      child: Padding(
        padding: AppSpacing.horizontalPadding(context),
        child: ListView(
          children: [
            _StepTile(title: 'Business Registration', status: 'Uploaded'),
            _StepTile(title: 'Tax Certificate', status: 'Pending'),
            _StepTile(title: 'Property Ownership', status: 'Verified'),
            _StepTile(title: 'Bank Info', status: 'Pending'),
          ],
        ),
      ),
    );
  }
}

class _StepTile extends StatelessWidget {
  final String title;
  final String status;
  const _StepTile({required this.title, required this.status});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: AppTextStyle.bodyLarge),
      subtitle: Text(status),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
