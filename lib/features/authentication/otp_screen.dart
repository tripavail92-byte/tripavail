import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripavail/utils/app_labels.dart';
import 'package:tripavail/utils/app_text_styles.dart';
import 'package:tripavail/utils/theme/constants/app_spacing.dart';
import 'package:tripavail/widgets/otp_input.dart';
import 'package:tripavail/widgets/primary_button.dart';

import 'setup_name_screen.dart';
import 'widgets/auth_scaffold.dart';

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

    return AuthScaffold(
      showBack: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLabels.enterSixDigitCodeTitle,
            style: AppTextStyle.headlineMedium,
          ),
          AppSpacing.v8(),
          Text(
            AppLabels.otpSentTo(widget.email),
            style: AppTextStyle.bodyMedium.copyWith(
              color: theme.textTheme.bodyMedium?.color
                  ?.withValues(alpha: 0.7),
            ),
          ),
          AppSpacing.v32(),
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
          AppSpacing.v24(),
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
          const Spacer(),
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
          AppSpacing.v16(),
        ],
      ),
    );
  }
}
