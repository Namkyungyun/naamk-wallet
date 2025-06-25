import 'package:logger/logger.dart';

class GlobalLogger {
  static Logger logger = Logger(
    // Customize the printer
    printer: PrettyPrinter(methodCount: 0),
  );

  static void info(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    logger.i(message, time: time, error: error, stackTrace: stackTrace);
  }

  static void error(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    logger.e(message, time: time, error: error, stackTrace: stackTrace);
  }
}
