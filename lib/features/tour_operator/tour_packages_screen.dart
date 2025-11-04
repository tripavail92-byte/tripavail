import 'package:flutter/material.dart';
import 'package:tripavail/widgets/primary_appbar.dart';
import 'package:tripavail/widgets/primary_button.dart';
import 'package:tripavail/utils/app_text_styles.dart';

class TourPackagesScreen extends StatelessWidget {
  const TourPackagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final width = screenSize.width;
    final height = screenSize.height;
    return Scaffold(
      appBar: const PrimaryAppBar(
        title: 'Trip Packages',
        showBackArrowIcon: true,
      ),
      body: SafeArea(
        child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: (width * 0.08).clamp(16.0, 28.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PrimaryButton(onPressed: () {}, title: 'Create Package'),
            SizedBox(height: height * 0.02),
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
      ),
    );
  }
}
