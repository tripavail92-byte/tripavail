import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  final bool useSafeArea;
  final Color? backgroundColor;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final SystemUiOverlayStyle? overlayStyle;

  const AppScaffold({
    super.key,
    required this.child,
    this.useSafeArea = true,
    this.backgroundColor,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.overlayStyle,
  });

  @override
  Widget build(BuildContext context) {
    final isLight =
        Theme.of(context).brightness == Brightness.light;
    final resolvedOverlay =
        overlayStyle ??
        SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: isLight
              ? Brightness.dark
              : Brightness.light,
          statusBarBrightness: isLight
              ? Brightness.light
              : Brightness.dark,
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: isLight
              ? Brightness.dark
              : Brightness.light,
        );

    final scaffold = Scaffold(
      backgroundColor:
          backgroundColor ??
          Theme.of(context).scaffoldBackgroundColor,
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      body: useSafeArea ? SafeArea(child: child) : child,
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: resolvedOverlay,
      child: scaffold,
    );
  }
}
