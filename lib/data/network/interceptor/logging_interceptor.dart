import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_riverpod/constants/constants.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint(
        '${Constants.tag} REQUEST[${options.method}] => PATH: ${options.path}');
    debugPrint('${Constants.tag} Headers: ${options.headers}');
    debugPrint('${Constants.tag} Data: ${options.data}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        '${Constants.tag} RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    debugPrint('${Constants.tag} Data: ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint(
        '${Constants.tag} ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    debugPrint('${Constants.tag} Message: ${err.message}');
    super.onError(err, handler);
  }
}
