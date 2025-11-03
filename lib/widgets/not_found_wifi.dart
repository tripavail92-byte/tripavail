import 'package:flutter/material.dart';
import 'package:tripavail/utils/app_text_styles.dart';
import 'package:tripavail/utils/show_snackbar.dart';

class NotFoundWifiPage extends StatelessWidget {
  const NotFoundWifiPage({super.key});

  Future<void> checkInternetConnection() async {
    showErrorMessage("Please check your connection and try again.");
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return PopScope(
      canPop: false,
      onPopInvoked: ((didPop) {
        if (didPop) {
          return;
        }
      }),
      child: Scaffold(
        body: SizedBox(
          height: height,
          width: width,
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
