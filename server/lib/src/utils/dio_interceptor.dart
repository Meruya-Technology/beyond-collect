import 'dart:developer' as developer;

import 'package:dio/dio.dart';

class DioInterceptor extends Interceptor {
  final bool logIsAllowed;

  DioInterceptor({
    this.logIsAllowed = true,
  });

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (logIsAllowed) {
      await logRequest(options);
    }
    handler.next(options);
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    if (logIsAllowed) {
      await logResponse(response);
    }
    handler.next(response);
  }

  @override
  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) {
    if (logIsAllowed) {
      logError(err);
    }
    handler.next(err);
  }

  Future<void> logRequest(RequestOptions request) async {
    var requestLog = '\n[Request url] ${request.uri.toString()}'
        '\n[Request header] ${request.headers.toString()}'
        '\n[Request param] ${request.queryParameters}'
        '\n[Request body] ${request.data}'
        '\n[Request method] ${request.method}'
        '\n[Request content-type] ${request.contentType}';
    developer.log(requestLog);
  }

  Future<void> logResponse(Response response) async {
    var responseLog = '\n[Response header] ${response.headers.toString()}'
        '\n[Response body] ${response.data}'
        '\n[Response code] ${response.statusCode}'
        '\n[Response message] ${response.statusMessage}'
        '\n[Response extra] ${response.extra}';
    developer.log(responseLog);
  }

  Future<void> logError(DioError err) async {
    var errorResponse = '\n[Error Response]'
        '\nHeaders : ${err.response?.headers.toString()}'
        '\nParams: ${err.response?.requestOptions.queryParameters.toString()}'
        '\nData : ${err.response?.data}'
        '\nStacktrace: ${err.stackTrace.toString()}';
    developer.log(errorResponse);
  }
}
