import 'dart:developer' as developer;

class AppLogger {
  void info(String message, {String? tag}) {
    developer.log(message, name: tag ?? 'TripAvail');
  }

  void error(
    String message, {
    Object? error,
    StackTrace? stackTrace,
    String? tag,
  }) {
    developer.log(
      message,
      name: tag ?? 'TripAvail',
      error: error,
      stackTrace: stackTrace,
    );
  }
}
