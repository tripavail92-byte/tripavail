import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripavail/modules/traveler/traveler_routes.dart';
import 'package:tripavail/utils/app_text_styles.dart';
import 'package:tripavail/utils/app_labels.dart';
import 'package:tripavail/utils/theme/constants/app_spacing.dart';
import 'package:tripavail/widgets/primary_button.dart';
import 'package:tripavail/utils/location_service.dart';
import 'package:tripavail/utils/profile_storage.dart';

import 'widgets/auth_scaffold.dart';

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
    Get.offAllNamed(TravelerRoutes.main);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AuthScaffold(
      showBack: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Share your location', style: AppTextStyle.headlineMedium),
          AppSpacing.v8(),
          Text(
            'We use your location to personalize pickup points, hotel distance, and trip suggestions.',
            style: AppTextStyle.bodyMedium.copyWith(
              color: theme.textTheme.bodyMedium?.color?.withValues(alpha:0.7),
            ),
          ),
          AppSpacing.v24(),
          if (error != null) ...[
            Text(
              error!,
              style: AppTextStyle.bodySmall.copyWith(color: Colors.red),
            ),
            AppSpacing.v12(),
          ],
          const Spacer(),
          PrimaryButton(
            onPressed: () {
              _capture();
            },
            enabled: !loading,
            title: loading ? 'Getting location...' : AppLabels.getStarted,
            height: 52,
            width: double.infinity,
          ),
          AppSpacing.v12(),
          TextButton(
            onPressed: () => Get.offAllNamed(TravelerRoutes.main),
            child: Text(AppLabels.skipForNow),
          ),
          AppSpacing.v8(),
        ],
      ),
    );
  }
}
