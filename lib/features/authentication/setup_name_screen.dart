import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripavail/features/authentication/setup_location_screen.dart';
import 'package:tripavail/utils/app_labels.dart';
import 'package:tripavail/utils/app_text_styles.dart';
import 'package:tripavail/widgets/primary_button.dart';
import 'package:tripavail/widgets/primary_text_field.dart';


class SetupNameScreen extends StatefulWidget {
  const SetupNameScreen({super.key});

  @override
  State<SetupNameScreen> createState() =>
      _SetupNameScreenState();
}

class _SetupNameScreenState extends State<SetupNameScreen> {
  final TextEditingController nameController =
      TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
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
                            Text(
                              AppLabels.whatsYourNameTitle,
                              style: AppTextStyle.headlineMedium,
                            ),
                            SizedBox(height: height * 0.01),
                            Text(
                              AppLabels.personalizeExperienceSubtitle,
                              style: AppTextStyle.bodyMedium,
                            ),
                            SizedBox(height: height * 0.03),
                            PrimaryTextField(
                              controller: nameController,
                              label: AppLabels.fullName,
                              hintText: AppLabels.fullNameHint,
                              keyboardType: TextInputType.name,
                              textCapitalization: TextCapitalization.words,
                              inputAction: TextInputAction.done,
                            ),
                            Expanded(child: Container()),
                            PrimaryButton(
                              onPressed: () {
                                // Save name, then capture location
                                Get.offAll(() => const SetupLocationScreen());
                              },
                              title: AppLabels.nextAction,
                              height: 52,
                              width: double.infinity,
                            ),
                            SizedBox(height: height * 0.015),
                            TextButton(
                              onPressed: () {
                                // Skip name, still ask for location next
                                Get.offAll(() => const SetupLocationScreen());
                              },
                              child: Text(
                                AppLabels.skipForNow,
                                style: AppTextStyle.bodyMedium.copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.color
                                      ?.withValues(alpha: 0.7),
                                ),
                              ),
                            ),
                            SizedBox(height: height * 0.01),
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
