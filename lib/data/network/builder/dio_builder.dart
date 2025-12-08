import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mvvm_riverpod/data/network/interceptor/error_interceptor.dart';
import 'package:flutter_mvvm_riverpod/data/network/interceptor/logging_interceptor.dart';

class DioBuilder extends DioMixin {
  final String baseUrl = 'https://api.example.com/';
  final int connectTimeout = 30000; // in milliseconds
  final int receiveTimeout = 30000; // in milliseconds
  final currentBuildDebug = kDebugMode;

  DioBuilder({BaseOptions? options}) {
    if (options != null) {
      this.options = options;
    } else {
      this.options = BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: Duration(milliseconds: connectTimeout),
        receiveTimeout: Duration(milliseconds: receiveTimeout),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      interceptors.addAll([
        LogInterceptor(
          request: kDebugMode,
          responseBody: kDebugMode,
          requestBody: kDebugMode,
          error: kDebugMode,
          responseHeader: kDebugMode,
        ),
        ErrorInterceptor(),
        LoggingInterceptor(),
      ]);
    }
  }
}
