import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripavail/utils/app_labels.dart';
import 'package:tripavail/utils/app_text_styles.dart';
import 'package:tripavail/widgets/primary_button.dart';
import 'package:tripavail/widgets/primary_text_field.dart';
import 'package:tripavail/utils/theme/constants/app_spacing.dart';
import 'package:tripavail/modules/auth/auth_routes.dart';

import 'widgets/auth_scaffold.dart';

class EmailEntryScreen extends StatefulWidget {
  const EmailEntryScreen({super.key});

  @override
  State<EmailEntryScreen> createState() => _EmailEntryScreenState();
}

class _EmailEntryScreenState extends State<EmailEntryScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      showBack: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLabels.whatsYourEmailTitle,
            style: AppTextStyle.headlineMedium,
          ),
          AppSpacing.v8(),
          Text(AppLabels.emailCodeSubtitle, style: AppTextStyle.bodyMedium),
          AppSpacing.v24(),
          PrimaryTextField(
            controller: emailController,
            label: AppLabels.email,
            hintText: AppLabels.emailHint,
            mandatory: true,
            keyboardType: TextInputType.emailAddress,
            textCapitalization: TextCapitalization.none,
            inputAction: TextInputAction.done,
          ),
          const Spacer(),
          PrimaryButton(
            onPressed: () {
              Get.toNamed(
                AuthRoutes.verifyOtp,
                arguments: emailController.text.trim(),
              );
            },
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
