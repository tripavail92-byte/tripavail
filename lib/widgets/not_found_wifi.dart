import 'package:flutter/material.dart';
import 'package:tripavail/utils/app_text_styles.dart';

class NotFoundWifiPage extends StatelessWidget {
  const NotFoundWifiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("No Internet", style: AppTextStyle.bodyMedium),
              SizedBox(height: height * 0.08),
            ],
          ),
        ),
      ),
    );
  }
}
