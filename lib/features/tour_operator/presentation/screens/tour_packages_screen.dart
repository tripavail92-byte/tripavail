import 'package:flutter/material.dart';
import 'package:tripavail/utils/theme/constants/app_spacing.dart';
import 'package:tripavail/widgets/app_scaffold.dart';
import 'package:tripavail/widgets/primary_appbar.dart';
import 'package:tripavail/widgets/primary_button.dart';
import 'package:tripavail/utils/app_text_styles.dart';

class TourPackagesScreen extends StatelessWidget {
  const TourPackagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const PrimaryAppBar(
        title: 'Trip Packages',
        showBackArrowIcon: true,
      ),
      child: Padding(
        padding: AppSpacing.horizontalPadding(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PrimaryButton(onPressed: () {}, title: 'Create Package'),
            AppSpacing.v16(),
            Expanded(
              child: ListView.separated(
                itemCount: 6,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                    'Adventure Package ${index + 1}',
                    style: AppTextStyle.bodyLarge,
                  ),
                  subtitle: const Text('3 days • 2 activities per day'),
                  trailing: const Icon(Icons.chevron_right),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
