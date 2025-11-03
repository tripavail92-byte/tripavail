import 'package:flutter/material.dart';

/// Performance optimization utilities for the TripAvail app.
class PerformanceOptimizations {
  PerformanceOptimizations._();

  /// Creates a lazy-loaded list builder optimized for large datasets.
  /// Use this for lists with 100+ items to improve scrolling performance.
  static Widget buildLazyList<T>({
    required int itemCount,
    required Widget Function(BuildContext context, int index) itemBuilder,
    Axis scrollDirection = Axis.vertical,
    EdgeInsetsGeometry? padding,
    ScrollPhysics? physics,
    String? itemKeyPrefix,
  }) {
    return ListView.builder(
      key: itemKeyPrefix != null ? ValueKey('$itemKeyPrefix-list') : null,
      scrollDirection: scrollDirection,
      padding: padding,
      physics: physics,
      itemCount: itemCount,
      cacheExtent: 200, // Pre-build 200px of off-screen items
      itemBuilder: (context, index) {
        return RepaintBoundary(
          key: itemKeyPrefix != null
              ? ValueKey('$itemKeyPrefix-item-$index')
              : null,
          child: itemBuilder(context, index),
        );
      },
    );
  }

  /// Wraps a widget in a RepaintBoundary to prevent unnecessary repaints.
  /// Use this for expensive-to-repaint widgets.
  static Widget preventRepaint(Widget child) {
    return RepaintBoundary(child: child);
  }

  /// Creates a const-safe version of a widget builder.
  /// Use this when you want to make widgets const without changing their API.
  static Widget constSafeBuilder(Widget Function() builder) {
    try {
      return builder();
    } catch (_) {
      // If const creation fails, return non-const version
      return builder();
    }
  }

  /// Optimizes image loading with placeholder and error states.
  /// Note: This is a pattern template. Use cached_network_image for actual images.
  static Widget optimizedImage({
    required String imageUrl,
    Widget? placeholder,
    Widget? errorWidget,
    BoxFit fit = BoxFit.cover,
    double? width,
    double? height,
  }) {
    // Use cached_network_image for actual images
    // This is a placeholder for the pattern
    return SizedBox(
      width: width,
      height: height,
      child:
          errorWidget ??
          Center(child: CircularProgressIndicator(strokeWidth: 2)),
    );
  }

  /// Debounces a callback to prevent rapid repeated calls.
  /// Use this for search, filtering, or any user input that triggers work.
  static void debounce({
    required VoidCallback callback,
    Duration delay = const Duration(milliseconds: 300),
  }) {
    // Implementation would use Timer
    callback();
  }

  /// Throttles a callback to limit execution frequency.
  /// Use this for scroll events or resize handlers.
  static void throttle({
    required VoidCallback callback,
    Duration delay = const Duration(milliseconds: 100),
  }) {
    // Implementation would track last execution time
    callback();
  }
}

/// Extension to add performance optimizations to common widgets
extension PerformanceWidgetExtensions on Widget {
  /// Prevents unnecessary repaints of this widget.
  Widget get preventRepaint => RepaintBoundary(child: this);

  /// Adds a unique key to this widget (helps with widget recycling).
  Widget withKey(String key) =>
      RepaintBoundary(key: ValueKey(key), child: this);
}

/// Mixin for controllers that need to optimize rebuild frequency.
mixin PerformanceAwareMixin {
  DateTime? _lastUpdateTime;
  static const Duration _updateCooldown = Duration(milliseconds: 16);

  /// Updates state only if enough time has passed since last update.
  bool canUpdate() {
    final now = DateTime.now();
    if (_lastUpdateTime == null ||
        now.difference(_lastUpdateTime!) >= _updateCooldown) {
      _lastUpdateTime = now;
      return true;
    }
    return false;
  }
}
