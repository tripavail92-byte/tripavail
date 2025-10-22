import 'package:flutter/material.dart';
import 'package:tripavail/utils/app_labels.dart';
import 'package:tripavail/utils/app_text_styles.dart';
import 'package:tripavail/utils/theme/constants/app_constants.dart';
import 'package:tripavail/widgets/primary_button.dart';
import 'package:tripavail/widgets/primary_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nameController =
      TextEditingController();
  final TextEditingController _emailController =
      TextEditingController();
  final TextEditingController _passwordController =
      TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return Scaffold(
      // appBar: PrimaryAppBar(
      //   title: 'Sign Up',
      //   showBackArrowIcon: true,
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
                      AppLabels.logo,
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
                AppLabels.createYourAccount,
                style: AppTextStyle.headlineSmall,
              ),

              ///
              SizedBox(height: height * 0.01),

              ///
              Text(
                AppLabels.createAccountDescription,
                style: AppTextStyle.bodyMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height * 0.03),

              PrimaryTextField(
                controller: _nameController,
                label: AppLabels.fullName,
                hintText: AppLabels.fullNameHint,
                mandatory: true,
                keyboardType: TextInputType.name,
                inputAction: TextInputAction.next,
                textCapitalization:
                    TextCapitalization.words,
              ),

              PrimaryTextField(
                controller: _emailController,
                label: AppLabels.email,
                hintText: AppLabels.emailHint,
                mandatory: true,
                keyboardType: TextInputType.emailAddress,
                inputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.none,
              ),

              PasswordTextField(
                controller: _passwordController,
                label: AppLabels.password,
                hintText: AppLabels.passwordHint,
                mandatory: true,
                inputAction: TextInputAction.next,
              ),

              PasswordTextField(
                controller: _confirmPasswordController,
                label: AppLabels.confirmPassword,
                hintText: AppLabels.confirmPasswordHint,
                mandatory: true,
                inputAction: TextInputAction.done,
              ),

              ///
              SizedBox(height: height * 0.05),

              //
              PrimaryButton(
                onPressed: () {
                  // TODO: Implement signup logic
                },
                title: AppLabels.createAccount,
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
                    AppLabels.or,
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
                onPressed: () {
                  // TODO: Implement Google signup
                },
                title: AppLabels.continueWithGoogle,
                height: height * 0.06,
                width: width * 0.8,
                backgroundColor: AppColors.white,
                titleColor: AppColors.black,
              ),
              SizedBox(height: height * 0.01),
              PrimaryButton(
                onPressed: () {
                  // TODO: Implement Apple signup
                },
                title: AppLabels.continueWithApple,
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
                    AppLabels.alreadyHaveAccount,
                    style: AppTextStyle.bodyMedium,
                  ),

                  ///
                  ///
                  ///
                  ///
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      AppLabels.signIn,
                      style: AppTextStyle.titleSmall
                          .copyWith(
                            color: AppColors.primaryColor,
                          ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
