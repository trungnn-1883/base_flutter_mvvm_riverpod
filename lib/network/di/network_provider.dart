import 'package:dio/dio.dart';
import 'package:flutter_mvvm_riverpod/network/builder/dio_builder.dart';
import 'package:flutter_mvvm_riverpod/network/remote/api/app_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'network_provider.g.dart';

@riverpod
Dio dioClient(Ref ref) {
  return DioBuilder();
}

@riverpod
AppApi appApi(Ref ref) {
  final dio = ref.watch(dioClientProvider);
  return AppApi(dio);
}
