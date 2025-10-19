import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripavail/utils/app_text_styles.dart';
import 'package:tripavail/utils/theme/constants/app_constants.dart';

import '../authentication/login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAll(() => const LoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: height * 0.1),
          Center(
            child: Container(
              width: width * 0.2,
              height: height * 0.2,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.white,
                  width: 2,
                ),
              ),
              child: Center(
                child: Text(
                  "TA",
                  style: AppTextStyle.headlineSmall,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
