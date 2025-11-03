import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripavail/utils/app_labels.dart';
import 'package:tripavail/utils/app_text_styles.dart';
import 'package:tripavail/utils/theme/constants/app_constants.dart';
import 'package:tripavail/widgets/primary_button.dart';

import 'email_entry_screen.dart';
import 'widgets/auth_header.dart';

class AuthWelcomeScreen extends StatelessWidget {
  const AuthWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                            SizedBox(height: height * 0.02),
                            const AuthHeader(),
                            SizedBox(height: height * 0.05),
                            PrimaryButton(
                              onPressed: () {},
                              title: AppLabels.continueWithGoogle,
                              height: 52,
                              width: double.infinity,
                              backgroundColor: AppColors.white,
                              titleColor: AppColors.black,
                            ),
                            SizedBox(height: height * 0.015),
                            PrimaryButton(
                              onPressed: () {},
                              title: AppLabels.continueWithApple,
                              height: 52,
                              width: double.infinity,
                              backgroundColor: AppColors.black,
                              titleColor: AppColors.white,
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
                                color: AppColors.greyColor,
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
