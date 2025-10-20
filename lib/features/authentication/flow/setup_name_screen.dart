import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripavail/utils/app_labels.dart';
import 'package:tripavail/utils/app_text_styles.dart';
import 'package:tripavail/widgets/primary_button.dart';
import 'package:tripavail/widgets/primary_text_field.dart';
import 'package:tripavail/utils/theme/constants/app_spacing.dart';
import 'widgets/auth_scaffold.dart';
import 'package:tripavail/features/authentication/flow/setup_location_screen.dart';

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
    return AuthScaffold(
      showBack: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLabels.whatsYourNameTitle,
            style: AppTextStyle.headlineMedium,
          ),
          AppSpacing.v8(),
          Text(
            AppLabels.personalizeExperienceSubtitle,
            style: AppTextStyle.bodyMedium,
          ),
          AppSpacing.v24(),
          PrimaryTextField(
            controller: nameController,
            label: AppLabels.fullName,
            hintText: AppLabels.fullNameHint,
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
            inputAction: TextInputAction.done,
          ),
          const Spacer(),
          PrimaryButton(
            onPressed: () {
              // Save name, then capture location
              Get.offAll(() => const SetupLocationScreen());
            },
            title: AppLabels.nextAction,
            height: 52,
            width: double.infinity,
          ),
          AppSpacing.v12(),
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
                    ?.withOpacity(0.7),
              ),
            ),
          ),
          AppSpacing.v8(),
        ],
      ),
    );
  }
}
