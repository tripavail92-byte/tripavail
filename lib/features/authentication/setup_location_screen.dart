import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripavail/features/home/bottom_nav_bar.dart';
import 'package:tripavail/utils/app_labels.dart';
import 'package:tripavail/utils/app_text_styles.dart';
import 'package:tripavail/utils/location_service.dart';
import 'package:tripavail/utils/profile_storage.dart';
import 'package:tripavail/widgets/primary_button.dart';

class SetupLocationScreen extends StatefulWidget {
  const SetupLocationScreen({super.key});

  @override
  State<SetupLocationScreen> createState() => _SetupLocationScreenState();
}

class _SetupLocationScreenState extends State<SetupLocationScreen> {
  bool loading = false;
  String? error;

  Future<void> _capture() async {
    setState(() {
      loading = true;
      error = null;
    });
    final result = await LocationService.getCurrentLocation();
    if (result == null) {
      setState(() {
        loading = false;
        error =
            'Location permission is required. You can enable it in Settings.';
      });
      return;
    }
    await ProfileStorage.saveLocation(
      latitude: result.latitude,
      longitude: result.longitude,
      city: result.city,
      label: result.formatted,
    );
    if (!mounted) return;
    Get.offAll(() => const BottomNavBar());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 560),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                  child: SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(height: height * 0.02),
                            Text(
                              'Share your location',
                              style: AppTextStyle.headlineMedium,
                            ),
                            SizedBox(height: height * 0.01),
                            Text(
                              'We use your location to personalize pickup points, hotel distance, and trip suggestions.',
                              style: AppTextStyle.bodyMedium.copyWith(
                                color: theme.textTheme.bodyMedium?.color
                                    ?.withValues(alpha: 0.7),
                              ),
                            ),
                            SizedBox(height: height * 0.03),
                            if (error != null) ...[
                              Text(
                                error!,
                                style: AppTextStyle.bodySmall.copyWith(
                                  color: Colors.red,
                                ),
                              ),
                              SizedBox(height: height * 0.015),
                            ],
                            Expanded(child: Container()),
                            PrimaryButton(
                              onPressed: () {
                                _capture();
                              },
                              enabled: !loading,
                              title: loading
                                  ? 'Getting location...'
                                  : AppLabels.getStarted,
                              height: 52,
                              width: double.infinity,
                            ),
                            SizedBox(height: height * 0.015),
                            TextButton(
                              onPressed: () =>
                                  Get.offAll(() => const BottomNavBar()),
                              child: Text(AppLabels.skipForNow),
                            ),
                            SizedBox(height: height * 0.01),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
