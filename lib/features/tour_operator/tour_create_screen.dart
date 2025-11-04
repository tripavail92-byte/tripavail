import 'package:flutter/material.dart';
import 'package:tripavail/widgets/primary_appbar.dart';
import 'package:tripavail/widgets/primary_button.dart';
import 'package:tripavail/widgets/primary_text_field.dart';

class TourCreateScreen extends StatelessWidget {
  const TourCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final name = TextEditingController();
    final days = TextEditingController();
    final size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;
    return Scaffold(
      appBar: const PrimaryAppBar(
        title: 'Create New Tour',
        showBackArrowIcon: true,
      ),
      body: SafeArea(
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.08),
        child: Column(
          children: [
            PrimaryTextField(controller: name, label: 'Tour Name'),
            SizedBox(height: height * 0.015),
            PrimaryTextField(
              controller: days,
              label: 'No. of Days',
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: height * 0.03),
            PrimaryButton(onPressed: () {}, title: 'Save Draft'),
          ],
        ),
        ),
      ),
    );
  }
}
