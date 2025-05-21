import 'dart:async' show TimeoutException;

import 'package:logger/logger.dart';

class ErrorsHandler {
  static void handleError({required Object error, required String functionName, String? message}) {
    var logger = Logger();

    final errorMessage = _getErrorMessage(error, functionName, message);

    logger.e(errorMessage, error: error);
  }

  /// Takes an [Exception] and a [String] representing the function name where the error occurred.
  static String _getErrorMessage(Object error, String functionName, String? customMessage) {
    String initialErrorMessage = 'Exception in $functionName.';
    String errorMessage = error.toString();

    switch (error) {
      case TypeError _:
        {
          errorMessage = 'TypeError in $functionName while mapping.';
        }
      case TimeoutException _:
        {
          errorMessage = 'TimeoutException in $functionName.';
        }
    }
    var message = customMessage != null ? '\n\n$customMessage' : '';
    return '$initialErrorMessage Error: $errorMessage$message';
  }
}
