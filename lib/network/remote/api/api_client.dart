import 'package:dio/dio.dart';
import 'package:flutter_mvvm_riverpod/network/exception/custom_exception.dart';
import 'package:flutter_mvvm_riverpod/network/interceptor/error_interceptor.dart';
import 'package:flutter_mvvm_riverpod/network/interceptor/logging_interceptor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'api_client.g.dart';


@riverpod
ApiClient apiClient(Ref ref) {
  return ApiClient();
}

class ApiClient {
  static const String _baseUrl = 'https://example.com/api';
  static const int _timeout = 30000; // 30 seconds

  late final Dio _dio;

  ApiClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: const Duration(milliseconds: _timeout),
        receiveTimeout: const Duration(milliseconds: _timeout),
        sendTimeout: const Duration(milliseconds: _timeout),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _setupInterceptors();
  }

  void _setupInterceptors() {
    _dio.interceptors.addAll([
      LoggingInterceptor(),
      ErrorInterceptor(),
    ]);
  }

  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      return response.data as T;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<T> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response.data as T;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Exception _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return TimeoutException();
      case DioExceptionType.badResponse:
        return _handleResponseError(error.response);
      case DioExceptionType.cancel:
        return RequestCancelledException();
      case DioExceptionType.connectionError:
        return NoInternetException();
      default:
        return UnknownException();
    }
  }

  Exception _handleResponseError(Response? response) {
    if (response == null) return UnknownException();

    switch (response.statusCode) {
      case 400:
        return BadRequestException(response.data['message']);
      case 401:
        return UnauthorizedException();
      case 403:
        return ForbiddenException();
      case 404:
        return NotFoundException();
      case 500:
        return ServerException();
      default:
        return UnknownException();
    }
  }
}
