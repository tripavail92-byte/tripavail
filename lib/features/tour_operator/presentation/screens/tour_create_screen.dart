import 'package:flutter/material.dart';
import 'package:tripavail/utils/theme/constants/app_spacing.dart';
import 'package:tripavail/widgets/app_scaffold.dart';
import 'package:tripavail/widgets/primary_appbar.dart';
import 'package:tripavail/widgets/primary_button.dart';
import 'package:tripavail/widgets/primary_text_field.dart';

class TourCreateScreen extends StatelessWidget {
  const TourCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final name = TextEditingController();
    final days = TextEditingController();
    return AppScaffold(
      appBar: const PrimaryAppBar(
        title: 'Create New Tour',
        showBackArrowIcon: true,
      ),
      child: Padding(
        padding: AppSpacing.horizontalPadding(context),
        child: Column(
          children: [
            PrimaryTextField(controller: name, label: 'Tour Name'),
            AppSpacing.v12(),
            PrimaryTextField(
              controller: days,
              label: 'No. of Days',
              keyboardType: TextInputType.number,
            ),
            AppSpacing.v24(),
            PrimaryButton(onPressed: () {}, title: 'Save Draft'),
          ],
        ),
      ),
    );
  }
}
