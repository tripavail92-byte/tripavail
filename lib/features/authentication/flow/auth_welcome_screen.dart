import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripavail/utils/app_labels.dart';
import 'package:tripavail/utils/app_text_styles.dart';
import 'package:tripavail/utils/theme/constants/app_constants.dart';
import 'package:tripavail/widgets/primary_button.dart';
import 'package:tripavail/utils/theme/constants/app_spacing.dart';
import 'package:tripavail/modules/auth/auth_routes.dart';

import 'widgets/auth_scaffold.dart';
import 'widgets/auth_header.dart';

class AuthWelcomeScreen extends StatelessWidget {
  const AuthWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      bottom: Text(
        AppLabels.termsAndPrivacy,
        style: AppTextStyle.bodySmall.copyWith(color: AppColors.greyColor),
        textAlign: TextAlign.center,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppSpacing.v32(),
          const AuthHeader(),
          AppSpacing.v40(),
          PrimaryButton(
            onPressed: () {},
            title: AppLabels.continueWithGoogle,
            height: 52,
            width: double.infinity,
            backgroundColor: AppColors.white,
            titleColor: AppColors.black,
          ),
          AppSpacing.v12(),
          PrimaryButton(
            onPressed: () {},
            title: AppLabels.continueWithApple,
            height: 52,
            width: double.infinity,
            backgroundColor: AppColors.black,
            titleColor: AppColors.white,
          ),
          AppSpacing.v12(),
          PrimaryButton(
            onPressed: () {
              Get.toNamed(AuthRoutes.emailEntry);
            },
            title: AppLabels.continueWithEmail,
            height: 52,
            width: double.infinity,
          ),
          AppSpacing.v16(),
        ],
      ),
    );
  }
}
