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

import 'login_screen.dart';
import 'widgets/auth_header.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
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

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    if (value.length < 2) {
      return 'Name must be at least 2 characters';
    }
    return null;
  }

  void _handleSignup() {
    // Validate name
    final nameError = _validateName(nameController.text);
    if (nameError != null) {
      showErrorMessage(nameError);
      return;
    }

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

    // Validate confirm password
    final confirmPasswordError = _validateConfirmPassword(
      confirmPasswordController.text,
    );
    if (confirmPasswordError != null) {
      showErrorMessage(confirmPasswordError);
      return;
    }

    // Handle signup logic here
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
                Text(AppLabels.signUp, style: AppTextStyle.headlineMedium),
                SizedBox(height: height * 0.01),
                Text(
                  'Create your account to get started.',
                  style: AppTextStyle.bodyMedium.copyWith(
                    color: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.color?.withValues(alpha: 0.7),
                  ),
                ),

                PrimaryTextField(
                  controller: nameController,
                  label: AppLabels.fullName,
                  hintText: AppLabels.fullNameHint,
                  mandatory: true,
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  inputAction: TextInputAction.next,
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
                  inputAction: TextInputAction.next,
                ),

                PasswordTextField(
                  controller: confirmPasswordController,
                  label: AppLabels.confirmPassword,
                  hintText: 'Please confirm your password',
                  mandatory: true,
                  inputAction: TextInputAction.done,
                ),
                SizedBox(height: height * 0.03),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: width * 0.55,
                    child: PrimaryButton(
                      onPressed: _handleSignup,
                      title: AppLabels.signUp,
                      width: width * 0.55,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: AppTextStyle.bodyMedium,
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(() => const LoginScreen());
                      },
                      child: Text(
                        AppLabels.login,
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
                    title: "Sign up with Apple",
                    image:
                        "https://pngimg.com/uploads/apple_logo/apple_logo_PNG19666.png",
                    onTap: () async {},
                  ),
                if (Platform.isIOS) SizedBox(height: height * 0.02),

                ///
                SocialButtons(
                  title: "Sign up with Google",
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
