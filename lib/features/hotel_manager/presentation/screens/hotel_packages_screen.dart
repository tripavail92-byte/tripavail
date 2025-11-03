import 'package:flutter/material.dart';
import 'package:tripavail/utils/theme/constants/app_spacing.dart';
import 'package:tripavail/widgets/app_scaffold.dart';
import 'package:tripavail/widgets/primary_appbar.dart';
import 'package:tripavail/widgets/primary_button.dart';
import 'package:tripavail/utils/app_text_styles.dart';

class HotelPackagesScreen extends StatelessWidget {
  const HotelPackagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const PrimaryAppBar(
        title: 'Hotel Packages',
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
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      'Package ${index + 1}',
                      style: AppTextStyle.bodyLarge,
                    ),
                    subtitle: const Text(
                      '2 nights • Breakfast • Airport Pickup',
                    ),
                    trailing: const Icon(Icons.chevron_right),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
