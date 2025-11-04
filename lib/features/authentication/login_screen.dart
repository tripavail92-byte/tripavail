import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripavail/features/authentication/widgets/social_buttons.dart';
import 'package:tripavail/features/home/bottom_nav_bar.dart';
import 'package:tripavail/utils/app_labels.dart';
import 'package:tripavail/utils/app_text_styles.dart';
import 'package:tripavail/utils/show_snackbar.dart';
import 'package:tripavail/widgets/primary_button.dart';
import 'package:tripavail/widgets/primary_text_field.dart';

import 'signup_screen.dart';
import 'widgets/auth_header.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!value.contains('@')) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  void _handleLogin() {
    // Validate email
    final emailError = _validateEmail(emailController.text);
    if (emailError != null) {
      showErrorMessage(emailError);
      return;
    }

    // Validate password
    final passwordError = _validatePassword(passwordController.text);
    if (passwordError != null) {
      showErrorMessage(passwordError);
      return;
    }

    // Handle login logic here
    Get.offAll(() => const BottomNavBar());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: width * 0.08),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: height * 0.02),
                const AuthHeader(),
                SizedBox(height: height * 0.05),
                Text(AppLabels.login, style: AppTextStyle.headlineMedium),
                SizedBox(height: height * 0.01),
                Text(
                  'Welcome back! Please login to continue.',
                  style: AppTextStyle.bodyMedium.copyWith(
                    color: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.color?.withValues(alpha: 0.7),
                  ),
                ),

                PrimaryTextField(
                  controller: emailController,
                  label: AppLabels.email,
                  hintText: AppLabels.emailHint,
                  mandatory: true,
                  keyboardType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,
                  inputAction: TextInputAction.next,
                ),
                PasswordTextField(
                  controller: passwordController,
                  label: AppLabels.password,
                  hintText: AppLabels.passwordHint,
                  mandatory: true,
                  inputAction: TextInputAction.done,
                ),
                SizedBox(height: height * 0.02),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Handle forgot password
                    },
                    child: Text(
                      'Forgot Password?',
                      style: AppTextStyle.bodyMedium.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.03),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: width * 0.55,
                    child: PrimaryButton(
                      onPressed: _handleLogin,
                      title: AppLabels.login,
                      width: width * 0.55,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      AppLabels.dontHaveAccount,
                      style: AppTextStyle.bodyMedium,
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(() => const SignupScreen());
                      },
                      child: Text(
                        AppLabels.signUp,
                        style: AppTextStyle.bodyMedium.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.02),

                ///
                ///
                if (Platform.isIOS)
                  SocialButtons(
                    title: "Sign in with Apple",
                    image:
                        "https://pngimg.com/uploads/apple_logo/apple_logo_PNG19666.png",
                    onTap: () async {},
                  ),
                if (Platform.isIOS) SizedBox(height: height * 0.02),

                ///
                SocialButtons(
                  title: "Sign in with Google",
                  image: "http://pngimg.com/uploads/google/google_PNG19635.png",
                  onTap: () async {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
