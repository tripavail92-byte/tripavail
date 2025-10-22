import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripavail/features/authentication/email_entry_screen.dart';
import 'package:tripavail/utils/app_labels.dart';
import 'package:tripavail/utils/app_text_styles.dart';
import 'package:tripavail/utils/theme/constants/app_constants.dart';
import 'package:tripavail/utils/theme/constants/app_spacing.dart';
import 'package:tripavail/widgets/primary_button.dart';

import 'widgets/auth_header.dart';
import 'widgets/auth_scaffold.dart';

class AuthWelcomeScreen extends StatelessWidget {
  const AuthWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return AuthScaffold(
      bottom: Text(
        AppLabels.termsAndPrivacy,
        style: AppTextStyle.bodySmall.copyWith(
          color: theme.textTheme.bodySmall?.color
              ?.withValues(alpha: 0.6),
        ),
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
            backgroundColor: isDark
                ? const Color(0xFF3C3C3C)
                : AppColors.white,
            titleColor:
                theme.textTheme.bodyLarge?.color ??
                AppColors.black,
            borderColor: isDark
                ? const Color(0xFF555555)
                : const Color(0xFFDDDDDD),
            icon: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFFDDDDDD),
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  'G',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF4285F4),
                  ),
                ),
              ),
            ),
          ),
          AppSpacing.v12(),
          PrimaryButton(
            onPressed: () {},
            title: AppLabels.continueWithApple,
            height: 52,
            width: double.infinity,
            backgroundColor: isDark
                ? const Color(0xFF1C1C1E)
                : AppColors.black,
            titleColor: isDark
                ? AppColors.white
                : AppColors.white,
            borderColor: isDark
                ? const Color(0xFF333333)
                : AppColors.black,
            icon: Icon(
              Icons.apple,
              color: AppColors.white,
              size: 20,
            ),
          ),
          AppSpacing.v12(),
          PrimaryButton(
            onPressed: () {
              Get.to(() => const EmailEntryScreen());
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
