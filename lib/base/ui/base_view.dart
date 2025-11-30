import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseView<T> extends ConsumerWidget {
  const BaseView({
    super.key,
    required this.value,
  });

  final AsyncValue<T> value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return value.when(
      data: (data) => builder(context, ref, data),
      loading: () =>
          loading ?? const Center(child: CircularProgressIndicator()),
      error: (e, st) => error?.call(e, st) ?? Center(child: Text('Error: $e')),
    );
  }

  Widget builder(BuildContext context, WidgetRef ref, T data);

  Widget? get loading => null;

  Widget Function(Object, StackTrace)? get error => null;
}
