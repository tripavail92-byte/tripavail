import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripavail/utils/theme/constants/app_spacing.dart';
import 'package:tripavail/widgets/app_scaffold.dart';

class AuthScaffold extends StatelessWidget {
  final Widget child;
  final Widget? bottom;
  final bool showBack;

  const AuthScaffold({
    super.key,
    required this.child,
    this.bottom,
    this.showBack = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: AppSpacing.contentMaxWidth,
              ),
              child: Padding(
                padding: AppSpacing.horizontalPadding(
                  context,
                ),
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.stretch,
                        children: [
                          AppSpacing.v16(),
                          if (showBack)
                            Align(
                              alignment:
                                  Alignment.centerLeft,
                              child: IconButton(
                                onPressed: () => Get.back(),
                                icon: const Icon(
                                  Icons.arrow_back,
                                ),
                              ),
                            ),
                          if (showBack) AppSpacing.v16(),
                          Expanded(child: child),
                          if (bottom != null)
                            AppSpacing.v16(),
                          if (bottom != null) bottom!,
                          AppSpacing.v16(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
