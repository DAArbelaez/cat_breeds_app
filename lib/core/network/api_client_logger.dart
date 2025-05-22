import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

enum LogLevel {
  info('info'),
  error('error');

  const LogLevel(this.name);
  final String name;
}

class ApiClientLogger {
  static Future<void> logResponse({
    required BaseRequest request,
    required Response response,
  }) async {
    try {
      final level = response.statusCode >= 200 && response.statusCode < 300
          ? LogLevel.info
          : LogLevel.error;

      Map<String, dynamic> requestBody = {};
      if (request is Request) {
        requestBody = request.body.isNotEmpty
            ? json.decode(request.body) as Map<String, dynamic>
            : {};
      }
      if (request is MultipartRequest) {
        requestBody = request.fields;
      }

      final requestInfo = {
        'statusCode': response.statusCode,
        if (level == LogLevel.error) 'body': json.decode(response.body),
        'request': _curlRequest(
          request.method,
          request.url.toString(),
          request.headers,
        ),
        'requestBody': requestBody,
      };

      log(response.body);
      log(jsonEncode(requestInfo), name: 'HttpClientResponse');
    } catch (e, st) {
      log('[logResponse] Error logging response', error: e, stackTrace: st);
    }
  }

  static String _curlRequest(
      String method,
      String url,
      Map<String, String> headers,
      ) {
    var curl = "curl -X $method '$url'";
    headers.forEach((k, v) {
      final safeValue = k.toLowerCase() == 'authorization' ? '[token]' : v;
      curl += " -H '$k: $safeValue'";
    });
    if (method != 'GET' && method != 'DELETE') {
      curl += " -d '<body>'";
    }
    return curl;
  }
}
