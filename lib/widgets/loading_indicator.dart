import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tripavail/utils/theme/constants/app_constants.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const SpinKitSpinningLines(
      color: AppColors.primaryColor,
      size: 50.0,
    );
  }
}
