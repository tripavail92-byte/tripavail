import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripavail/utils/app_labels.dart';
import 'package:tripavail/utils/app_text_styles.dart';
import 'package:tripavail/widgets/otp_input.dart';
import 'package:tripavail/widgets/primary_button.dart';

import 'setup_name_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String email;
  const OtpVerificationScreen({
    super.key,
    required this.email,
  });

  @override
  State<OtpVerificationScreen> createState() =>
      _OtpVerificationScreenState();
}

class _OtpVerificationScreenState
    extends State<OtpVerificationScreen> {
  String otp = '';
  bool isComplete = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;
    final width = screenSize.width;
    final height = screenSize.height;
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 560,
                ),
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
                            Align(
                              alignment: Alignment.centerLeft,
                              child: IconButton(
                                onPressed: () => Get.back(),
                                icon: const Icon(Icons.arrow_back),
                              ),
                            ),
                            SizedBox(height: height * 0.02),
                            Text(
                              AppLabels.enterSixDigitCodeTitle,
                              style: AppTextStyle.headlineMedium,
                            ),
                            SizedBox(height: height * 0.01),
                            Text(
                              AppLabels.otpSentTo(widget.email),
                              style: AppTextStyle.bodyMedium.copyWith(
                                color: theme.textTheme.bodyMedium?.color
                                    ?.withValues(alpha: 0.7),
                              ),
                            ),
                            SizedBox(height: height * 0.04),
                            OtpInput(
                              length: 6,
                              onChanged: (value) {
                                setState(() {
                                  otp = value;
                                  isComplete = value.length == 6;
                                });
                              },
                              onCompleted: (value) {
                                setState(() {
                                  otp = value;
                                  isComplete = true;
                                });
                              },
                            ),
                            SizedBox(height: height * 0.03),
                            Center(
                              child: TextButton(
                                onPressed: () {
                                  // Resend OTP logic
                                },
                                child: Text(
                                  'Didn\'t receive code? Resend',
                                  style: AppTextStyle.bodyMedium.copyWith(
                                    color: theme.primaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(child: Container()),
                            PrimaryButton(
                              onPressed: isComplete
                                  ? () {
                                      Get.offAll(
                                        () => const SetupNameScreen(),
                                      );
                                    }
                                  : () {},
                              enabled: isComplete,
                              title: AppLabels.continueAction,
                              height: 52,
                              width: double.infinity,
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
