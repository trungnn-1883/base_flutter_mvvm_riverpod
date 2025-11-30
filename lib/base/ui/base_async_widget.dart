import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncValueWidget<T> extends ConsumerWidget {
  final AsyncValue<T> value;
  final Widget Function(BuildContext context, WidgetRef ref, T data) builder;
  final Widget? loading;
  final Widget Function(Object error, StackTrace st)? error;

  const AsyncValueWidget({
    super.key,
    required this.value,
    required this.builder,
    this.loading,
    this.error,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return value.maybeWhen(
      data: (data) => builder(context, ref, data),
      orElse: () => SizedBox(),
    );
  }
}
