import 'package:flutter/material.dart';
import 'package:tripavail/utils/app_labels.dart';
import 'package:tripavail/utils/app_text_styles.dart';
import 'package:tripavail/utils/theme/constants/app_constants.dart';
import 'package:tripavail/widgets/primary_button.dart';
import 'package:tripavail/widgets/primary_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return Scaffold(
      // appBar: PrimaryAppBar(
      //   title: 'Login Screen',
      //   showBackArrowIcon: false,
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.05),

              ///
              /// logo
              ///
              Center(
                child: Container(
                  width: width * 0.2,
                  height: height * 0.15,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      "Logo",
                      style: AppTextStyle.headlineSmall,
                    ),
                  ),
                ),
              ),

              Text(
                AppLabels.appName,
                style: AppTextStyle.headlineSmall,
              ),

              Text(
                AppLabels.appSubtitle,
                style: AppTextStyle.bodyMedium,
              ),

              SizedBox(height: height * 0.05),

              ///
              Text(
                AppLabels.welcomeToTripAvail,
                style: AppTextStyle.headlineSmall,
              ),

              ///
              SizedBox(height: height * 0.01),

              ///
              Text(
                AppLabels.welcomeToTripAvailDescription,
                style: AppTextStyle.bodyMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height * 0.01),
              PrimaryTextField(
                controller: TextEditingController(),
                label: 'Email',
                hintText: "Please enter your email",
                mandatory: true,
                keyboardType: TextInputType.emailAddress,
                inputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.none,
              ),
              PrimaryTextField(
                controller: TextEditingController(),
                label: 'Password',
                hintText: "Please enter your password",
                mandatory: true,
                keyboardType: TextInputType.emailAddress,
                inputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.none,
              ),

              ///
              SizedBox(height: height * 0.05),

              //
              PrimaryButton(
                onPressed: () {},
                title: 'Continue with Email',
                height: height * 0.06,
                width: width * 0.8,
              ),
              SizedBox(height: height * 0.01),

              ///
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width * 0.3,
                    height: 1,
                    color: AppColors.greyColor,
                  ),
                  Text(
                    "or",
                    style: AppTextStyle.bodyMedium,
                  ),
                  Container(
                    width: width * 0.3,
                    height: 1,
                    color: AppColors.greyColor,
                  ),
                ],
              ),

              SizedBox(height: height * 0.01),

              ///
              PrimaryButton(
                onPressed: () {},
                title: 'Continue with Google',
                height: height * 0.06,
                width: width * 0.8,
                backgroundColor: AppColors.white,
                titleColor: AppColors.black,
              ),
              SizedBox(height: height * 0.01),
              PrimaryButton(
                onPressed: () {},
                title: 'Continue with Apple',
                height: height * 0.06,
                width: width * 0.8,
                backgroundColor: AppColors.black,
                titleColor: AppColors.white,
              ),

              ///
              ///
              ///
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: AppTextStyle.bodyMedium,
                  ),

                  ///
                  ///
                  ///
                  ///
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Sign up",
                      style: AppTextStyle.titleSmall
                          .copyWith(
                            color: AppColors.primaryColor,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
