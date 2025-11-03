import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tripavail/common/controllers/preference_controller.dart';
import 'package:tripavail/features/authentication/flow/auth_welcome_screen.dart';
import 'package:tripavail/utils/app_labels.dart';
import 'package:tripavail/utils/preference_labels.dart';
import 'package:tripavail/utils/theme/constants/app_constants.dart';
import 'package:tripavail/widgets/primary_button.dart';

import 'widgets/animated_suitcases.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  final int pageCount = 1; // Single onboarding screen

  final List<_OnboardPageData> pages = const [
    _OnboardPageData(
      title: AppLabels.onboardingDiscoverTitle,
      subtitle: AppLabels.onboardingDiscoverSubtitle,
      type: _OnboardType.suitcases,
    ),
  ];

  Future<void> _completeOnboarding() async {
    await Get.find<AppPreferencesController>().setBool(
      key: AppPreferenceLabels.hasOnboarded,
      value: true,
    );
    Get.offAll(() => const AuthWelcomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    final overlay = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: isLight ? Brightness.dark : Brightness.light,
      statusBarBrightness: isLight ? Brightness.light : Brightness.dark,
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlay,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: PageView.builder(
          controller: controller,
          itemCount: pages.length,
          itemBuilder: (context, index) {
            final data = pages[index];
            final screenSize = MediaQuery.of(context).size;
            final width = screenSize.width;
            final height = screenSize.height;
            return Container(
              decoration: _getBackgroundDecoration(context, data.type),
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: (width * 0.08).clamp(16.0, 28.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: _completeOnboarding,
                          child: Text(
                            'Skip',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(child: _buildIllustration(data, index)),
                            SizedBox(height: height * 0.04),
                            Text(
                              data.title,
                              style: Theme.of(context).textTheme.headlineMedium
                                  ?.copyWith(fontWeight: FontWeight.w900),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: height * 0.015),
                            Text(
                              data.subtitle,
                              style: Theme.of(context).textTheme.bodyLarge,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.03),
                      Center(
                        child: SmoothPageIndicator(
                          controller: controller,
                          count: pages.length,
                          effect: ExpandingDotsEffect(
                            dotHeight: 8,
                            dotWidth: 8,
                            activeDotColor: AppColors.primaryColor,
                            dotColor: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .color!
                                .withValues(alpha: 0.4),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.03),
                      PrimaryButton(
                        onPressed: () async {
                          final next = controller.page!.round() + 1;
                          if (next < pages.length) {
                            controller.animateToPage(
                              next,
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.easeOut,
                            );
                          } else {
                            await _completeOnboarding();
                          }
                        },
                        title: 'Next',
                        height: 52,
                        width: double.infinity,
                      ),
                      SizedBox(height: height * 0.02),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _OnboardPageData {
  final String title;
  final String subtitle;
  final _OnboardType type;
  const _OnboardPageData({
    required this.title,
    required this.subtitle,
    required this.type,
  });
}

enum _OnboardType { suitcases }

Widget _buildIllustration(_OnboardPageData data, int index) {
  return const AnimatedTravelerIllustration();
}

BoxDecoration _getBackgroundDecoration(
  BuildContext context,
  _OnboardType type,
) {
  return BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor);
}
