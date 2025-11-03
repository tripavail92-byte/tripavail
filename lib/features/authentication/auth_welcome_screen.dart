import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripavail/features/authentication/email_entry_screen.dart';
import 'package:tripavail/utils/app_labels.dart';
import 'package:tripavail/utils/app_text_styles.dart';
import 'package:tripavail/utils/theme/constants/app_constants.dart';
import 'package:tripavail/widgets/primary_button.dart';

import 'widgets/auth_header.dart';

class AuthWelcomeScreen extends StatelessWidget {
  const AuthWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final screenSize = MediaQuery.of(context).size;
    final width = screenSize.width;
    final height = screenSize.height;
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 560),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: (width * 0.08).clamp(16.0, 28.0),
                  ),
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
                            SizedBox(height: height * 0.02),
                            const AuthHeader(),
                            SizedBox(height: height * 0.05),
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
                            SizedBox(height: height * 0.015),
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
                            SizedBox(height: height * 0.015),
                            PrimaryButton(
                              onPressed: () {
                                Get.to(() => const EmailEntryScreen());
                              },
                              title: AppLabels.continueWithEmail,
                              height: 52,
                              width: double.infinity,
                            ),
                            SizedBox(height: height * 0.02),
                            Text(
                              AppLabels.termsAndPrivacy,
                              style: AppTextStyle.bodySmall.copyWith(
                                color: theme.textTheme.bodySmall?.color
                                    ?.withValues(alpha: 0.6),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: height * 0.02),
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
