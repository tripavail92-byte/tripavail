import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripavail/utils/app_labels.dart';
import 'package:tripavail/utils/app_text_styles.dart';
import 'package:tripavail/widgets/primary_button.dart';
import 'package:tripavail/widgets/primary_text_field.dart';

import 'otp_screen.dart';

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
                            Align(
                              alignment: Alignment.centerLeft,
                              child: IconButton(
                                onPressed: () => Get.back(),
                                icon: const Icon(Icons.arrow_back),
                              ),
                            ),
                            SizedBox(height: height * 0.02),
                            Text(
                              AppLabels.whatsYourEmailTitle,
                              style: AppTextStyle.headlineMedium,
                            ),
                            SizedBox(height: height * 0.01),
                            Text(
                              AppLabels.emailCodeSubtitle,
                              style: AppTextStyle.bodyMedium,
                            ),
                            SizedBox(height: height * 0.03),
                            PrimaryTextField(
                              controller: emailController,
                              label: AppLabels.email,
                              hintText: AppLabels.emailHint,
                              mandatory: true,
                              keyboardType: TextInputType.emailAddress,
                              textCapitalization: TextCapitalization.none,
                              inputAction: TextInputAction.done,
                            ),
                            Expanded(child: Container()),
                            PrimaryButton(
                              onPressed: () {
                                Get.to(
                                  () => OtpVerificationScreen(
                                    email: emailController.text.trim(),
                                  ),
                                );
                              },
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
