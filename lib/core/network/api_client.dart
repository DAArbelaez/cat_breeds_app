import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cat_breeds_app/core/network/api_client_logger.dart';
import 'package:http/http.dart';

/// Supported HTTP methods for API requests.
enum HttpMethod { get, post, put, delete, patch }

abstract class ApiClient {
  /// Performs an HTTP request to the given [endpoint].
  Future<T> request<T>(
    String endpoint, {
    required HttpMethod method,
    String? contentType,
    String? body,
    Map<String, String>? queryParams,
  });
}

class ApiClientImpl extends ApiClient {
  ApiClientImpl({required this.baseUrl, this.apiKey});

  final String? apiKey;
  final String baseUrl;

  Map<String, String> _headers({String? contentType}) {
    final headers = <String, String>{
      HttpHeaders.contentTypeHeader: contentType ?? 'application/json',
      if (apiKey != null) 'x-api-key': apiKey!,
    };
    return headers;
  }

  @override
  Future<T> request<T>(
    String endpoint, {
    required HttpMethod method,
    String? contentType,
    String? body,
    Map<String, String>? queryParams,
  }) async {
    final uri = Uri.parse('$baseUrl/$endpoint').replace(queryParameters: queryParams);

    final req = Request(method.name.toUpperCase(), uri);
    if (body != null) req.body = body;
    req.headers.addAll(_headers(contentType: contentType));

    final streamed = await req.send().timeout(const Duration(seconds: 5));
    final response = await Response.fromStream(streamed);

    return _handleResponse<T>(request: req, response: response);
  }
}

/// Handles logging, error checking, and JSON decoding of [response].
Future<T> _handleResponse<T>({required BaseRequest request, required Response response}) async {
  await ApiClientLogger.logResponse(request: request, response: response);

  if (response.statusCode < 200 || response.statusCode >= 300) {
    throw HttpException('HTTP ${response.statusCode}: ${response.reasonPhrase}', uri: request.url);
  }

  final decoded = json.decode(response.body);
  return decoded as T;
}
