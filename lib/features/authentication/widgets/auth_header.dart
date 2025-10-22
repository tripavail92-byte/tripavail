import 'package:flutter/material.dart';
import 'package:tripavail/utils/app_labels.dart';
import 'package:tripavail/utils/app_text_styles.dart';
import 'package:tripavail/utils/theme/constants/app_constants.dart';
import 'package:tripavail/utils/theme/constants/app_spacing.dart';

class AuthHeader extends StatelessWidget {
  final bool showSubtitle;

  const AuthHeader({super.key, this.showSubtitle = true});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double width = size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            width: width * 0.22,
            height: width * 0.22,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppRoleGradients.traveller,
              boxShadow: [
                AppTextStyle.boxShadow,
              ],
            ),
            child: Center(
              child: Text(
                'TA',
                style: AppTextStyle.headlineMedium.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),
        AppSpacing.v16(),
        Text(AppLabels.appName, style: AppTextStyle.headlineSmall),
        if (showSubtitle) AppSpacing.v12(),
        if (showSubtitle)
          Text(
            AppLabels.appSubtitle,
            style: AppTextStyle.bodyMedium,
            textAlign: TextAlign.center,
          ),
      ],
    );
  }
}


